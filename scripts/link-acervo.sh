#!/usr/bin/env bash
# Cria ou atualiza os links local/normative-sources, local/acervo-drive e
# local/analyses
# a partir das variáveis definidas em .env (modelo: .env.example).
# Uso: bash scripts/link-acervo.sh
set -euo pipefail
cd "$(dirname "$0")/.."
[ -f .env ] || { echo "  [PARE] .env não encontrado — copie .env.example para .env e ajuste"; exit 1; }
set -a; . ./.env; set +a

vincular() {  # vincular <variável> <link>
  local var=$1 link=$2 alvo=${!1:-}
  [ -n "$alvo" ] || { echo "  [PARE] $var não definida em .env"; exit 1; }
  [ -d "$alvo" ] || { echo "  [PARE] $var aponta para pasta inexistente: $alvo"; exit 1; }
  if [ -e "$link" ] && [ ! -L "$link" ]; then
    echo "  [PARE] $link existe e não é um link — não sobrescrevo"; exit 1
  fi
  if [ "$(readlink "$link" 2>/dev/null)" = "$alvo" ]; then
    echo "  [OK] $link -> $alvo (sem mudança)"
  else
    ln -sfn "$alvo" "$link"; echo "  [OK] $link -> $alvo"
  fi
}

mkdir -p local
vincular CGOV_NORMATIVE_SOURCES local/normative-sources
vincular CGOV_ACERVO_DRIVE local/acervo-drive
vincular CGOV_ANALYSES local/analyses
