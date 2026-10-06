#!/usr/bin/env bash
# Publica a versão confirmada (HEAD) do repositório para o fluxo operacional:
#   1. gera dist/skills/<skill>.zip para reinstalar no Claude (Customize → Skills);
#   2. copia docs/ para a referência só-leitura do Cowork (CGOV_REFERENCIA, no .env);
#   3. compara as skills instaladas na conta com a fonte e lista o que reinstalar.
# Publica somente o que já está em commit; alterações não confirmadas bloqueiam.
# Uso: bash scripts/publicar-operacao.sh            (publica)
#      bash scripts/publicar-operacao.sh --verificar (só o passo 3)
set -euo pipefail
cd "$(dirname "$0")/.."
ok(){ printf '  [OK] %s\n' "$*"; }; falha(){ printf '  [PARE] %s\n' "$*"; exit 1; }

verificar_instaladas() {
  echo "== Skills instaladas na conta x fonte (HEAD)"
  python3 - <<'PY'
import glob, os, re, subprocess, sys
try:
    import yaml
except ImportError:
    yaml = None
sync = glob.glob(os.path.expanduser('~/.claude/skills/synced/*/'))
if not sync:
    print("  [AVISO] ~/.claude/skills/synced não encontrado; abra o Claude Code uma vez com a conta conectada")
    sys.exit(0)
def partes(texto):
    m = re.match(r'---\n(.*?)\n---\n(.*)', texto, re.S)
    meta = yaml.safe_load(m.group(1)) if yaml else m.group(1)
    if isinstance(meta, dict):
        meta = {k: str(meta.get(k) or '').strip() for k in ('name', 'description')}
    return meta, m.group(2).strip()
arquivos = subprocess.run(['git', 'ls-tree', '-r', '--name-only', 'HEAD', 'skills/'],
                          capture_output=True, text=True, check=True).stdout.split()
reinstalar = []
for f in sorted(a for a in arquivos if a.endswith('/SKILL.md') and '-workspace/' not in a):
    nome = f.split('/')[-2]
    fonte = subprocess.run(['git', 'show', f'HEAD:{f}'], capture_output=True, text=True, check=True).stdout
    inst = os.path.join(sync[0], nome, 'SKILL.md')
    if not os.path.exists(inst):
        estado = 'NÃO INSTALADA'
    else:
        estado = 'igual' if partes(fonte) == partes(open(inst, encoding='utf-8').read()) else 'DESATUALIZADA'
    if estado != 'igual':
        reinstalar.append(nome)
    print(f"  {estado:14} {nome}")
print(f"\n  Reinstalar no Claude: {', '.join(reinstalar) if reinstalar else 'nenhuma'}")
PY
}

if [ "${1:-}" = "--verificar" ]; then verificar_instaladas; exit 0; fi

echo "== Pré-condições"
[ -f .env ] || falha ".env não encontrado (modelo: .env.example)"
set -a; . ./.env; set +a
[ -n "${CGOV_REFERENCIA:-}" ] || falha "CGOV_REFERENCIA não definida em .env"
[ -d "$(dirname "$CGOV_REFERENCIA")" ] || falha "pasta-mãe de CGOV_REFERENCIA não existe: $CGOV_REFERENCIA"
git diff --quiet HEAD -- skills docs || falha "há alterações sem commit em skills/ ou docs/ — faça o commit antes de publicar"
VERSAO=$(git rev-parse --short HEAD)
ok "publicando o commit $VERSAO"

TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
git archive HEAD skills docs | tar -x -C "$TMP"

echo "== Pacotes das skills (dist/skills/)"
rm -rf dist/skills; mkdir -p dist/skills
python3 - "$TMP" dist/skills <<'PY'
import os, sys, zipfile
raiz, destino = sys.argv[1], sys.argv[2]
for familia in sorted(os.listdir(os.path.join(raiz, 'skills'))):
    base = os.path.join(raiz, 'skills', familia)
    for nome in sorted(os.listdir(base)):
        pasta = os.path.join(base, nome)
        if nome.endswith('-workspace') or not os.path.isfile(os.path.join(pasta, 'SKILL.md')):
            continue
        with zipfile.ZipFile(os.path.join(destino, f'{nome}.zip'), 'w', zipfile.ZIP_DEFLATED) as z:
            for atual, dirs, arqs in os.walk(pasta):
                dirs[:] = [d for d in dirs if d != 'evals']  # evals são do fluxo de desenvolvimento
                for a in sorted(arqs):
                    caminho = os.path.join(atual, a)
                    z.write(caminho, os.path.join(nome, os.path.relpath(caminho, pasta)))
        print(f"  [OK] {nome}.zip")
PY

echo "== Referência do Cowork ($CGOV_REFERENCIA)"
mkdir -p "$CGOV_REFERENCIA"
rsync -rt --no-perms --delete "$TMP/docs/" "$CGOV_REFERENCIA/docs/"
cat > "$CGOV_REFERENCIA/LEIA-ME.md" <<EOF
# Referência publicada do cgov-geral-v1 — somente leitura

- Versão: commit \`$VERSAO\` ($(date '+%d/%m/%Y %H:%M'))
- Fonte: https://github.com/lpchagas/cgov-geral-v1
- Gerada por \`scripts/publicar-operacao.sh\`; cada publicação substitui todo o conteúdo.

Não edite estes arquivos: alterações aqui se perdem na próxima publicação.
Correções vão para o fluxo de desenvolvimento (ver \`docs/fluxos-de-trabalho.md\`).
EOF
ok "docs/ copiado ($(find "$CGOV_REFERENCIA/docs" -type f | wc -l) arquivos)"

verificar_instaladas
echo
echo "Concluído. Para cada skill a reinstalar: Claude → Customize → Skills → enviar dist/skills/<skill>.zip (substituir)."
echo "Pasta dos pacotes no Windows: \\\\wsl.localhost\\Ubuntu$(pwd | sed 's|/|\\|g')\\dist\\skills"
