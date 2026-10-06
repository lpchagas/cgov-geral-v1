from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path


REQUIRED_FRONTMATTER = {
    "ato",
    "numero",
    "data",
    "fonte_pdf",
    "formato",
    "revisado_em",
}
SUSPICIOUS_PATTERNS = {
    "sequência de códigos de glifos": re.compile(r"(?:/[0-9A-F]{1,3}){5,}"),
    "artefato conhecido de OCR": re.compile(
        r"\b(?:CE/lCMBio|Cestão|DCE|SIO|Coordenação-GeraL)\b"
    ),
    "ordinal possivelmente confundido": re.compile(r"\b(?:Art\.|§)\s*\d+['’?]"),
}


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def parse_frontmatter(text: str) -> tuple[dict[str, str], str | None]:
    lines = text.splitlines()
    if not lines or lines[0].strip() != "---":
        return {}, "frontmatter YAML ausente"
    try:
        end = next(index for index, line in enumerate(lines[1:], 1) if line.strip() == "---")
    except StopIteration:
        return {}, "frontmatter YAML não foi fechado"
    values: dict[str, str] = {}
    for line in lines[1:end]:
        if not line.strip() or line.lstrip().startswith("#"):
            continue
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        values[key.strip()] = value.strip().strip('"\'')
    return values, None


def pipe_count(row: str) -> int:
    return sum(
        1
        for index, char in enumerate(row)
        if char == "|" and (index == 0 or row[index - 1] != "\\")
    ) - 1


def table_errors(lines: list[str]) -> tuple[list[str], int]:
    errors: list[str] = []
    tables = 0
    index = 0
    while index < len(lines):
        if not lines[index].startswith("|"):
            index += 1
            continue
        start = index
        rows: list[str] = []
        while index < len(lines) and lines[index].startswith("|"):
            rows.append(lines[index])
            index += 1
        tables += 1
        counts = [pipe_count(row) for row in rows]
        if len(rows) < 2:
            errors.append(f"tabela na linha {start + 1} sem cabeçalho/separador")
        elif len(set(counts)) != 1:
            errors.append(
                f"tabela nas linhas {start + 1}-{index} com colunas inconsistentes: {counts}"
            )
        separator_cells = [cell.strip() for cell in rows[1].strip("|").split("|")]
        if not separator_cells or not all(
            re.fullmatch(r":?-{3,}:?", cell) for cell in separator_cells
        ):
            errors.append(f"tabela na linha {start + 1} sem separador Markdown válido")
    return errors, tables


def validate(pdf: Path, markdown: Path) -> dict[str, object]:
    errors: list[str] = []
    warnings: list[str] = []
    if not pdf.is_file():
        errors.append(f"PDF inexistente: {pdf}")
    elif not pdf.read_bytes().startswith(b"%PDF-"):
        errors.append("arquivo de origem não possui cabeçalho PDF")
    if not markdown.is_file():
        errors.append(f"Markdown inexistente: {markdown}")
        return {"pdf": str(pdf), "markdown": str(markdown), "errors": errors, "warnings": warnings}

    try:
        text = markdown.read_bytes().decode("utf-8", errors="strict")
    except UnicodeDecodeError as exc:
        errors.append(f"Markdown não é UTF-8 válido: {exc}")
        return {"pdf": str(pdf), "markdown": str(markdown), "errors": errors, "warnings": warnings}

    lines = text.splitlines()
    if "\ufffd" in text:
        errors.append("há caracteres de substituição U+FFFD")
    controls = sorted(
        {ord(char) for char in text if ord(char) < 32 and char not in "\n\r\t"}
    )
    if controls:
        errors.append(f"há caracteres de controle inválidos: {controls}")
    if len(text.split()) < 20:
        errors.append("texto curto demais para um ato normativo")

    frontmatter, frontmatter_error = parse_frontmatter(text)
    if frontmatter_error:
        errors.append(frontmatter_error)
    else:
        missing = sorted(REQUIRED_FRONTMATTER - set(frontmatter))
        if missing:
            errors.append(f"campos obrigatórios ausentes no frontmatter: {missing}")
        if frontmatter.get("fonte_pdf") != pdf.name:
            errors.append(
                "fonte_pdf não corresponde ao nome do PDF: "
                f"{frontmatter.get('fonte_pdf')!r} != {pdf.name!r}"
            )

    h1_lines = [index + 1 for index, line in enumerate(lines) if line.startswith("# ")]
    if len(h1_lines) != 1:
        errors.append(f"esperado um único título H1; encontrados {len(h1_lines)}")
    if text.count("~~") % 2:
        errors.append("marcadores de texto tachado estão desbalanceados")

    detected_articles = re.findall(
        r"(?m)^(?:~~\s*)?Art\.\s*(\d+(?:-[A-Z])?)", text
    )
    if not detected_articles:
        errors.append("nenhum artigo foi detectado no início de linha")
    table_problem_list, tables = table_errors(lines)
    errors.extend(table_problem_list)

    for label, pattern in SUSPICIOUS_PATTERNS.items():
        matches = [
            index + 1 for index, line in enumerate(lines) if pattern.search(line)
        ]
        if matches:
            warnings.append(f"{label} nas linhas {matches[:10]}")

    result: dict[str, object] = {
        "pdf": str(pdf.resolve()),
        "markdown": str(markdown.resolve()),
        "ok": not errors,
        "errors": errors,
        "warnings": warnings,
        "metrics": {
            "bytes": markdown.stat().st_size,
            "lines": len(lines),
            "words": len(text.split()),
            "h1": len(h1_lines),
            "articles": detected_articles,
            "tables": tables,
            "strike_markers": text.count("~~"),
            "pdf_sha256": sha256(pdf) if pdf.is_file() else None,
            "markdown_sha256": sha256(markdown),
        },
    }
    return result


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Executa verificações estruturais em uma transcrição normativa."
    )
    parser.add_argument("--pdf", required=True, type=Path)
    parser.add_argument("--markdown", required=True, type=Path)
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()
    result = validate(args.pdf, args.markdown)
    if args.json:
        print(json.dumps(result, ensure_ascii=False, indent=2))
    else:
        state = "APROVADO" if result.get("ok") else "REPROVADO"
        print(f"{state}: {args.markdown}")
        for error in result.get("errors", []):
            print(f"ERRO: {error}")
        for warning in result.get("warnings", []):
            print(f"AVISO: {warning}")
        print(json.dumps(result.get("metrics", {}), ensure_ascii=False, indent=2))
    return 0 if result.get("ok") else 1


if __name__ == "__main__":
    raise SystemExit(main())
