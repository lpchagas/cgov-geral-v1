# Resumo Estruturado — Suíte `cgov-nt` e Escritório de Trabalho da CGOV

> **Nota de migração:** referências a caminhos numerados registram a estrutura
> histórica. Para caminhos operacionais vigentes, consulte `README.md` e
> `docs/architecture.md`.

## O que existe hoje

| Item | Onde | Status |
|---|---|---|
| Suíte canônica `cgov-nt-01` a `07` | Instalada na conta Claude (Customize → Skills) + código-fonte em `skills/cgov-nt` | ✅ Ativa, validada por piloto |
| 13 skills antigas (`pgd-sk*`, `pspeadbio-sk*`) | Removidas da conta Claude; backup em `archive/skills-legacy` | ❌ Desativadas (backup disponível) |
| Skills genéricas pré-existentes (`cgov-comparar-versoes`, `cgov-modelar-fluxo`, `cgov-auditoria-competencias`, `cgov-saneamento-legistica`, `cgge-especialista-pgd`, `cgov-elaborar-entrega`, `cgov-avaliar-entrega`, `cgov-registro-execucao`) | Continuam instaladas, não foram tocadas | ✅ Ativas |
| Relatório técnico completo (diagnóstico + arquitetura + revisão + piloto) | `docs/reports/RELATORIO_cgov-nt.md` | ✅ |
| Artefatos do piloto | `docs/reports/NT_ESTADO_piloto.md` | ✅ |
| Fontes normativas | `local/normative-sources` (local) + catálogo público | ✅ |
| System Instructions independente | `docs/system-instructions/analista-governanca.md` | ✅ versão canônica v3 |
| Catálogo normativo público | `docs/references/normative-catalog.md` | ✅ |
| PDF completo da Portaria nº 5.592/2025 | Ainda apenas em `C:\Users\leand\My Drive\CGOV\CGOV_Normativas\` (não copiado — ver limitação na Seção 11.3 do relatório) | ⚠️ Cópia manual pendente, se desejada |
| Skills temáticas do Art. 37 | Instaladas na conta Claude; código-fonte em `skills/thematic/` | ✅ |
| System Instructions do Analista de Processos SEI | `docs/system-instructions/analista-processos-sei.md` | ✅ v7.2 |
| Análises e produtos de skills por processo SEI | `local/analyses/SEI_[processo]_[apelido]/` | ✅ fora do Git |
| Suíte `cgov-nt-01` a `07` | Cria/lê `NT_ESTADO.md` em `local/analyses/` | ✅ |

## A suíte `cgov-nt`, em uma tabela

| Skill | Capítulo/função da NT | Sempre necessária? |
|---|---|---|
| `cgov-nt-01-triagem` | Enquadramento regimental + roteiro (cria `NT_ESTADO.md`) | **Sim, sempre a primeira** |
| `cgov-nt-02-instrucao` | Análise de dados brutos (quantitativa/qualitativa/perfil) | Só se houver dados brutos |
| `cgov-nt-03-introducao` | Capítulo 1 — Introdução | Sim |
| `cgov-nt-04-diagnostico` | Capítulos 2-3 — Diagnóstico e Achados | Sim |
| `cgov-nt-05-propostas` | Capítulo 4 — Propostas de Ajuste | Se houver recomendações a propor |
| `cgov-nt-06-quesitos-pfe` | Subitem 4.4 — Quesitos do Anexo II (Portaria 271/2013) | Só se a NT for subsidiar a PFE |
| `cgov-nt-07-conclusao` | Capítulo 5 — Conclusão e Encaminhamentos | Sim, sempre a última |

## Regras de redação fixadas pela suíte (aplicam-se a qualquer NT da CGOV)

- Prosa da NT: **presente do indicativo**. Futuro simples só no texto do
  próprio ato normativo (dispositivo/artigo), nunca na prosa analítica.
- Capítulos como `### Capítulo N — [Nome]`; subseções `#### N.1`, `#### N.2`
  reiniciadas por capítulo (nunca `4.N.M`).
- Proposição final em `(i), (ii), (iii)`; Encaminhamentos em lista com
  destinatário em **negrito**.
- Nunca inventar número de norma, artigo ou dado quantitativo — sinalizar
  lacuna explicitamente.
- Saída sempre em Markdown; nunca gerar `.docx` diretamente.

## As 4 correções feitas com base em evidência real (piloto + Portaria 271/2013)

1. Necessidade de PFE depende do **destino do produto**, não do tipo de dado.
2. Numeração de capítulo: `### Capítulo N` / `#### N.1` (não `4.1.1`).
3. Tempo verbal: presente na prosa da NT (não futuro simples).
4. Quesitos PFE: os 8 reais do Anexo II (a tabela antiga tinha só 4 corretos e
   2 que não pertencem ao Anexo II).

## Cobertura do Art. 37 (parágrafo único) após 04/08/2026

