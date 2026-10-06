# Compatibilidade multiplataforma — Claude, ChatGPT, Antigravity

> Proposta registrada em 28/08/2026; pendências 1 e 2 executadas em
> 29/08/2026 (ver `docs/governance/decision-log.md`).

## 1. O que cada aplicativo lê hoje

| Aplicativo / superfície | O que lê automaticamente | Mecanismo |
|---|---|---|
| **Claude Code** (este repositório aberto localmente) | `CLAUDE.md` (raiz) | Nativo. `CLAUDE.md` importa `AGENTS.md` via `@AGENTS.md` — Claude Code **não** lê `AGENTS.md` diretamente, só via esse import. |
| **Claude Cowork** (projeto "Escritório CGOV") | Campo de instruções do projeto + pasta vinculada | Manual: colar `docs/system-instructions/escritorio-cgov.md` no campo de instruções; pasta vinculada = pasta CGOV do Google Drive, não este repositório; skills instaladas via Customize → Skills a partir de `dist/skills/` (ver `fluxos-de-trabalho.md`). |
| **Antigravity IDE** (repositório aberto como workspace) | `AGENTS.md` (regras) + `.agents/skills/*/SKILL.md` (skills) | Regras nativas desde a IDE 1.20.5. Skills: **resolvido em 29/08/2026** — ver Seção 2. |
| **OpenAI Codex** (CLI, app desktop ou a superfície de código dentro do ChatGPT) | `AGENTS.md` + `.codex/config.toml` | Nativo — mesmo `AGENTS.md` que a Antigravity lê. Já antecipado: `.gitignore` já ignora `/.codex/`. Codex não tem conceito de "Skill"/`SKILL.md` — só arquivo de instruções. |
| **ChatGPT desktop / Projects** (sem acesso a este repositório) | Nada automaticamente | Manual: colar o núcleo de `analista-governanca.md` no campo "Instructions" do Project + anexar os dois anexos à Library do Project — ver Seção 3. |
| **Gemini Gems** (mesmo caso de "sem acesso a arquivos") | Nada automaticamente | Mesmo núcleo acima, com ressalva de tamanho — ver Seção 3.3. |

## 2. Antigravity não enxergava as skills — resolvido

A Antigravity carrega skills de `<raiz-do-projeto>/.agents/skills/<nome>/SKILL.md` (escopo de workspace). As 13 skills deste projeto vivem em `skills/cgov-nt/` e `skills/thematic/` — fora desse caminho.

**Executado em 29/08/2026:** criado `.agents/skills/` com uma cópia de cada uma das 13 `SKILL.md` (mesmos nomes de pasta). `skills/` continua sendo a única fonte de verdade — o mesmo papel que `local/installed-reference/` já cumpre para as skills instaladas no Claude. `.gitignore` já ignorava `/.agents/`, então o espelho nunca é versionado, consistente com ser derivado, não original. A skill `cgov-transcrever-normativos` referencia seus utilitários diretamente em `skills/thematic/cgov-transcrever-normativos/scripts/`; esses scripts não são duplicados no espelho.

**Regra de resincronização registrada em `CONTRIBUTING.md`:** qualquer edição em `skills/**/SKILL.md` exige regerar o arquivo correspondente em `.agents/skills/` antes da próxima sessão na Antigravity — mesmo comando de cópia usado na criação inicial. Isto evita repetir o problema já registrado duas vezes neste projeto (decision-log, §§10–11 e 14): uma cópia divergindo silenciosamente da fonte.

**Limite verificado:** cada `SKILL.md` de `.agents/skills/` fica abaixo do teto de 12.000 caracteres por arquivo de regras da Antigravity; a nova skill operacional, atualmente a maior, tem aproximadamente 7.300 caracteres.

## 3. O documento para ChatGPT/Gemini excedia o limite do campo — resolvido para o ChatGPT, ressalva para o Gemini

### 3.1. O que foi medido

| Arquivo | Tamanho original | Limite do campo Instructions de um Project no ChatGPT |
|---|---|---|
| `docs/system-instructions/analista-governanca.md` (v3.0) | 56.199 caracteres | **8.000 caracteres** (Custom Instructions global: 5.000, usuários pagos, desde jul/2026) |
| `AGENTS.md` | 2.353 caracteres | Regras da Antigravity: 12.000 — folga confortável |

Colar o texto de 56.199 caracteres seria truncado pelo ChatGPT sem aviso, arriscando cortar justamente os guardrails do final do documento.

### 3.2. Correção de rota — `analista-processos-sei.md` não tinha esse problema

