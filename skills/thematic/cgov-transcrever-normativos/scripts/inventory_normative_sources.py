from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import subprocess
from pathlib import Path


ACT_PATTERN = re.compile(
    r"\b(?:lei|decreto|portaria|instru[cç][aã]o normativa|resolu[cç][aã]o|"
    r"medida provis[oó]ria|delibera[cç][aã]o)\b",
    re.IGNORECASE,
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def pdf_pages(path: Path) -> int | None:
    executable = shutil.which("pdfinfo")
    if not executable:
        return None
    completed = subprocess.run(
        [executable, str(path)],
        capture_output=True,
        text=True,
        encoding="utf-8",
        errors="replace",
        check=False,
    )
    if completed.returncode != 0:
        return None
    match = re.search(r"(?m)^Pages:\s+(\d+)\s*$", completed.stdout)
    return int(match.group(1)) if match else None


def describe(pdf: Path, include_hashes: bool) -> dict[str, object]:
    markdown = pdf.with_suffix(".md")
    searchable_name = pdf.stem.replace("_", " ").replace("-", " ")
    likely_normative_act = bool(ACT_PATTERN.search(searchable_name))
    if markdown.exists():
        status = "paired"
    elif likely_normative_act:
        status = "pending"
    else:
        status = "review-scope"
    result: dict[str, object] = {
        "pdf": pdf.name,
        "pdf_bytes": pdf.stat().st_size,
        "pages": pdf_pages(pdf),
        "markdown": markdown.name if markdown.exists() else None,
        "markdown_bytes": markdown.stat().st_size if markdown.exists() else None,
        "likely_normative_act": likely_normative_act,
        "status": status,
    }
    if include_hashes:
        result["pdf_sha256"] = sha256(pdf)
        result["markdown_sha256"] = sha256(markdown) if markdown.exists() else None
    return result


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Inventaria PDFs normativos e seus arquivos Markdown correspondentes."
    )
    parser.add_argument("directory", type=Path)
    parser.add_argument("--recursive", action="store_true")
    parser.add_argument("--hashes", action="store_true")
    parser.add_argument("--json", action="store_true")
    args = parser.parse_args()

    directory = args.directory.resolve()
    if not directory.is_dir():
        parser.error(f"diretório inexistente: {directory}")

    iterator = directory.rglob("*.pdf") if args.recursive else directory.glob("*.pdf")
    pdfs = sorted(iterator, key=lambda path: path.name.casefold())
    records = [describe(path, args.hashes) for path in pdfs]
    pdf_stems = {path.stem.casefold() for path in pdfs}
    md_iterator = directory.rglob("*.md") if args.recursive else directory.glob("*.md")
    orphan_markdown = sorted(
        path.name for path in md_iterator if path.stem.casefold() not in pdf_stems
    )
    payload = {
        "directory": str(directory),
        "summary": {
            "pdfs": len(records),
            "paired": sum(record["status"] == "paired" for record in records),
            "pending": sum(record["status"] == "pending" for record in records),
            "review_scope": sum(record["status"] == "review-scope" for record in records),
            "orphan_markdown": len(orphan_markdown),
        },
        "records": records,
        "orphan_markdown": orphan_markdown,
    }

    if args.json:
        print(json.dumps(payload, ensure_ascii=False, indent=2))
    else:
        print(f"Diretório: {directory}")
        for record in records:
            pages = record["pages"] if record["pages"] is not None else "?"
            print(f"[{record['status']}] {record['pdf']} | páginas={pages}")
        summary = payload["summary"]
        print(
            f"PDFs={summary['pdfs']} | pareados={summary['paired']} | "
            f"pendentes={summary['pending']} | revisar escopo={summary['review_scope']} | "
            f"Markdown sem PDF={summary['orphan_markdown']}"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