| Inciso | Competência | Skill |
|---|---|---|
| I | Coordenação dos processos organizacionais | `cgov-elaborar-entrega`, `cgov-avaliar-entrega`, `cgov-registro-execucao` |
| II | Política de Governança Institucional | suíte `cgov-nt`, `cgge-especialista-pgd` |
| III | Gestão por processos | `cgov-modelar-fluxo`, `cgov-auditoria-competencias`, `cgov-cadeia-valor` |
| IV | Regimento Interno | `cgov-regimento-interno` |
| V | Quadro de Cargos e Funções (QCF) | ❌ **sem skill dedicada** |
| VI | Cadeia de Valor / DFT | `cgov-cadeia-valor` |
| VII | PGD (com a CGGP) | `cgge-especialista-pgd`, `cgov-*-entrega` |
| VIII | PGR — Gestão para Resultados | `cgov-pgr` |
| IX | Gestão de Riscos / CTGRIC | `cgov-gestao-riscos` |
| X | AIR / ARR | `cgov-air-arr` |

**9 de 10 incisos cobertos.**

## Pendências

- ~~Validação pessoal do Coordenador sobre o texto do Art. 37~~ — ✅ **Resolvida
  em 05/07/2026.**
- ~~Instalação das novas skills propostas~~ — ✅ **Concluída em 04/08/2026.**
- ~~Divergência `DIPLAN` × `GABIN` no cabeçalho da NT~~ — ✅ **resolvida em
  04/08/2026:** `Nota Técnica nº [#]/[ano]/CGOV/CGGE/GABIN/ICMBio`.
- ~~Portarias internas ausentes de `04_fontes_normativas/`~~ — ✅ acervo
  depositado em 04/08/2026. As Portarias nº 255/2020, nº 975/2021 e
  nº 1.572/2023 estão legíveis e já foram incorporadas às skills.
- ~~Legibilidade das Portarias nº 4.101/2023, nº 1.164/2025 e nº 253/2026~~ —
  ✅ resolvida em 14/08/2026 por novos uploads com texto legível; os dispositivos
  são citáveis após conferência no acervo.
- ~~Confirmar se a Portaria nº 253/2026 substituiu o Integra+ (nº 923/2020)~~ —
  ✅ resolvida: nº 923/2020 → nº 1.257/2022 → nº 253/2026 (vigente). A remissão
  da Portaria nº 975/2021 à nº 923/2020 está desatualizada.
- ~~Atualizar `cgov-analista-governanca_v2.md`~~ — ✅ concluída em 14/08/2026:
  substituído por `cgov-analista-governanca_v3.md`.
- Editar arquivo em `05_novas_skills_propostas/` **não** altera a skill
  instalada — é preciso reinstalar com sobrescrita.
- ~~As 7 skills da suíte `cgov-nt` ainda instruem, em seu texto literal, criar
  `NT_ESTADO.md` "na raiz do projeto"~~ — ✅ **Resolvida em 05/08/2026:** as 7
  skills foram reescritas e reinstaladas para criar/ler `NT_ESTADO.md`
  diretamente em `07_analises/[processo SEI]_[apelido]/` (ver
  `REGISTRO_DECISOES.md`, Seção 13).

## Convenção de siglas — fixada em 04/08/2026

| Sigla | Significado | Norma | Art. 37, § único |
|---|---|---|---|
| **PGR** | Programa de Gestão para Resultados e Inovação | Portaria ICMBio nº 1.572/2023 | VIII |
| **PGRI** | Política de Gestão de Riscos e Integridade | Portaria ICMBio nº 255/2020 | IX |
| **PGD** | Programa de Gestão e Desempenho (teletrabalho) | IN ICMBio nº 14/2025 | VII |
| **PGE** | Política de Gestão Estratégica | Portaria ICMBio nº 768/2020 | — |

Nunca escrever "PGR de riscos", "PGR (riscos)" nem "Plano de Gestão de Riscos —
PGR". Detalhamento em `04_fontes_normativas/INDICE_FONTES_NORMATIVAS.md`.
- Cópia do PDF completo da Portaria nº 5.592/2025 para `04_fontes_normativas`
  — não foi possível com as ferramentas desta sessão (só gravam texto, não
  binário); cópia manual sugerida, se desejada.
- ~~Execução dos casos de eval ainda não exercitados.~~ — ✅ concluída em
  28/08/2026: 12 de 12 casos aprovados. Os `evals.json` vigentes têm 15 casos
  no total, e não 16 como constava do registro anterior; ver
  `01_relatorios/RELATORIO_EVALS_cgov-nt_2026-08-28.md`.
## Próximos passos sugeridos

1. Testar as 5 skills recém-instaladas em um caso real de cada eixo.
2. Testar a suíte `cgov-nt` em um processo novo, do início ao fim, antes de
   divulgar aos demais servidores da CGOV.
3. Avaliar a criação de `cgov-qcf` (Art. 37, V — Quadro de Cargos e Funções
   Comissionadas) — o único inciso ainda sem skill dedicada.
