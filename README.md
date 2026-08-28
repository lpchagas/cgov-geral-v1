# Escritório CGOV

Repositório público sanitizado da Coordenação de Governança (CGOV/ICMBio) para
manutenção de skills, documentação metodológica e instruções de assistentes.

## Conteúdo

- [Visão geral](docs/overview.md) e [arquitetura](docs/architecture.md).
- [Skills canônicas](skills/cgov-nt/) e [skills temáticas](skills/thematic/).
- [Instruções de assistentes](docs/system-instructions/).
- [Catálogo de fontes normativas](docs/references/normative-catalog.md).
- [Registro de decisões](docs/governance/decision-log.md).

## Política de dados

O repositório não publica processos SEI, dados de consultas, rascunhos de
trabalho nem cópias locais de fontes normativas. Esses materiais permanecem em
`local/`, que é integralmente ignorado pelo Git. O catálogo público referencia
fontes oficiais sem redistribuir PDFs ou materiais de terceiros.

## Estado do projeto

A suíte `cgov-nt-01` a `cgov-nt-07` é a fonte canônica para elaboração de Notas
Técnicas. Material histórico ainda não sanitizado e snapshots instalados ficam
preservados em `local/archive/` e `local/installed-reference/`, fora do Git.

Consulte [CONTRIBUTING.md](CONTRIBUTING.md) antes de propor mudanças.
