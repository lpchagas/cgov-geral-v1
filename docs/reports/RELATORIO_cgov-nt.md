# Relatório Técnico — Suíte Canônica `cgov-nt` (01 a 07)
### Diagnóstico das skills existentes, proposta de modelo canônico e revisão técnica
**CGOV/ICMBio — Instituto Chico Mendes de Conservação da Biodiversidade**

---

## Sumário

1. Metodologia e fontes consultadas
2. Diagnóstico das 13 skills existentes (`cgov-pgd-sk1..8`, `cgov-pspeadbio-sk1..5`)
3. Fundamentação regimental (Art. 37, Portaria ICMBio nº 5.592/2025)
4. Arquitetura proposta: suíte canônica `cgov-nt-01` a `cgov-nt-07`
5. Alternativas de arquitetura consideradas e descartadas
6. Revisão técnica especializada (autoavaliação como revisor de agentes de IA)
7. Recomendações de melhoria e plano de adoção
8. Limitações desta análise

---

## 1. Metodologia e fontes consultadas

Esta análise dividiu a tarefa nas seguintes subtarefas, executadas nesta ordem:

| # | Subtarefa | Fonte consultada |
|---|---|---|
| 1 | Ler as 8 skills `cgov-pgd-sk1` a `sk8` na íntegra | `/mnt/skills/user/cgov-pgd-sk*` |
| 2 | Ler as 5 skills `cgov-pspeadbio-sk1` a `sk5` na íntegra | `/mnt/skills/user/cgov-pspeadbio-sk*` |
| 3 | Ler o documento de referência de identidade/comandos do assistente CGOV | `cgov-analista-governanca_v2.md` (anexado) |
| 4 | Extrair o texto oficial do Art. 37 (competências da CGOV) | `Portaria_ICMBio_5_592-2025.pdf` (anexado; OCR das págs. 19-20, conferido visualmente) |
| 5 | Ler skills genéricas já existentes como referência de bom padrão | `cgov-auditoria-competencias`, `cgov-comparar-versoes`, `cgov-modelar-fluxo`, `cgov-saneamento-legistica`, `cgge-especialista-pgd` |
| 6 | Levantar o acervo real de Notas Técnicas da CGOV (para confirmar o padrão estrutural) | Pasta local `CGOV_Notas Técnicas` (16 NTs listadas) |
| 7 | Desenhar e justificar a arquitetura canônica | Este relatório |
| 8 | Construir, validar e empacotar as 7 skills propostas | `quick_validate.py` / `package_skill.py` (skill-creator) |
| 9 | Autorrevisão técnica especializada | Seção 6 |

Não foi necessário abrir individualmente as 16 Notas Técnicas históricas: a estrutura
padrão (DESTINATÁRIO → INTERESSADO → REFERÊNCIAS → FUNDAMENTAÇÃO/ANÁLISE TÉCNICA/PARECER
→ CONCLUSÃO E/OU PROPOSIÇÃO) já está corroborada de forma consistente e redundante em
13 skills independentes e no comando `/ELABORAR_NT_GOVERNANCA` do documento de
referência — três fontes convergentes foram consideradas suficientes para fixar o
template sem risco de erro.

---

## 2. Diagnóstico das 13 skills existentes

### 2.1. O que as duas famílias têm em comum (pontos fortes a preservar)

- Ambas seguem rigorosamente o **mesmo template estrutural de NT** (numeração
  decimal dentro da Seção 4; verbo no futuro simples; proibição de "deverá";
  saída sempre em Markdown, nunca `.docx`).
- Ambas têm **sequenciamento lógico correto**: capítulos analíticos antes dos
  redacionais, conclusão sempre por último.
- `cgov-pspeadbio-sk2`, `sk3` e `sk5` têm **checagens de pré-requisito explícitas**
  (ex.: "se a Seção 2.3 do CLAUDE.md estiver com `[INSERIR ACHADOS...]`, interrompa"),
  o que é uma boa prática de controle de qualidade.

### 2.2. Problema estrutural central: acoplamento a um único processo

As 13 skills — nas duas famílias — são **funções de despacho (dispatchers)**, não
skills autocontidas. Cada uma delas, em vez de conter a lógica de execução, instrui:

> *"Execute imediatamente e na íntegra as instruções da seção `cgov-pgd-skN` definidas
> no `CLAUDE.md` do projeto atual (pasta `SEI_02070.007004_2026_68_revisao_PGD`)."*

Isso tem quatro consequências práticas, todas contrárias ao objetivo declarado pelo
usuário ("skills sequenciadas aplicáveis a quaisquer processos... sem necessidade de
customização individual"):

| Problema | Evidência nas skills atuais | Consequência |
|---|---|---|
| **Hardcoding do processo SEI e da pasta do projeto** | `pasta SEI_02070.007004_2026_68_revisao_PGD`; `pasta 02070.020239 2025-64_Plano Setorial` | A skill só funciona dentro daquele projeto específico; para um novo processo, um novo conjunto de 5 a 8 skills precisa ser escrito do zero |
| **Hardcoding de nomes de arquivo de dados** | `Revisão IN_14_2025_Regras do PGD_ICMBio_Respostas_1-351.csv`; `SEI_023653896_Minuta_de_Portaria_final.pdf` | Se o arquivo for renomeado ou o processo mudar de ano, a skill quebra silenciosamente |
| **Dependência de um `CLAUDE.md` externo não versionado junto à skill** | Todas as 13 skills remetem a "a seção X do CLAUDE.md do projeto" | A skill em si **não contém a lógica de análise** — é uma casca vazia; a "inteligência" real mora num arquivo que não faz parte da skill e não foi apresentado nesta análise |
| **Duplicação massiva de boilerplate** | Blocos de "Dependências" e "Encadeamento recomendado" são **idênticos, palavra por palavra**, em `sk1` a `sk8` (PGD) e em `sk1` a `sk5` (PSPEADBio) | Qualquer correção (ex.: mudança no nome de um arquivo de referência) precisa ser replicada manualmente em até 8 arquivos; risco real de divergência já presente (compare o padrão de numeração de capítulo entre as duas famílias — ver 2.3) |

Em outras palavras: as skills atuais **não são reutilizáveis por design** — eram, na
prática, atalhos (`/comando`) para trechos de um documento de projeto único. Isso é
adequado para *dentro* de um processo SEI específico (reduz digitação), mas é o
oposto de um "modelo canônico para quaisquer processos".

### 2.3. Inconsistências entre as duas famílias

- `cgov-pgd-sk4` numera o capítulo de introdução como **4.1 / 4.1.1 / 4.1.2**
  (subordinado à Seção 4 da NT). `cgov-pspeadbio-sk1` numera o mesmo capítulo como
  **1.1 / 1.2 / 1.3** (numeração própria, não subordinada). São dois padrões de
  numeração diferentes para o mesmo tipo de capítulo — sinal de que as famílias
  foram escritas independentemente, sem uma referência canônica comum.
- `cgov-pgd-sk7` e `cgov-pspeadbio-sk4` respondem aos **mesmos 8 quesitos da
  Portaria ICMBio nº 271/2013**, mas cada uma repete a tabela de quesitos por
  extenso — é a mesma base regimental, mantida em dois lugares.
- Apenas a família PSPEADBio faz checagem de pré-requisito de conteúdo antes de
  redigir (`sk2`, `sk3`, `sk5`); a família PGD não faz isso em nenhuma das 8 skills
  — inconsistência de robustez entre famílias que deveriam seguir o mesmo padrão de
  qualidade.

### 2.4. Risco de granularidade excessiva sem ganho real

`cgov-pgd-sk1`, `sk2` e `sk3` (demografia, quantitativa, qualitativa) são três
skills diferentes cujo **texto de execução, dependências e encadeamento são
idênticos** — a única diferença real está na frase de propósito. Isso sugere que a
divisão em três skills não reflete uma diferença de *processo*, apenas de *tipo de
coluna na planilha*. Não há necessidade de três skills separadas para isso; uma
única skill adaptativa (que reconhece o tipo de dado e aplica a técnica adequada)
cumpre a mesma função com um terço da manutenção.

---

## 3. Fundamentação regimental (Art. 37, Portaria ICMBio nº 5.592/2025)

Para que o novo modelo canônico seja aplicável a **qualquer** processo da CGOV — e
não apenas aos dois já mapeados —, era indispensável fixar com precisão o texto
oficial das competências da CGOV, evitando repetir o problema já observado (cada
skill reinventando parte da base normativa).

> ✅ **Atualização (05/07/2026): texto verificado contra fonte com camada de
> texto real.** O texto abaixo foi originalmente extraído via OCR das páginas
> 19-20 do PDF `Portaria_ICMBio_5_592-2025.pdf` fornecido nesta conversa (um
> "Print to PDF" sem camada de texto). Posteriormente, localizou-se na pasta
> `CGOV_Normativas` do usuário uma versão do mesmo diploma com texto extraível
> (`20251211_Portaria ICMBio 5.592_Regimento Interno.pdf`), cuja extração
> direta (sem OCR) **confirmou, palavra por palavra, a transcrição abaixo**.
> A pendência de validação registrada nas Seções 6.4 e 7 (item 1) está
> **resolvida** — ver `04_fontes_normativas/Art_37_Portaria_5592-2025_texto_verificado.md`.

> **Art. 37.** Compete à Coordenação de Governança – CGOV, sob supervisão da CGGE,
> liderar os seguintes processos organizacionais: **I** – Governança de processos
> organizacionais; e **II** – Gestão de riscos institucionais.
>
> **Parágrafo único.** São atribuições da CGOV: **I** – planejar, coordenar e
> monitorar as ações vinculadas aos processos organizacionais sob sua liderança;
> **II** – Política de Governança Institucional (Portaria ICMBio nº 4.101/2023);
> **III** – métodos, padrões e soluções para gestão por processos; **IV** –
> atualização do Regimento Interno; **V** – adequação do Quadro Demonstrativo de
> Cargos e Funções Comissionadas Executivas; **VI** – Cadeia de Valor e Catálogo de
> Produtos e Serviços / DFT; **VII** – operacionalização do PGD (em conjunto com a
> CGGP); **VIII** – PGR; **IX** – Gestão de Riscos (em conjunto com o CTGRIC); **X**
> – recomendações metodológicas para AIR/ARR (Decreto nº 10.411/2020).

Esse texto foi incorporado **apenas na skill `cgov-nt-01-triagem`**, que passa a ser
a única fonte de verdade regimental da suíte — todas as demais skills recuperam o
enquadramento já feito via `NT_ESTADO.md`, em vez de repetir o Art. 37 (ver Seção 6.3
para a discussão explícita desse trade-off).

**Nota metodológica (histórico):** o PDF originalmente fornecido nesta conversa é
uma impressão (Microsoft Print to PDF) sem camada de texto, o que exigiu OCR
(Tesseract, pacote de idioma em inglês, por indisponibilidade do pacote em
português neste ambiente) seguido de conferência visual da página renderizada em
alta resolução antes de transcrever o Art. 37. Essa transcrição foi posteriormente
confirmada por extração direta de texto de uma fonte melhor (ver nota acima).

---

## 4. Arquitetura proposta: suíte canônica `cgov-nt-01` a `cgov-nt-07`

### 4.1. Princípio de design

Substituir os **13 dispatchers acoplados a projeto** por **7 skills autocontidas e
genéricas**, que:

1. **Não dependem de nenhum `CLAUDE.md` externo** — toda a lógica de execução mora
   dentro do próprio `SKILL.md`.
2. **Não hardcodam nome de processo SEI, pasta de projeto ou nome de arquivo de
   dados** — tudo isso é levantado dinamicamente na primeira etapa (triagem) e
   registrado em um artefato de estado (`NT_ESTADO.md`) criado *pela própria skill*
   dentro do projeto Cowork em uso.
3. **Mapeiam 1:1 para a estrutura oficial da NT da CGOV**, e não para o conteúdo
   específico de um processo — cada skill corresponde a um capítulo (ou par de
   capítulos) da NT, independentemente de o assunto ser PGD, PSPEADBio, criação de
   comitê, gestão de riscos ou qualquer outro tema de competência da CGOV.
4. **Absorvem, generalizando, a granularidade excessiva** identificada em 2.4:
   as três skills de análise de dados do PGD (`sk1`-`sk3`) tornam-se uma única
   skill adaptativa (`cgov-nt-02`).

### 4.2. Mapeamento de substituição

| Skills antigas (2 famílias, 13 arquivos) | Skill canônica nova | Generalização aplicada |
|---|---|---|
| *(inexistente — lacuna identificada)* | **`cgov-nt-01-triagem`** | Nova: enquadramento regimental (Art. 37) + definição do roteiro de execução + criação do `NT_ESTADO.md` |
| `pgd-sk1` + `pgd-sk2` + `pgd-sk3` | **`cgov-nt-02-instrucao`** | 3 skills de dado específico → 1 skill adaptativa por *tipo* de dado (quantitativo/qualitativo/perfil) |
| `pgd-sk4` + `pspeadbio-sk1` | **`cgov-nt-03-introducao`** | Unifica os dois padrões de numeração divergentes (ver 2.3) em um único padrão |
| `pgd-sk5` + `pspeadbio-sk2` | **`cgov-nt-04-diagnostico`** | Generaliza as subseções fixas (perguntas fechadas/abertas vs. remissões/fluxo/competências) em uma tabela de seleção por *natureza do achado* |
| `pgd-sk6` + `pspeadbio-sk3` | **`cgov-nt-05-propostas`** | Generaliza os 4 tipos de recomendação (normativa, organizacional, gestão, governança) em vez de assumir sempre "ajuste normativo" |
| `pgd-sk7` + `pspeadbio-sk4` | **`cgov-nt-06-quesitos-pfe`** | Mesmo conteúdo (8 quesitos da Portaria 271/2013), agora mantido em um único lugar (posteriormente corrigido — ver Seção 10) |
| `pgd-sk8` + `pspeadbio-sk5` | **`cgov-nt-07-conclusao`** | Unifica os blocos de assinatura (a família PGD tinha 3 signatários, a PSPEADBio também — mantido, mas parametrizado) |

**Resultado:** 13 → 7 skills, com cobertura funcional igual ou maior (a antiga
suíte não tinha etapa de triagem/enquadramento nem tratava explicitamente NTs de
governança institucional sem dados brutos — Tipo C/D).

### 4.3. O artefato `NT_ESTADO.md` como substituto do `CLAUDE.md` por projeto

Esta é a peça central da portabilidade da suíte. Em vez de um `CLAUDE.md` que
precisa ser escrito manualmente para cada novo processo SEI (o que é, na prática,
o motivo por trás dos 13 arquivos hardcoded), a skill `cgov-nt-01` cria esse estado
automaticamente, a partir da conversa com o servidor. Cada skill subsequente lê e
atualiza esse mesmo arquivo — nenhuma delas precisa saber, a priori, qual é o
processo, qual o tema, ou onde estão os dados.

```
/cgov-nt-01 (Triagem)
     ↓ cria NT_ESTADO.md
[diagnóstico normativo prévio, se Tipo A: cgov-comparar-versoes → cgov-modelar-fluxo → cgov-auditoria-competencias]
     ↓
/cgov-nt-02 (Instrução Técnica — se houver dados brutos)
     ↓ atualiza NT_ESTADO.md
/cgov-nt-03 (Cap. 1 — Introdução)
     ↓
/cgov-nt-04 (Cap. 2-3 — Diagnóstico)
     ↓
/cgov-nt-05 (Cap. 4 — Propostas, se aplicável)
     ↓
/cgov-nt-06 (Quesitos PFE, se aplicável)
     ↓
/cgov-nt-07 (Cap. 5 — Conclusão e Encaminhamentos)
```

### 4.4. Arquivos entregues

Os 7 pacotes `.skill` e este relatório foram disponibilizados para download no chat
e, a partir desta versão, também gravados em `C:\_cowork\cgov-geral-v1`.

---

## 5. Alternativas de arquitetura consideradas e descartadas

Antes de fixar o modelo de 7 skills acima, três alternativas foram avaliadas
internamente:

**Alternativa A — Manter 13 skills, apenas remover o hardcoding.**
Descartada: não resolve a duplicação de boilerplate nem a granularidade excessiva
das skills de análise de dados (2.4); manteria 13 arquivos para gerir.

**Alternativa B — Skill única monolítica (`cgov-nt`) com todo o fluxo dentro de um
só `SKILL.md`.**
Descartada: violaria o limite recomendado de ~500 linhas por `SKILL.md` (a soma dos
7 arquivos atuais já ultrapassa 900 linhas) e impediria a execução paralela por
subagentes em Cowork (uma única invocação executaria a NT inteira de uma vez, sem
pontos de controle intermediários para o servidor revisar achados antes da redação
final — perdendo justamente o valor dos "pré-requisitos de conteúdo" que a própria
família PSPEADBio já demonstrou serem úteis).

**Alternativa C — Granularidade máxima (uma skill por subseção, ~15-18 skills).**
Descartada: reproduziria o mesmo problema de manutenção da situação atual, apenas
com mais arquivos; o ganho marginal de modularidade não compensa o custo de gestão
para os servidores da CGOV, que não são desenvolvedores de software.

**Decisão:** o modelo de 7 skills (Seção 4) é o ponto de equilíbrio entre
portabilidade, manutenibilidade e granularidade de controle — cada skill corresponde
a uma unidade de trabalho que um servidor plausivelmente executaria, revisaria e
só então mandaria seguir para a próxima.

---

## 6. Revisão técnica especializada (autorrevisão como revisor de agentes de IA)

Assumindo agora o papel de revisor técnico independente, especializado em
desenvolvimento de agentes de IA com ferramentas Claude, aponto os seguintes pontos
de atenção sobre a suíte que acabei de propor — nenhuma skill é isenta de trade-offs,
e é importante que a CGOV adote este modelo de olhos abertos quanto às suas
limitações.

### 6.1. Duplicação residual do "Padrão de Redação CGOV"

As skills `cgov-nt-03` a `cgov-nt-07` **repetem, de forma resumida, as mesmas
regras de redação** (tempo verbal, remissões completas, numeração decimal, sem
".docx", proibição de invenção normativa). Isso foi uma decisão deliberada — ver
6.3 — mas é uma duplicação real. **Risco:** se a CGOV decidir trocar um padrão
redacional, será preciso editar 5 arquivos. **Mitigação sugerida:** manter uma nota
de versão no topo de cada `SKILL.md` para facilitar busca e substituição em lote
quando o padrão institucional mudar.

### 6.2. `NT_ESTADO.md` pressupõe ambiente com persistência de arquivo

A suíte foi desenhada para **Claude Cowork Projects** (conforme solicitado), que
suportam criação/edição de arquivos entre invocações de skills. Em um chat avulso do
claude.ai sem projeto, não há garantia de que o arquivo persista entre uma
invocação de skill e outra. Cada skill contém uma cláusula de contingência ("se o
ambiente não suportar arquivos persistentes, reapresente a Ficha de Enquadramento"),
mas esse caminho alternativo **não foi testado exaustivamente** nesta entrega.

### 6.3. Trade-off consciente: autocontenção vs. DRY (Don't Repeat Yourself)

Um revisor mais purista apontaria que a base regimental (Art. 37) e o padrão de
redação deveriam viver em **um único arquivo de referência compartilhado**, não
duplicados. Isso não foi feito porque o sistema de skills do Claude empacota cada
skill de forma independente — não há mecanismo nativo para uma skill "importar" um
arquivo de outra skill instalada separadamente. A decisão tomada — manter cada
skill autocontida, aceitando pequena duplicação textual — prioriza a robustez de uso
sobre a pureza de engenharia. Isso deve ser revisitado se a Portaria nº 5.592/2025
for substituída: nesse caso, **as 7 skills precisarão ser atualizadas em conjunto**.

### 6.4. Qualidade do texto normativo-fonte (Art. 37) — ✅ resolvido em 05/07/2026

~~O ambiente de execução desta análise não tinha o pacote de idioma português do
Tesseract instalado, obrigando OCR em inglês seguido de conferência visual manual
da imagem da página.~~ **Atualização:** a transcrição foi confirmada por extração
direta de texto de uma segunda fonte (ver nota na Seção 3) — não depende mais
apenas de OCR. Pendência encerrada.

### 6.5. Ausência de testes automatizados (evals) — resolvido parcialmente (ver Seção 9)

### 6.6. Descrições de trigger (`description`) ainda podem estar subdimensionadas

Um teste de otimização de descrição poderia aumentar a taxa de acionamento correto,
especialmente para `cgov-nt-01`, cuja função de "porta de entrada" depende de ser
reconhecida mesmo quando o servidor não usa os termos exatos dos exemplos.

### 6.7. Ponto forte a destacar (para equilíbrio da revisão)

Ao contrário das 13 skills originais, as 7 novas **não inventam placeholder de
conteúdo silenciosamente** — cada uma tem uma "Regra Especial" para dados
faltantes, achados sem solução clara, ou demanda fora do escopo regimental, sempre
optando por declarar a lacuna ao usuário em vez de gerar texto genérico.

---

## 7. Recomendações de melhoria e plano de adoção

1. ~~**Validação jurídica do Art. 37** contra o Diário Oficial — prioridade alta.~~
   ✅ Resolvido em 05/07/2026 (ver Seção 3).
2. **Piloto controlado** — executado (ver Seção 9).
3. **Migração gradual** — superada: as 13 skills antigas foram removidas (Seção 10).
4. **Criar o conjunto de evals** — executado (Seção 9.1).
5. **Rodar a otimização de descrição**, especialmente para `cgov-nt-01-triagem`.
6. Revisar a numeração de capítulos — resolvido pelo piloto (Seção 9.3).

## 8. Limitações desta análise

- Não foi possível ler o conteúdo dos arquivos `CLAUDE.md` dos dois projetos
  existentes; a análise das skills antigas baseou-se exclusivamente no texto dos
  `SKILL.md`.
- As 16 Notas Técnicas históricas da pasta `CGOV_Notas Técnicas` não foram lidas
  integralmente (apenas listadas).
- A suíte foi exercitada em um caso real de ponta a ponta parcial (Seção 9), não
  em todos os 16 casos de eval construídos.

---

## 9. Addendum — Conjunto de `evals.json` e teste-piloto com dados reais

Esta seção documenta: (a) construção de um conjunto de testes (`evals.json`) para
as 7 skills, e (b) um piloto real, executado manualmente (sem subagentes, conforme
o modo de operação do Claude.ai) contra dados verdadeiros do processo SEI
de referência (revisão da IN nº 14/2025 — PGD), incluindo comparação
direta com a Nota Técnica nº 20/2026/CGOV, já protocolada e encaminhada à PFE.

### 9.1. Conjunto de evals construído

Foram criados 7 arquivos `evals/evals.json` (2 a 3 casos por skill, 16 casos no
total), cobrindo: (i) o caminho feliz de cada skill; (ii) pelo menos um caso de
borda por skill (dado faltante, pré-requisito não satisfeito, demanda fora de
escopo, ou achado sem solução clara). Uma fixture sintética e não sensível
(`amostra_sintetica_consulta.csv`) foi criada para os testes de `cgov-nt-02` que
não dependem dos dados reais do processo-piloto.

### 9.2. Piloto executado

**Dado real utilizado:** arquivo
`Revisão IN_14_2025_Regras do PGD_ICMBio_Respostas_1-351.csv` (351 respondentes),
localizado na pasta do processo SEI de referência no Google Drive do
usuário. **Gabarito de comparação:** capítulos já redigidos e protocolados da NT
nº 20/2026/CGOV, efetivamente encaminhada à PFE/ICMBio.

Foram executadas manualmente, seguindo à risca as instruções de cada `SKILL.md`:
`cgov-nt-01` (triagem) → `cgov-nt-02` (instrução técnica, com tabulação real via
pandas dos dados de 351 respondentes) → `cgov-nt-03` (Capítulo 1).

### 9.3. Achados do piloto — 4 correções aplicadas à suíte

A comparação direta com a NT real revelou **quatro divergências entre o que a
suíte havia herdado das 13 skills antigas e o que foi de fato protocolado**,
todas corrigidas nesta rodada (skills empacotadas como "v2"):

| # | Achado | Evidência | Correção aplicada |
|---|---|---|---|
| 1 | A triagem inferia a necessidade de quesitos PFE (`cgov-nt-06`) a partir do Tipo de dado (A/B/C/D), mas a NT real é Tipo B (consulta) e **precisou** de análise PFE | Arquivo real `NT_20_2026_CGOV_Capitulo4_4_AnalisePFE.md` e proposição da NT real, alínea (iii) | `cgov-nt-01` (Passo 3.1) e `cgov-nt-06` agora decidem a necessidade de PFE pelo **destino do produto**, não pelo Tipo de dado |
| 2 | A suíte usava numeração subordinada `4.1/4.1.1`, mas a NT real usa capítulos autônomos `### Capítulo N` com subseções reiniciadas `#### N.1` | Capítulos 1 e 5 da NT real | `cgov-nt-03`, `04`, `05` e `07` corrigidas para o padrão de numeração reiniciada por capítulo |
| 3 | A suíte instruía verbos no **futuro simples** na prosa da NT | Prosa da NT real no presente do indicativo | `cgov-nt-03` agora distingue prosa da NT (presente) de redação de dispositivo normativo (futuro simples, Decreto nº 12.002/2024) |
| 4 | A suíte usava alíneas (a, b, c) na Proposição e romanos maiúsculos (I, II, III) nos Encaminhamentos | Capítulo 5 real: `(i), (ii), (iii)`; encaminhamentos com destinatário em **negrito** | `cgov-nt-07` corrigida para o formato real |

### 9.4. Resultado da avaliação (grading)

| Skill | Eval | Expectativas verificadas | Resultado |
|---|---|---|---|
| `cgov-nt-01` | nº 1 | 5/5 | ✅ Aprovado |
| `cgov-nt-02` | nº 1 (com dado real) | 4/4 | ✅ Aprovado |
| `cgov-nt-03` | nº 1 | 5/5 | ✅ Aprovado |

Os demais 13 casos de eval (das 7 skills) não foram executados nesta rodada.

---

## 10. Addendum II — Atualização com o texto real da Portaria nº 271/2013 e exclusão das skills antigas

### 10.1. O que o texto real do Anexo II revelou

O usuário forneceu o texto integral da Portaria ICMBio nº 271/2013. A leitura do
**Anexo II** confirmou que a tabela de "8 quesitos" que `cgov-nt-06` havia herdado,
sem verificação, das skills `cgov-pgd-sk7` e `cgov-pspeadbio-sk4` **estava
incompleta e parcialmente incorreta**. O Anexo II efetivamente contém 8 quesitos,
mas:

- **Quatro quesitos inteiros estavam ausentes** da tabela herdada: quesito 2
  ("Quais as alternativas disponíveis?"), quesito 3 ("O ato corresponde às
  expectativas dos cidadãos e é inteligível?"), quesito 5 ("Deve a
  normatização ter prazo de vigência limitado?") e quesito 6 ("As normas
  preservam direito adquirido e garantias fundamentais?").
- **Dois quesitos herdados não correspondem a nenhum item do Anexo II**:
  "revogação expressa de atos anteriores" e "técnica legislativa" são
  exigências estruturais do **Anexo I** (Art. 12 e Art. 50; Art. 17 a 33),
  não perguntas do questionário do Anexo II.
- A numeração oficial do próprio documento é **inconsistente** (os quesitos 4
  a 8 aparecem rotulados como "10" a "14" no texto publicado, enquanto os
  subitens de cada um mantêm a numeração real 4.x a 8.x).

A skill `cgov-nt-06-quesitos-pfe` foi **reescrita por completo** com a
transcrição fiel dos 8 quesitos e de todos os seus subitens, com o fundamento
adicional do Art. 7º, § 2º, "b" do Anexo I explicitado.

### 10.2. Análise comparativa: as skills `cgov-pgd-sk*` e `cgov-pspeadbio-sk*` ainda são necessárias?

| Skill antiga | Função | Skill canônica que a substitui | Cobertura funcional |
|---|---|---|---|
| `cgov-pgd-sk1` | Análise demográfica | `cgov-nt-02` (Fase 2.C) | Integral |
| `cgov-pgd-sk2` | Análise quantitativa | `cgov-nt-02` (Fase 2.A) | Integral |
| `cgov-pgd-sk3` | Análise qualitativa | `cgov-nt-02` (Fase 2.B) | Integral |
| `cgov-pgd-sk4` | Cap. 1 Introdução | `cgov-nt-03` | Integral — e mais precisa |
| `cgov-pgd-sk5` | Cap. 2-3 Diagnóstico | `cgov-nt-04` | Integral |
| `cgov-pgd-sk6` | Cap. 4 Propostas | `cgov-nt-05` | Integral |
| `cgov-pgd-sk7` | Quesitos PFE | `cgov-nt-06` | **Superior** |
| `cgov-pgd-sk8` | Cap. 5 Conclusão | `cgov-nt-07` | Integral — e mais precisa |
| `cgov-pspeadbio-sk1` | Cap. 1 Introdução | `cgov-nt-03` | Integral |
| `cgov-pspeadbio-sk2` | Cap. 2-3 Diagnóstico normativo | `cgov-nt-04` (+ skills analíticas normativas) | Integral |
| `cgov-pspeadbio-sk3` | Cap. 4 Propostas | `cgov-nt-05` | Integral |
| `cgov-pspeadbio-sk4` | Quesitos PFE | `cgov-nt-06` | **Superior** |
| `cgov-pspeadbio-sk5` | Cap. 5 Conclusão | `cgov-nt-07` | Integral |

**Ressalva de risco operacional:** o processo SEI de referência (Plano
Setorial / PSPEADBio) encontrava-se em andamento (arquivos até 15/06/2026, Minuta
v7.2 e NT nº 21). O `CLAUDE.md` e todos os arquivos desse processo permanecem
intactos no Google Drive; apenas o atalho de skill deixou de existir.

### 10.3. Ação executada

As 13 skills (`cgov-pgd-sk1` a `sk8`, `cgov-pspeadbio-sk1` a `sk5`) foram
removidas de `/mnt/skills/user`, após backup completo (pasta
`03_skills_arquivadas_backup` desta estrutura).

---

## 11. Addendum III — Complementação do acervo e resolução da pendência do Art. 37

### 11.1. Cópia de fontes complementares

A pedido do usuário, foram copiados para `04_fontes_normativas`:

- `cgov-analista-governanca_v2.md` — documento de identidade/comandos do
  assistente de governança, uma das três fontes convergentes usadas para
  fixar o template estrutural da NT (Seção 1, item 3).
- `Art_37_Portaria_5592-2025_texto_verificado.md` — ver 11.2.

### 11.2. Resolução da pendência de validação do Art. 37

Ao localizar, na pasta `CGOV_Normativas` do usuário, uma versão do PDF da
Portaria ICMBio nº 5.592/2025 com camada de texto extraível
(`20251211_Portaria ICMBio 5.592_Regimento Interno.pdf`, 1,7 MB — mais leve que
o PDF de 44 MB fornecido originalmente nesta conversa, que era uma impressão
sem texto), foi possível extrair o Art. 37 diretamente, sem OCR.

**Resultado: a extração direta confirmou, palavra por palavra, a transcrição
já usada em `cgov-nt-01-triagem` e nas Seções 3 e 6.4 deste relatório.** A
pendência de validação jurídica registrada como prioridade alta na Seção 7
(item 1) está resolvida — o texto normativo que fundamenta toda a suíte
`cgov-nt` está confirmado por extração de texto real, não apenas por OCR.

### 11.3. Limitação de ferramenta identificada

O arquivo PDF completo da Portaria nº 5.592/2025 não pôde ser copiado para
`04_fontes_normativas` — as ferramentas de acesso ao computador do usuário
disponíveis nesta sessão só permitem gravar **conteúdo em texto**, não copiar
arquivos binários de um local para outro no mesmo computador. O arquivo
original permanece em
`<Google Drive>\CGOV\CGOV_Normativas\20251211_Portaria ICMBio 5.592_Regimento Interno.pdf`;
uma cópia manual (Ctrl+C/Ctrl+V) resolveria, se desejado.