Na proposta anterior, este arquivo (58.146 caracteres) foi listado ao lado de `analista-governanca.md` como se tivesse o mesmo destino. **Isso estava errado** — a leitura integral do arquivo mostrou que seu próprio cabeçalho declara `**Ambiente de execução:** Claude Cowork — projeto "Escritório CGOV"` e todo o Capítulo 3 roteia para skills reais do Claude (`cgov-nt-01-triagem`, `cgov-gestao-riscos` etc.), que não existem fora do Claude. Não é um documento autossuficiente para ChatGPT/Gemini — é um terceiro documento de instruções dentro do próprio Claude Cowork, ao lado de `escritorio-cgov.md` e da suíte de skills.

Isso não é uma lacuna de compatibilidade — é uma sobreposição a registrar: três fontes (`escritorio-cgov.md`, `analista-processos-sei.md` e as próprias skills) orientam comportamento parecido dentro do mesmo ambiente Claude. Não alterei essa estrutura nesta rodada porque redesenhá-la é uma decisão de escopo maior do que corrigir um limite de campo — fica como pendência para você decidir (Seção 5).

### 3.3. `analista-governanca.md` — dividido

Executado em 29/08/2026: o documento (v3.0) foi arquivado em `local/archive/system-instructions/analista-governanca-v3.md` e substituído por três arquivos (v4.0):

| Arquivo | Papel | Tamanho |
|---|---|---|
| `docs/system-instructions/analista-governanca.md` | **Núcleo** — persona, siglas, cadeia de raciocínio, guardrails, protocolo de incerteza, lista das 9 funções. Cole no campo Instructions. | **7.868 caracteres** |
| `docs/system-instructions/analista-governanca-anexo-normativo.md` | Base normativa completa (Art. 37 integral, Tabelas 3–13 de riscos, AIR/ARR, Anexo II). Anexe à Library do Project. | 24.884 caracteres |
| `docs/system-instructions/analista-governanca-anexo-funcoes.md` | Templates completos das 9 funções (F1–F9). Anexe à Library do Project. | 15.004 caracteres |

O núcleo tem 132 caracteres de folga sob o teto de 8.000 — margem apertada, não confortável. Qualquer edição futura deve remedir com `wc -m` antes de publicar.

**Não verificado:** se o conteúdo normativo condensado no núcleo (siglas, guardrails) preserva integralmente o sentido da v3.0 — fiz a condensação eu mesmo, sem segunda verificação humana. Como é a peça que vale como guardrail em produção fora do Claude, recomendo sua revisão antes de colar em um Project real.

### 3.4. Limite de instruções de um Gem (Gemini) — pesquisado, resultado inconclusivo

Fontes públicas divergem muito: de "200–400 caracteres é o ideal" e "500–2.000 é a faixa segura" até "~4.000" e uma menção isolada de dezenas de milhares — sem uma fonte oficial única e confiável. **Não assumo nenhum desses números como o limite real.**

Na prática, mesmo o extremo mais permissivo (~4.000) é menor que os 7.868 caracteres do núcleo atual — feito para caber no ChatGPT, não no Gemini. Se for usar este núcleo num Gem, teste colando-o e observando se o Gemini trunca ou avisa; se preferir não arriscar, uma segunda condensação (~3.500 caracteres, cobrindo só siglas + guardrails + contenção) seria necessária. Não fiz essa segunda condensação nesta rodada — é trabalho novo, não a mesma tarefa do núcleo do ChatGPT.

## 4. Risco a evitar proativamente — nunca criar `GEMINI.md` na raiz

A Antigravity também reconhece `GEMINI.md`, e **`GEMINI.md` tem precedência sobre `AGENTS.md` em caso de conflito**. Se alguém no futuro criar um `GEMINI.md` na raiz "só para o Gemini", ele passa a vencer silenciosamente qualquer regra de `AGENTS.md` sem que isso apareça em lugar nenhum como decisão. Recomendação: manter `AGENTS.md` como único arquivo de regras na raiz para as três ferramentas; se um dia for necessário algo específico do Gemini, registrar a decisão explicitamente aqui antes de criar o arquivo.

## 5. Pendências que ainda dependem de decisão sua

1. Revisar o núcleo `analista-governanca.md` (v4.0) linha a linha antes de usá-lo em produção — é uma condensação de um documento validado por várias rodadas, feita sem segunda verificação humana (Seção 3.3).
2. Decidir se `analista-processos-sei.md` deve ser fundido com `escritorio-cgov.md`, mantido separado, ou aposentado em favor das próprias skills — as três fontes se sobrepõem dentro do Claude Cowork (Seção 3.2). Não decidi isso por você.
3. Se for usar o núcleo em um Gem do Gemini, testar diretamente ou pedir uma segunda condensação mais curta (Seção 3.4).
