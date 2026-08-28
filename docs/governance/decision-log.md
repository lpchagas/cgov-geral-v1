# Registro de Decisões — Suíte Canônica `cgov-nt` e Escritório de Trabalho da CGOV

**Processo/Iniciativa:** Desenvolvimento de ferramentas de IA para suporte ao
trabalho da Coordenação de Governança (CGOV/ICMBio)
**Data de registro:** 05/07/2026 (última atualização: 28/08/2026)
**Responsável:** Coordenação de Governança — CGOV/CGGE/ICMBio
**Natureza deste documento:** Registro cronológico e decisório, para arquivamento
junto ao acervo da CGOV, do processo de diagnóstico, desenho, validação e adoção
da suíte de skills `cgov-nt-01` a `07` no Claude.

> **Nota de publicação:** os caminhos de pastas e nomes de arquivos em decisões
> históricas descrevem a estrutura vigente à época e não constituem instruções
> operacionais atuais. Consulte `README.md` e `docs/architecture.md` para os
> caminhos vigentes.

---

## 1. Motivação e escopo original

O Coordenador de Governança solicitou análise das skills então em uso pela CGOV
para elaboração de Notas Técnicas — duas famílias específicas por processo:
`cgov-pgd-sk1` a `sk8` (processo SEI de referência — revisão da IN
ICMBio nº 14/2025, regras do PGD) e `cgov-pspeadbio-sk1` a `sk5` (Processo SEI
Plano Setorial/PSPEADBio) — com o objetivo de propor
um modelo canônico, sequenciado e reutilizável para qualquer processo em análise
na CGOV, sem necessidade de customização individual por projeto.

## 2. Diagnóstico (fase 1)

Constatou-se que as 13 skills existentes eram **funções de despacho** —
instruíam a execução de trechos de um arquivo `CLAUDE.md` específico de cada
processo, hardcodando nomes de pasta, de arquivo de dados e de processo SEI.
Isso as tornava não reutilizáveis para novos processos, com duplicação de
boilerplate entre as duas famílias e inconsistências de formatação entre elas
(ex.: dois padrões de numeração de capítulo diferentes).

**Decisão 1:** substituir as 13 skills por uma suíte canônica de 7 skills
(`cgov-nt-01` a `07`), mapeadas 1:1 à estrutura oficial da Nota Técnica da CGOV,
sem dependência de `CLAUDE.md` externo — cada skill autocontida, com o estado do
processo mantido em um arquivo `NT_ESTADO.md` criado dinamicamente pela própria
suíte.

## 3. Fundamentação regimental

Para que a triagem (`cgov-nt-01`) enquadrasse qualquer demanda corretamente, foi
extraído e transcrito o Art. 37 (competências da CGOV) da Portaria ICMBio nº
5.592/2025, via OCR do PDF fornecido (sem camada de texto) seguido de
conferência visual da página renderizada.

**Decisão 2:** o texto do Art. 37 foi incorporado apenas na skill `cgov-nt-01`,
que passa a ser a fonte de verdade regimental de toda a suíte.

## 4. Construção, validação e piloto (fase 2)

As 7 skills foram construídas, validadas (`quick_validate.py`) e empacotadas.
Foi montado um conjunto de 16 casos de teste (`evals.json`, 2-3 por skill) e
executado um piloto manual contra dados reais do processo SEI
de referência (351 respondentes da consulta sobre a IN nº 14/2025),
comparando a saída da nova suíte com a Nota Técnica nº 20/2026/CGOV, já
protocolada e encaminhada à PFE/ICMBio.

**Achados do piloto e decisões correspondentes:**

| Achado | Decisão |
|---|---|
| A necessidade de quesitos PFE não pode ser inferida do Tipo de dado (a NT real, Tipo B, precisou de PFE) | `cgov-nt-01` e `cgov-nt-06` passaram a decidir a necessidade de PFE pelo destino do produto, não pelo Tipo |
| A NT real usa capítulos autônomos (`### Capítulo N` + `#### N.1`), não a numeração subordinada `4.1/4.1.1` herdada de uma das famílias antigas | Suíte corrigida para o padrão real, em `cgov-nt-03`, `04`, `05` e `07` |
| A prosa da NT real usa presente do indicativo, não futuro simples (regra que só se aplica ao texto do próprio ato normativo, por força do Decreto nº 12.002/2024) | `cgov-nt-03` passou a distinguir os dois registros |
| A Proposição real usa `(i), (ii), (iii)` e os Encaminhamentos usam destinatário em negrito, não alíneas/romanos maiúsculos | `cgov-nt-07` corrigida para o formato real |

## 5. Correção com a fonte primária da Portaria nº 271/2013 (fase 3)

