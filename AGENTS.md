# Instruções operacionais para agentes — Escritório CGOV

Este repositório apoia a Coordenação de Governança (CGOV/ICMBio) na elaboração
de Notas Técnicas, análises normativas e instrumentos de governança. A base de
competência é o art. 37 da Portaria ICMBio nº 5.592/2025.

## Fonte de instruções

- Instruções do projeto: [`docs/system-instructions/escritorio-cgov.md`](docs/system-instructions/escritorio-cgov.md).
- Assistente de processos SEI: [`docs/system-instructions/analista-processos-sei.md`](docs/system-instructions/analista-processos-sei.md).
- Registro de decisões: [`docs/governance/decision-log.md`](docs/governance/decision-log.md).
- Arquitetura e manutenção: [`docs/architecture.md`](docs/architecture.md).
- Compatibilidade com Claude, ChatGPT e Antigravity: [`docs/multiplatform.md`](docs/multiplatform.md).

## Regras obrigatórias

1. Para qualquer Nota Técnica ou parecer da CGOV, inicie por `cgov-nt-01-triagem`.
2. Use as fontes em `local/normative-sources/` somente no ambiente local; elas
   não integram o repositório público. O catálogo público está em
   [`docs/references/normative-catalog.md`](docs/references/normative-catalog.md).
3. Registre análises de processos, dados brutos e produtos intermediários em
   `local/analyses/`. Esse diretório é ignorado pelo Git e não deve ser publicado.
4. A prosa de Notas Técnicas usa presente do indicativo; capítulos usam
   `### Capítulo N` e subseções `#### N.1`; nunca invente dados ou referências
   normativas.
5. Alterações em fontes de skills exigem atualização sincronizada do snapshot
   instalado quando aplicável e registro no decision log.

## Estrutura relevante

- `skills/cgov-nt/`: fonte canônica da suíte de Notas Técnicas.
- `skills/thematic/`: fontes das skills temáticas da CGOV.
- `local/installed-reference/`: snapshots locais de referência de skills instaladas.
- `local/normative-sources/` e `local/acervo-drive/`: links para o acervo no Google Drive (PDFs e imagens);
  destinos definidos em `.env` (modelo: `.env.example`) e recriados com `scripts/link-acervo.sh`.
- `archive/`: local reservado a histórico já sanitizado para publicação.
- `local/`: acervo interno e workspaces de análise, fora do Git.