O usuário forneceu o texto integral da Portaria ICMBio nº 271/2013. A leitura
do Anexo II revelou que a tabela de "8 quesitos" herdada das skills antigas
estava **incompleta** (faltavam os quesitos 2, 3, 5 e 6) e **parcialmente
incorreta** (dois itens da tabela antiga — "revogação" e "técnica
legislativa" — pertencem ao Anexo I, não ao questionário do Anexo II).

**Decisão 3:** `cgov-nt-06` foi reescrita por completo, com a transcrição fiel
dos 8 quesitos reais do Anexo II e de todos os seus subitens, incluindo nota
sobre a numeração inconsistente do documento original (rotulada 10-14, mas com
subitens reais 4-8).

## 6. Análise comparativa final e exclusão das skills antigas

Com a suíte `cgov-nt` corrigida e validada, foi feita a análise comparativa
1:1 contra as 13 skills antigas (ver `01_relatorios/RELATORIO_cgov-nt.md`,
Seção 10.2). Concluiu-se que a suíte nova cobre integralmente, e de forma mais
precisa, todas as funções das 13 skills antigas.

**Decisão 4:** as 13 skills antigas (`cgov-pgd-sk1` a `sk8`,
`cgov-pspeadbio-sk1` a `sk5`) foram removidas do ambiente de skills do Claude,
após backup completo (pasta `03_skills_arquivadas_backup`). Ressalva registrada:
o processo SEI de referência (PSPEADBio) estava em andamento à data
da exclusão (últimos arquivos de 15/06/2026); o `CLAUDE.md` e os arquivos desse
processo permanecem intactos no Google Drive, e qualquer capítulo pendente pode
ser produzido pela suíte nova.

## 7. Complementação do acervo e resolução da pendência do Art. 37 (fase 4 — 05/07/2026)

A pedido do usuário, foram copiados para `04_fontes_normativas`:
`cgov-analista-governanca_v2.md` (documento de identidade/comandos do
assistente CGOV, uma das fontes de diagnóstico original) e uma verificação do
Art. 37 a partir de segunda fonte.

Ao localizar, na pasta `CGOV_Normativas` do usuário, uma versão do PDF da
Portaria ICMBio nº 5.592/2025 com camada de texto extraível (mais leve — 1,7 MB
— que o PDF de 44 MB fornecido originalmente nesta conversa, uma impressão sem
texto), foi possível extrair o Art. 37 diretamente, sem OCR.

**Decisão 5:** a extração direta confirmou, palavra por palavra, a transcrição
já em uso em `cgov-nt-01-triagem` desde a fase 1. A pendência de validação
jurídica do Art. 37, registrada como prioridade alta na fase 1, é considerada
**resolvida** — documentado em
`04_fontes_normativas/Art_37_Portaria_5592-2025_texto_verificado.md`.

**Limitação de ferramenta registrada:** não foi possível copiar o arquivo PDF
completo da Portaria nº 5.592/2025 para `04_fontes_normativas` — as ferramentas
de acesso ao computador do usuário disponíveis nesta sessão só gravam conteúdo
em texto, não arquivos binários, entre pastas do mesmo computador. O original
permanece em
`C:\Users\leand\My Drive\CGOV\CGOV_Normativas\20251211_Portaria ICMBio 5.592_Regimento Interno.pdf`,
disponível para cópia manual se desejado.

## 8. Estado final e localização dos artefatos

Toda a documentação e as skills foram organizadas em
`C:\_cowork\cgov-geral-v1`, como acervo inicial do futuro projeto **"Escritório
de Trabalho da CGOV"**:

```
C:\_cowork\cgov-geral-v1\
├── 00_sincronizado_automaticamente_pelo_chat\   (snapshots intermediários do chat — não editar)
├── 01_relatorios\                                (relatório técnico completo + estado do piloto)
├── 02_skills_cgov-nt\                            (as 7 skills canônicas, código-fonte + evals)
├── 03_skills_arquivadas_backup\                  (as 13 skills antigas, preservadas)
├── 04_fontes_normativas\                         (Portaria nº 271/2013; doc. de identidade CGOV; Art. 37 verificado)
├── REGISTRO_DECISOES.md                          (este documento)
├── RELATORIO_cgov-nt.md
├── RESUMO_ESTRUTURADO.md
└── SYSTEM_INSTRUCTIONS_Escritorio_CGOV.md
```

## 9. Reorganização da biblioteca e novas skills (fase 5 — 05/07/2026)

A pedido do Coordenador, foi realizada reorganização da biblioteca de documentos
do projeto e análise de lacunas de cobertura de skills frente às competências
do Art. 37.

**Reorganização executada:**
- Removido da raiz o arquivo `RELATORIO_cgov-nt.md` (rascunho inicial, 371
  linhas) — o canônico (485 linhas, incluindo piloto) está em
  `01_relatorios/RELATORIO_cgov-nt.md`. O rascunho foi arquivado em
  `00_sincronizado_automaticamente_pelo_chat/RELATORIO_cgov-nt_v0_rascunho.md`.
- Removido da raiz o arquivo `REGISTRO_DECISOES_ADENDO.md` — seu conteúdo já
  havia sido integrado a este documento (Seções 7 e 9); o próprio arquivo
  sinalizava que podia ser removido.
- Criada a pasta `05_novas_skills_propostas/` para abrigar as skills novas
  aguardando instalação.

**Análise de lacunas de skills (Art. 37 × cobertura atual):**

| Inciso Art. 37 | Competência | Skills existentes | Lacuna |
|---|---|---|---|
| II | Política de Governança Institucional | cgov-nt-*, cgge-especialista-pgd | Parcial |
| III | Gestão por Processos | cgov-modelar-fluxo, cgov-auditoria-competencias, cgov-saneamento-legistica | Boa cobertura |
| IV | Regimento Interno | cgov-saneamento-legistica, cgov-nt-* | Parcial |
| V | Quadro de Cargos (QCF) | Nenhuma | ❌ (baixa frequência) |
| VI | Cadeia de Valor / DFT | Nenhuma | ❌ **Prioridade alta** |
| VII | PGD (com CGGP) | cgge-especialista-pgd, cgov-*-entrega | Boa cobertura |
| VIII | PGR (Programa de Gestão para Resultados) | Nenhuma | ❌ (avaliar) |
| IX | Gestão de Riscos / CTGRIC | Nenhuma | ❌ **Prioridade alta** |
| X | AIR / ARR | Nenhuma | ❌ **Prioridade alta** |

**Decisão 6:** criar rascunhos de 5 novas skills para os incisos IV, VI, VIII,
IX e X, depositados em `05_novas_skills_propostas/`:

- `cgov-gestao-riscos` (Art. 37, IX) — ciclo de gestão de riscos,
  Portaria ICMBio nº 975/2021, matriz 5×5, SITAI.
- `cgov-air-arr` (Art. 37, X) — AIR e ARR, Decreto nº 10.411/2020, dispensa,
  análise de alternativas, estrutura do relatório.
- `cgov-cadeia-valor` (Art. 37, VI) — Cadeia de Valor, SIPOC, Catálogo de
  Produtos/Serviços, DFT (Portaria SEDGG/ME nº 7.888/2022).
- `cgov-regimento-interno` (Art. 37, IV) — coordenação da atualização do RI:
  diagnóstico de gatilho, articulação interunidades, redação de minuta,
  verificação de hierarquia normativa e submissão à PFE.
- `cgov-pgr` (Art. 37, VIII) — implementação do PGR: ciclo de gestão por
  resultados, indicadores institucionais, alinhamento com PE, projetos de
  inovação e relatório de monitoramento (Portaria ICMBio nº 1.572/2023).

Instalação pendente: via Customize → Skills no Claude (copiar o conteúdo de
cada `SKILL.md` de `05_novas_skills_propostas/` para uma nova skill).

---

## 10. Revisão do Analista de Processos SEI e instalação das 5 skills (fase 6 — 04/08/2026)

### 10.1. Revisão do System Instructions do Analista de Processos SEI (v6.0 → v7.0)

O Coordenador submeteu à análise o documento "System Instructions — Analista de
Processos SEI (CGOV)", versão 6.0, de 13/03/2026. A auditoria seção a seção,
cruzada com o acervo deste projeto e com verificação das normas federais em
fonte primária, identificou os seguintes achados críticos:

| Achado | Natureza |
|---|---|
| Seções 4.3 (Riscos) e 4.4 (AIR/ARR) em branco — `[INSERIR TEXTO]` | Lacuna crítica: o assistente operava sem base para dois dos quatro eixos |
| Competência da CGOV referida ao **"Art. 50"** do Regimento Interno, em dois comandos, contradizendo a própria Seção 3 do documento (que cita corretamente o Art. 37) | Erro factual — instruía o modelo a citar dispositivo errado em minuta oficial |
| Estrutura de Nota Técnica divergente do padrão da CGOV validado por piloto contra NT real e por 16 NTs históricas | Erro estrutural |
| `INDICAR_NORMAS` pedia jurisprudência do TCU "se houver no seu conhecimento" | Convite direto à alucinação de acórdãos |
| Bloco final afirmava que o assistente "entrega 80-90% do documento pronto" | Métrica de projeto lida como instrução — pressão para completar lacunas por inferência |
| Omissão da Portaria ICMBio nº 271/2013, que rege a forma dos atos do Instituto e está na pasta deste projeto | Omissão relevante |
| Ausência de: delimitador de raciocínio interno; verificação de legibilidade da fonte; autoverificação pré-entrega; citação de evidência; minimização LGPD; sigilo LAI; exigência de revisão humana | Lacunas de confiabilidade |
| Divergência de cabeçalho da NT: `CGOV/CGGE/DIPLAN/ICMBio` (v6.0) × `CGOV/CGGE/GABIN/ICMBio` (`cgov-analista-governanca_v2.md`) | ⚠️ **Pendência aberta** — não resolvida pelas fontes disponíveis |

**Decisão 7:** produzir a versão **7.0**, gravada em
`SYSTEM_INSTRUCTIONS_Analista_Processos_SEI_v7.md`, com dez seções, integrada ao
ecossistema "Escritório CGOV" (nova Seção 3 de roteamento para skills), com o
texto verificado do Art. 37 embutido, base normativa ampliada de 4 para cerca de
30 referências com status de verificação (✅/🔎/⚠️), e nova Seção 8 de guardrails
com precedência sobre as demais. O comando `/REDIGIR_NOTA_TECNICA` passa a
**delegar** à suíte `cgov-nt`, em vez de produzir NT em formato próprio.

### 10.2. Correção técnica da skill `cgov-air-arr`

A verificação do Decreto nº 10.411/2020 contra o texto oficial (Planalto)
revelou que tanto a skill `cgov-air-arr` quanto o
`cgov-analista-governanca_v2.md` tratavam como **"dispensa"** hipóteses que a
norma classifica como **não incidência**.

A distinção não é terminológica: na **não incidência** (art. 3º, § 2º) a
obrigação não incide sobre o ato; na **dispensa** (art. 4º) a obrigação incide
mas é afastada, exigindo decisão fundamentada (*caput*), nota técnica de
fundamentação (§ 1º) e, se por urgência, identificação do problema regulatório e
dos objetivos (§ 2º) mais ARR obrigatória em até três anos (art. 12).

**Decisão 8:** reescrever o Passo 1.1 da `cgov-air-arr` com a transcrição
verificada dos arts. 1º (§§ 1º e 3º), 2º (II), 3º (§ 2º) e 4º (I a VIII e
§§ 1º a 3º), acrescentando quadro comparativo dos dois regimes e redação-modelo
para ato *interna corporis* do ICMBio. Estendida também a ancoragem dos Passos
1.3 a 1.5 e do Modo 2 (ARR) aos arts. 6º, 7º, 9º, 10, 12, 13, 15 e 21, com nota
sobre as alterações dos Decretos nº 11.243/2022 e nº 11.259/2022.

### 10.3. Instalação das 5 skills temáticas do Art. 37

**Decisão 9:** as cinco skills de `05_novas_skills_propostas/` foram instaladas
na conta Claude em 04/08/2026:

| Skill | Inciso do Art. 37 | ID |
|---|---|---|
| `cgov-gestao-riscos` | IX — Gestão de Riscos / CTGRIC | `skill_01MM7RvJBUgio48k7Eo2au7L` |
| `cgov-cadeia-valor` | VI — Cadeia de Valor / DFT | `skill_014MGvvTe5xaHDsDLcyJYPH5` |
| `cgov-pgr` | VIII — Programa de Gestão para Resultados | `skill_01U2oHksKRHjivmnF9DRzEfB` |
| `cgov-regimento-interno` | IV — Atualização do Regimento Interno | `skill_01Ut2CyTLiFSafBLrszvQWcD` |
| `cgov-air-arr` | X — AIR e ARR | `skill_019SUJYV2Vgaz99TUMDg2jit` |

**Ajuste técnico registrado:** o campo `description` das skills instaladas está
limitado a **1.024 caracteres**. As cinco descrições originais excediam esse
limite (1.119 a 1.698 caracteres) e foram condensadas, preservando todos os
gatilhos de acionamento e as advertências de desambiguação — em especial a nota
da `cgov-pgr` distinguindo o Programa de Gestão para Resultados do PGD
(teletrabalho) e da PGRI (riscos). Os arquivos de `05_novas_skills_propostas/`
foram sincronizados com o texto efetivamente instalado e receberam os campos
`instalado_em` e `status` no *frontmatter*.

**Advertência de manutenção:** editar os arquivos em
`05_novas_skills_propostas/` **não altera** a skill instalada. Qualquer mudança
exige reinstalação com sobrescrita.

**Cobertura resultante:** 9 dos 10 incisos do parágrafo único do Art. 37 passam
a ter skill dedicada. O inciso V (Quadro Demonstrativo dos Cargos e Funções
Comissionadas Executivas) permanece o único descoberto.

---

## 11. Consolidação do acervo normativo e padronização de siglas (fase 7 — 04/08/2026)

### 11.1. Diretrizes recebidas do Coordenador

1. Cabeçalho oficial da Nota Técnica: `Nota Técnica nº [#]/[ano]/CGOV/CGGE/GABIN/ICMBio`.
2. Depósito de diversas normas até então ausentes em `04_fontes_normativas/`.
3. Movimentação do `cgov-analista-governanca_v2.md` para a raiz do projeto — o
   documento passa a ser o System Instructions **independente**, para configuração
   de assistentes autônomos (Gems, GPTs) fora do Claude Cowork.
4. Padronização de siglas: **PGR** = Programa de Gestão para Resultados
   (Portaria nº 1.572/2023); **PGRI** = Política de Gestão de Riscos e
   Integridade (Portaria nº 255/2020).

**Decisão 10 — cabeçalho da NT.** Fixado `CGOV/CGGE/GABIN/ICMBio`; a sigla
`DIPLAN`, que constava do v6.0 do Analista de Processos SEI, é **incorreta**. A
pendência aberta na fase 6 está encerrada. A skill `cgov-nt-03-introducao` já
adotava o padrão correto e não precisou de alteração.

**Decisão 11 — convenção de siglas.** Fixada e documentada em
`04_fontes_normativas/INDICE_FONTES_NORMATIVAS.md`, Seção 6:

| Sigla | Significado | Norma | Art. 37, § único |
|---|---|---|---|
| **PGR** | Programa de Gestão para Resultados e Inovação | Portaria ICMBio nº 1.572/2023 | VIII |
| **PGRI** | Política de Gestão de Riscos e Integridade | Portaria ICMBio nº 255/2020 | IX |
| **PGD** | Programa de Gestão e Desempenho (teletrabalho) | IN ICMBio nº 14/2025 | VII |
| **PGE** | Política de Gestão Estratégica | Portaria ICMBio nº 768/2020 | — |

A convenção não é arbitrária: a própria Portaria nº 975/2021 usa a sigla
**PGRI-ICMBio** em seu Anexo. As expressões "PGR de riscos", "PGR (riscos)" e
"Plano de Gestão de Riscos — PGR" foram eliminadas de todos os arquivos e
skills, e proibidas expressamente no texto das skills afetadas.

### 11.2. Reconstituição do Art. 37 verificado

O arquivo `Art_37_Portaria_5592-2025_texto_verificado.md` **havia desaparecido**
da pasta entre 05/07/2026 e 04/08/2026. Como o PDF integral da Portaria
nº 5.592/2025 passou a constar do acervo, o texto foi reextraído diretamente.

**Decisão 12:** o arquivo foi reconstituído. A nova extração — feita a partir do
PDF do acervo do projeto, fonte distinta da usada em 05/07/2026 (Google Drive do
usuário) — coincide **palavra por palavra** com a anterior. O Art. 37 tem agora
**três verificações independentes convergentes**. O arquivo recebeu notas de
leitura sobre a distinção entre os incisos do *caput* e os do parágrafo único, e
sobre as siglas PGR e PGRI.

### 11.3. Inventário do acervo e o problema dos arquivos ilegíveis

Criado `04_fontes_normativas/INDICE_FONTES_NORMATIVAS.md`, que classifica cada
arquivo por **legibilidade por máquina** — não apenas por presença.

**Achado relevante:** estar na pasta não significa ser utilizável. Três arquivos
importantes não podem ser lidos automaticamente:

| Arquivo | Problema |
|---|---|
| Portaria ICMBio nº 4.101/2023 (Política de Governança) | PDF com codificação de fonte que devolve texto embaralhado |
| Portaria ICMBio nº 1.164/2025 (Planejamento Estratégico) | idem |
| Portaria ICMBio nº 253/2026 (Programa de Integridade) | PDF sem camada de texto (digitalização) |

**Decisão 13:** esses três arquivos recebem o status 🔒 e o assistente está
**proibido de citar dispositivo, objetivo estratégico ou indicador** deles até
que haja versão legível. A legenda de status do v7.0 foi ampliada com os
símbolos 📖 (legível sob demanda) e 🔒 (ilegível por máquina).

### 11.4. Correção de fundo na skill `cgov-gestao-riscos`

A extração da Portaria nº 975/2021 revelou que a skill instalada em 04/08/2026
continha parâmetros **que não correspondiam à norma**:

| A skill dizia | A Portaria nº 975/2021 estabelece |
|---|---|
| Níveis "Baixo / Médio / Alto / **Crítico**" | "Baixo / Médio / Alto / **Extremo**" (Tabela 9) |
| Classificação por faixas do produto (1-4, 5-9, 10-16, 17-25) | Classificação por **máscara** sobre a matriz (Tabela 9) — produtos iguais podem ter níveis diferentes |
| Escalas "1 (Rara) a 5 (Quase Certa)" e "1 (Insignificante) a 5 (Catastrófico)" | "Muito baixa a Muito alta" (Tabela 5) e "Muito baixo a Muito alto" (Tabela 7), com coluna de Ocorrências e dimensões Custo/Prazo/Escopo/Qualidade (Tabela 6) |
| Risco residual por **reclassificação** de probabilidade e impacto | Risco Residual = Risco Inerente **×** multiplicador da eficácia do controle: Inexistente 1,00 · Fraco 0,80 · Mediano 0,60 · Satisfatório 0,40 · Forte 0,20 (Tabela 10) |
| Respostas "Evitar / Reduzir / Transferir / Aceitar" | "**Mitigar / Compartilhar / Evitar / Aceitar**" (Tabela 12) |
| 7 etapas genéricas | Etapas reais 4.1 a 4.7, com nomes próprios |
| Categorias não listadas | Operacional · Legal · Financeiro/Orçamentário · Reputação · Integridade (Tabela 3), com 6 subcategorias de integridade (Tabela 4) |
| Escalonamento ao CTGRIC | Riscos **Extremo** e **Alto** são comunicados ao **Comitê Gestor** (Tabela 11) |
| Sintaxe aproximada | Transcrição literal: *"Devido o(a) `<CAUSA>`, poderá ocorrer o(a) `<EVENTO DE RISCO>`, ocasionando o(a) `<CONSEQUÊNCIA>` e impactando o alcance do `<OBJETIVO ESTRATÉGICO>`."* |

**Decisão 14:** a skill foi **reescrita integralmente** a partir do texto extraído
e reinstalada com sobrescrita, incorporando as Tabelas 3 a 13 na íntegra, a
regra de precedência da Portaria nº 975/2021 sobre ISO/COSO/TCU/CGU e a
exigência de "mostrar a conta" em toda classificação de risco.

### 11.5. Correção de fundo na skill `cgov-pgr`

A leitura do texto integral da Portaria nº 1.572/2023 revelou problema análogo:
a skill descrevia dois eixos ("Gestão por Resultados" e "Inovação
Institucional") e um arcabouço completo de indicadores institucionais, ficha de
indicador, metas anuais e limiares de alerta (🟢 ≥90%, 🟡 70-89%, 🔴 <70%) —
**nada disso consta da norma**.

A estrutura real é: **três eixos** — Capacitação (arts. 8º-10), Consultoria
interna (arts. 11-14) e Laboratório de Inovação (arts. 15-18) — e **duas ações
transversais** — Gestão do Programa (arts. 22-25) e Rede de Multiplicadores
(arts. 19-21). O único instrumento de prestação de contas previsto é o
**Relatório Anual de Resultados** (art. 26).

**Decisão 15:** a skill foi reescrita e reinstalada, com glossário oficial do
art. 2º, advertência expressa de que a norma **não** institui painel de
indicadores (esse arcabouço pertence ao PGE/PE), registro das revogações do
art. 27 (Portarias nº 38/2021 e nº 531/2021) e nota sobre a nomenclatura
"CGOV/GABIN" usada pela norma de 2023 frente à estrutura vigente sob a Portaria
nº 5.592/2025.

### 11.6. Lição de método registrada

As Decisões 14 e 15 têm a mesma origem: **skills escritas antes de a norma
estar disponível em texto** descreviam metodologia por inferência plausível, e a
inferência plausível estava errada em pontos que afetariam produto oficial —
nome de nível de risco, fórmula de cálculo, estrutura de programa.

**Diretriz para o projeto:** nenhuma skill que opere sobre norma interna do
ICMBio deve ser considerada confiável enquanto o texto da norma não estiver
depositado e extraído em `04_fontes_normativas/`. Skills nessa condição devem
declarar a lacuna e pedir o anexo, em vez de descrever o método de memória.

### 11.7. Arquivos alterados nesta fase

| Arquivo | Alteração |
|---|---|
| `04_fontes_normativas/Art_37_..._verificado.md` | Reconstituído por nova extração |
| `04_fontes_normativas/INDICE_FONTES_NORMATIVAS.md` | **Criado** — inventário com status de legibilidade e convenção de siglas |
| `05_novas_skills_propostas/cgov-gestao-riscos/SKILL.md` | Reescrito e reinstalado (`skill_01EDSqaUcenJnWFmSpFAYESd`) |
| `05_novas_skills_propostas/cgov-pgr/SKILL.md` | Reescrito e reinstalado (`skill_012RejePYXwMWmwBpBXnmnWw`) |
| `SYSTEM_INSTRUCTIONS_Analista_Processos_SEI_v7.md` | Revisão 7.1 — cabeçalho, siglas, Seção 5.4, legenda de status |
| `SYSTEM_INSTRUCTIONS_Escritorio_CGOV.md` | Siglas e base de conhecimento |
| `RESUMO_ESTRUTURADO.md` | Cobertura, siglas e pendências |
| `cgov-analista-governanca_v2.md` | Movido para a raiz pelo Coordenador — passa a ser o System Instructions independente |

---

## 12. Estrutura de pastas para análises por processo SEI (fase 8 — 05/08/2026)

O Coordenador solicitou a organização dos produtos gerados pela aplicação das
skills deste projeto (análises, histórico de aprendizado, `NT_ESTADO.md` e
demais rascunhos de trabalho) por processo SEI, em vez de espalhados na raiz
do projeto — e que essa pasta não fosse sincronizada no repositório GitHub do
projeto.

**Decisão 16:** criada a pasta `07_analises/`, com uma subpasta por processo
SEI analisado, nomeada `[nº do processo SEI]_[apelido curto]` (ex.:
`07_analises/02070.001696_2026-31_RADAR/`, para o processo de revisão da
Política — RADAR — e da Metodologia de Gestão de Riscos). A pasta foi
adicionada ao `.gitignore` (criado nesta mesma decisão, ainda inexistente no
projeto). O `NT_ESTADO.md` já criado nesta sessão para o processo
[processo SEI de referência] (triagem `cgov-nt-01`, realizada momentos antes desta
decisão) foi migrado da raiz do projeto para dentro dessa subpasta, como
primeiro caso de uso da nova convenção.

**Limitação registrada:** as 7 skills da suíte `cgov-nt` têm, em seu texto
instalado, a instrução literal de criar `NT_ESTADO.md` "na raiz do projeto
atual". Não é possível alterar esse texto a partir deste projeto (skills
instaladas são somente leitura a partir daqui; alteração exige reinstalação
via Customize → Skills). Por ora, o redirecionamento para
`07_analises/[processo]/` é aplicado manualmente a cada execução da suíte —
documentado em `SYSTEM_INSTRUCTIONS_Escritorio_CGOV.md` (Seções 3 e 7) como
regra de projeto que prevalece sobre o texto literal da skill. Ver pendência
correspondente na seção seguinte.

### 12.1. Arquivos alterados nesta fase

| Arquivo | Alteração |
|---|---|
| `07_analises/02070.001696_2026-31_RADAR/NT_ESTADO.md` | **Criado** — migrado da raiz do projeto |
| `.gitignore` | **Criado** — exclui `07_analises/` |
| `SYSTEM_INSTRUCTIONS_Escritorio_CGOV.md` | Seção 3 (nova entrada `07_analises/`) e Seção 7 (regra de redirecionamento manual) |
| `RESUMO_ESTRUTURADO.md` | Tabela "O que existe hoje" e "Pendências" |

---

## 13. Reescrita e reinstalação da suíte `cgov-nt` com o novo caminho (fase 9 — 05/08/2026)

Em continuidade à Decisão 16 (Seção 12), o Coordenador solicitou a eliminação
do redirecionamento manual: que as 7 skills da suíte `cgov-nt` passassem a
criar/ler `NT_ESTADO.md` diretamente em `07_analises/[processo]/`, e que as
demais skills do projeto fossem revisadas quanto à mesma convenção.

**Levantamento prévio:** todas as ~25 skills instaladas relacionadas à CGOV
foram lidas e verificadas quanto a referências a `NT_ESTADO.md` ou "raiz do
projeto". Resultado:

| Grupo de skills | Referencia `NT_ESTADO.md`/raiz do projeto? | Ação |
|---|---|---|
| `cgov-nt-01` a `07` | Sim — as 7 | Reescritas (ver Decisão 17) |
| Analíticas normativas (`cgov-comparar-versoes`, `cgov-modelar-fluxo`, `cgov-auditoria-competencias`, `cgov-saneamento-legistica`) | Não — saída só em chat, sem escrita em arquivo | Nenhuma alteração |
| Plano de Entregas/PGD (`cgov-elaborar-entrega`, `cgov-avaliar-entrega`, `cgov-registro-execucao`) | Não — gravam em `H:\Meu Drive\CGOV_PGD\`, local pessoal do Coordenador, propositalmente fora da pasta do projeto Cowork | Nenhuma alteração |
| `cgge-especialista-pgd` | Não — saída só em chat | Nenhuma alteração |
| Temáticas do Art. 37 (`cgov-gestao-riscos`, `cgov-air-arr`, `cgov-cadeia-valor`, `cgov-regimento-interno`, `cgov-pgr`) | Não — saída só em chat; duas delas citam `REGISTRO_DECISOES.md` (raiz), o que está correto e não muda | Nenhuma alteração |
| PGD — indicadores (`cgov-pgd-analisar-indicador`, `-desenvolver-`, `-implementar-`, `-testar-`) | Não — escopo é código de ETL/DataOps, sem relação com NT | Nenhuma alteração |

**Decisão 17:** as 7 skills `cgov-nt-01` a `07` foram reescritas e
reinstaladas (Customize → Skills, com sobrescrita). Alterações, em cada uma:

- `cgov-nt-01`: a Fase 3.2 (antes "crie... na raiz do projeto") agora instrui
  a determinar o nome da subpasta (`[processo SEI]_[apelido curto]`), criá-la
  se necessário, e criar/atualizar `NT_ESTADO.md` dentro dela — preservando o
  conteúdo já registrado se a subpasta já existir. A Fase 1 e o restante do
  raciocínio de enquadramento (Fases 2 e a Regra Especial) não foram
  alterados.
- `cgov-nt-02` a `cgov-nt-07`: cada uma recebeu, no início de sua seção de
  pré-execução, um novo item "Localização do `NT_ESTADO.md`", instruindo a
  localizar a subpasta pelo processo SEI mencionado na conversa (ou usar a
  única subpasta com triagem em andamento, se houver apenas uma; perguntar ao
  usuário se houver ambiguidade entre múltiplos processos). Nenhuma outra
  seção de conteúdo (padrão de redação, formatos de saída, regras especiais)
  foi alterada.

O código-fonte espelho em `02_skills_cgov-nt/` foi atualizado com o mesmo
conteúdo reinstalado, mantendo a prática de sincronização manual já registrada
na Decisão 1.

**Efeito prático:** o `NT_ESTADO.md` do processo de referência
(criado nesta mesma sessão, em `07_analises/02070.001696_2026-31_RADAR/`)
passa a ser lido automaticamente pelas próximas skills da suíte sem qualquer
intervenção manual de caminho.

### 13.1. Arquivos alterados nesta fase

| Arquivo | Alteração |
|---|---|
| `02_skills_cgov-nt/cgov-nt-01-triagem/SKILL.md` até `cgov-nt-07-conclusao/SKILL.md` (7 arquivos) | Reescritos — novo caminho de `NT_ESTADO.md` |
| Skills instaladas `cgov-nt-01` a `07` | Reinstaladas via sobrescrita (Customize → Skills) |
| `SYSTEM_INSTRUCTIONS_Escritorio_CGOV.md` | Seções 3 e 7 — remoção da nota de redirecionamento manual (resolvida) |
| `RESUMO_ESTRUTURADO.md` | Pendência de redirecionamento manual marcada como resolvida; nova linha na tabela "O que existe hoje" |

---

## 14. Verificação do acervo e System Instructions autônomo v3.0 (fase 10 — 14/08/2026)

### 14.1. Verificação de legibilidade dos 30 arquivos do acervo

Teste de extração de texto arquivo a arquivo, com detecção heurística de
codificação corrompida. Resultado: **20 legíveis e citáveis · 7 ilegíveis por
máquina · 3 já em Markdown**.

**Ganho:** os novos uploads das Portarias **nº 4.101/2023**, **nº 1.164/2025**,
**nº 253/2026** e **nº 257/2026** resolveram o problema de codificação registrado
em 04/08/2026 — as quatro passaram de 🔒 a ✅.

**Permanecem 🔒:** Lei nº 11.516/2007 e Decretos nº 9.203/2017, nº 11.529/2023 e
nº 12.258/2024 (codificação embaralhada, mas texto íntegro no Planalto —
gravidade baixa); Código de Ética (Portaria nº 411/2020), Portaria MMA
nº 296/2021 e Portaria ICMBio nº 2.917/2026 (digitalizações sem camada de texto,
sem fonte pública alternativa — **gravidade alta**).

**Decisão 18 — não usar OCR.** O ambiente dispõe de OCR apenas com pacote de
idioma inglês. Aplicá-lo a texto normativo em português produziria erro de
transcrição em número de artigo e data — o modo de falha que os guardrails do
projeto existem para evitar. Os três arquivos internos precisam de **novo upload
com camada de texto** (imprimir em PDF a partir do SEI, não digitalizar).

### 14.2. ⛔ Achado crítico — a PGE está revogada

O **art. 12 da Portaria ICMBio nº 1.164/2025** revogou expressamente a **Portaria
ICMBio nº 768/2020** (Política de Gestão Estratégica — PGE).

**Efeito em cascata:** a Portaria nº 975/2021 remete à PGE para a **Reunião de
Avaliação da Estratégia — RAE**, foro em que Diretorias e Gabinete apresentariam
os resultados das medidas de tratamento de risco. A remissão está
**prejudicada**, e o PE 2025-2027 **não recriou a RAE**. O ciclo vigente é outro:
monitoramento **trimestral** pelas Diretorias via **PGD Petrvs**, consolidação
pela **DPAE/CGGE** em Relatório Trimestral de Ações Prioritárias e validação pelo
**Comitê Gestor** (arts. 8º e 9º da Portaria nº 1.164/2025).

**Decisão 19:** a skill `cgov-gestao-riscos` foi corrigida e reinstalada
(`skill_01PPyu8CVACa7JUyLanZusGQ`). Ela não afirma mais que a RAE existe:
descreve o ciclo vigente, registra a remissão prejudicada e **declara a lacuna**
— o foro de apresentação dos resultados de tratamento de risco carece de
definição institucional. Lacuna normativa real do ICMBio, não falha do
assistente.

### 14.3. ✅ Pendência do Integra+ resolvida

Cadeia confirmada: **nº 923/2020 → nº 1.257/2022 → nº 253, de 16/01/2026
(VIGENTE)**. A Portaria nº 975/2021 cita a nº 923/2020 — **remissão
desatualizada**, agora registrada na skill.

### 14.4. Norma nova incorporada — CTGRIC (Portaria nº 4.529/2025)

Achado de maior impacto operacional:

> **A CGOV é a Secretaria-Executiva do CTGRIC** (art. 2º, II), presidido pela
> CGGE (art. 2º, I).

Atribuições diretas e recorrentes da Coordenação (art. 5º): organizar a pauta,
convocar, secretariar e minutar atas, encaminhá-las para aprovação, **dar
encaminhamento às deliberações e monitorar seu cumprimento**, manter o acervo e
prestar apoio técnico. Reuniões ordinárias **trimestrais**, convocação com 5 dias
úteis. O CTGRIC compõe o **SITAI** como unidade setorial no ICMBio (USI).

**Decisão 20:** o CTGRIC foi incorporado à skill de riscos e ao System
Instructions autônomo. A rotina de secretariado do Comitê é atividade regimental
da CGOV que não estava mapeada em nenhum instrumento do projeto.

### 14.5. Índice do acervo reescrito

`00_INDICE_FONTES_NORMATIVAS.md`: 30 arquivos classificados por legibilidade,
seis blocos temáticos, seção de achados, convenção de siglas ampliada (com
PGOV-ICMBio, PE 2025-2027, CTGRIC e Integra+), tabela de **cadeias de revogação**
e pendências de acervo.

### 14.6. System Instructions autônomo — v3.0

**Decisão 21:** produzido `cgov-analista-governanca_v3.md`, substituindo a v2 e
encerrando a pendência nº 10.

A v2 pressupunha que o modelo "conhecesse" as normas do ICMBio a partir de links.
Não conhece — e, quando não conhece, infere. As Decisões 14 e 15 (fase 7)
mediram o custo disso. Como a v3.0 é destinada a assistentes **sem acesso** à
pasta, ela **internaliza** a base:

| Elemento internalizado | Fonte |
|---|---|
| Art. 37 integral | Texto verificado — diff automatizado com **0 divergências** |
| Tabelas 3 a 13 da metodologia de riscos | Portaria nº 975/2021 |
| Não incidência (art. 3º, § 2º) × dispensa (art. 4º) | Decreto nº 10.411/2020 |
| Espécies de ato e competência para editar | Portaria nº 271/2013, arts. 2º e 4º |
| Os 8 quesitos do Anexo II | Portaria nº 271/2013 |
| Princípios, mecanismos e Sistema de Governança | Portaria nº 4.101/2023 |
| Missão, visão, perspectivas e ciclo do PE | Portaria nº 1.164/2025 |
| Composição, competências e funcionamento do CTGRIC | Portaria nº 4.529/2025 |
| Prazos processuais | Lei nº 9.784/1999 |

**Expansão:** de 6 comandos (v2) para **9 funções** cobrindo os eixos do
Art. 37 — `/TRIAGEM`, `/NOTA_TECNICA`, `/VALIDAR_RISCO`, `/ESTRUTURAR_AIR`,
`/MAPEAR_PROCESSO`, `/AUDITAR_COMPETENCIAS`, `/SANEAR_MINUTA`,
`/ELABORAR_MINUTA`, `/ORIENTAR`.

**Seção 5.8 — lacunas declaradas.** A v3.0 lista o que **não** internalizou
(Código de Ética, IN ICMBio nº 14/2025, Portaria nº 99/2020, Acordo de Gestão,
detalhamento do DFT, objetivos estratégicos específicos, Cadeia de Valor
vigente), instruindo o assistente a declarar a lacuna em vez de inferir. Essa
seção é o que impede a v3.0 de repetir o erro da v2.

**Verificação automatizada do v3.0:** diff do Art. 37 contra a fonte (0
divergências) · Tabela 9 conferida célula a célula (confere) · multiplicadores da
Tabela 10 íntegros · varredura de termos proibidos ("PGR de riscos", "DIPLAN",
numeração `4.1.1`) sem ocorrência indevida.

### 14.7. Arquivos alterados nesta fase

| Arquivo | Alteração |
|---|---|
| `04_fontes_normativas/00_INDICE_FONTES_NORMATIVAS.md` | Reescrito |
| `cgov-analista-governanca_v3.md` | **Criado** — System Instructions autônomo |
| `05_novas_skills_propostas/cgov-gestao-riscos/SKILL.md` | CTGRIC, Integra+ vigente, PGE revogada; reinstalada |

---

## 15. Fechamento da revisão do System Instructions v7.2 (28/08/2026)

**Decisão 22 — atualização do acervo normativo no System Instructions.** A
pendência de legibilidade das Portarias ICMBio nº 4.101/2023, nº 1.164/2025 e
nº 253/2026 é encerrada. O índice do acervo registra, desde 14/08/2026, novos
uploads com texto legível para as três normas; seus dispositivos passam a ser
citáveis, observada a conferência do caso concreto.

**Decisão 23 — vigência do Integra+.** Confirmada para a documentação do
projeto a cadeia nº 923/2020 → nº 1.257/2022 → **nº 253/2026 (vigente)**. A
remissão à nº 923/2020 na Portaria nº 975/2021 deve ser tratada como
desatualizada.

**Decisão 24 — evals remanescentes.** Foram executados e aprovados os 12 casos
de borda ainda pendentes da suíte `cgov-nt`; o relatório de execução está em
`01_relatorios/RELATORIO_EVALS_cgov-nt_2026-08-28.md`. Os registros anteriores
indicavam 16 casos totais e 13 remanescentes, mas os sete `evals.json` vigentes
contêm 15 casos, três dos quais já tinham sido executados no piloto. A revisão
identificou e corrigiu, preventivamente, a referência indevida ao futuro simples
na pré-execução da `cgov-nt-04`.

**Decisão 25 — pendência sobre padrão de numeração junto à PFE.** Por decisão
do usuário, a pendência é descartada. A suíte mantém o padrão já validado por
piloto: `### Capítulo N` e `#### N.1`.

---

## 16. Reorganização para repositório público sanitizado (28/08/2026)

**Decisão 26 — estrutura de repositório.** O projeto foi reorganizado com
`docs/` para documentação pública, `skills/` para fontes canônicas e `local/`
para análises, acervo normativo, snapshots instalados e histórico que contém
referências a processos concretos. O diretório `local/` é integralmente ignorado
pelo Git.

**Decisão 27 — publicação de fontes e histórico.** O repositório público não
redistribui PDFs normativos, materiais de terceiros nem artefatos associados a
processos SEI. O catálogo público preserva metadados e canais oficiais de acesso;
artefatos históricos só retornam a `archive/` após sanitização documental.

**Decisão 28 — caminhos operacionais.** A suíte `cgov-nt` passa a registrar
workspaces em `local/analyses/SEI_[processo]_[apelido]/`. Os caminhos numerados
que aparecem em seções anteriores deste registro são históricos.

## 17. Pendências abertas (para continuidade)

1. ~~Validação jurídica pessoal do texto do Art. 37~~ — ✅ **Resolvida em
   05/07/2026** (Seção 7 acima).
2. ~~Execução dos 12 casos de eval ainda não exercitados (casos de borda sem
   gabarito real disponível no momento do piloto).~~ — ✅ **Concluída em
   28/08/2026** (Decisão 24).
3. Otimização das descrições (`description`) das 7 skills para acionamento
   automático mais assertivo, especialmente `cgov-nt-01`.
4. Definição, junto à PFE, de qual padrão de numeração de capítulo (o agora
   adotado, `### Capítulo N`/`#### N.1`, validado por esta rodada) deve ser
   considerado o oficial da CGOV daqui em diante.
5. Cópia manual, se desejada, do PDF completo da Portaria nº 5.592/2025 para
   `04_fontes_normativas` (ver limitação de ferramenta, Seção 7).
6. ~~Instalar as 5 novas skills de `05_novas_skills_propostas/`~~ — ✅
   **Concluída em 04/08/2026** (Seção 10.3 acima).
7. Avaliar a oportunidade de criar `cgov-qcf` (Art. 37, V — Quadro de Cargos e
   Funções Comissionadas), único inciso ainda sem skill dedicada.
8. ~~Resolver a divergência `DIPLAN` × `GABIN`~~ — ✅ **Resolvida em 04/08/2026**
   (Decisão 10): `Nota Técnica nº [#]/[ano]/CGOV/CGGE/GABIN/ICMBio`.
9. ~~Anexar a `04_fontes_normativas/` o texto das portarias internas~~ — ✅
   **Concluída em 04/08/2026.** As Portarias nº 255/2020, nº 975/2021 e
   nº 1.572/2023 estão legíveis e já foram incorporadas às skills.
10. ~~Corrigir o `cgov-analista-governanca_v2.md`~~ — ✅ **Concluída em
    14/08/2026** (Decisão 21): substituído pelo `cgov-analista-governanca_v3.md`,
    com base normativa internalizada.
11. ~~Obter versão legível das Portarias nº 4.101/2023, nº 1.164/2025 e
    nº 253/2026~~ — ✅ **Concluída em 14/08/2026** pelos novos uploads.
12. ~~Confirmar se a Portaria nº 253/2026 substituiu o Integra+ (nº 923/2020)~~ —
    ✅ **Confirmado em 14/08/2026:** cadeia nº 923/2020 → nº 1.257/2022 →
    nº 253/2026 (vigente).
13. Depositar a Portaria ICMBio nº 99/2020 (regras do trabalho consultivo,
    referida no art. 25 da Portaria nº 1.572/2023).
14. ~~Reescrever e reinstalar as 7 skills da suíte `cgov-nt`~~ — ✅
    **Concluída em 05/08/2026** (Decisão 17, Seção 13).
15. **Novo upload, com camada de texto**, do Código de Ética (Portaria
    nº 411/2020), da Portaria MMA nº 296/2021 e da Portaria ICMBio nº 2.917/2026
    — os três são digitalizações sem texto e não podem ser citados.
16. **Definir institucionalmente o foro** de apresentação dos resultados de
    tratamento de risco, diante da revogação da PGE e da não recriação da RAE
    (Seção 14.2). Candidato natural: o CTGRIC, do qual a CGOV é
    Secretaria-Executiva.
17. Avaliar a **atualização da Portaria nº 975/2021**, que contém duas remissões
    desatualizadas: à PGE revogada (RAE) e à Portaria nº 923/2020 (Integra+).
18. Depositar a **IN ICMBio nº 14/2025** (regras do PGD) e a **Portaria GM/MMA
    nº 1.012/2024** (Acordo de Gestão), ausentes do acervo.
