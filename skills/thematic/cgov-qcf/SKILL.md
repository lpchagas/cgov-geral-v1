---
name: cgov-qcf
description: >
  Suporte à coordenação da elaboração e consolidação de propostas de
  adequação do Quadro Demonstrativo dos Cargos em Comissão e Funções de
  Confiança (CCE/FCE) do ICMBio, conforme Art. 37, V, da Portaria ICMBio
  nº 5.592/2025 e o Decreto nº 12.258/2024. Cobre: diagnóstico do gatilho
  (criação/extinção de unidade, redistribuição de competências,
  reclassificação de nível, permuta CCE↔FCE, remanejamento entre órgãos);
  consolidação de propostas das unidades; estruturação técnica do quadro; e
  a distinção entre alteração que exige Decreto e a que cabe ato inferior
  (Lei nº 14.204/2021 e seu regulamento, Decreto nº 10.829/2021). Use ao
  invocar /cgov-qcf, QCF, "quadro de cargos", "cargos em comissão", "funções
  de confiança", "CCE", "FCE", "remanejar cargo", "criar função de chefia",
  "converter CCE em FCE", "reclassificar cargo". Integra-se com
  cgov-regimento-interno — mudança de competência com impacto em QCF é
  coordenada simultaneamente.
---

# cgov-qcf — Quadro Demonstrativo dos Cargos em Comissão e Funções de Confiança (CGOV/ICMBio)

Esta skill apoia a CGOV/ICMBio no cumprimento do **Art. 37, parágrafo único,
inciso V**, da Portaria ICMBio nº 5.592/2025:

> "V - coordenar a elaboração e consolidação das propostas de adequação do
> Quadro Demonstrativo dos Cargos e Funções Comissionadas Executivas, no que
> compete a Estrutura Regimental do Instituto Chico Mendes;"

O verbo do dispositivo é **coordenar a elaboração e consolidação de
propostas** — não aprovar nem editar o Quadro sozinha. A CGOV reúne e
sistematiza o que as unidades propõem; a decisão final (edição do Decreto ou
do ato inferior correspondente) é do Poder Executivo federal / Presidência
do ICMBio, conforme o instrumento cabível (ver Fase 4).

---

## BASE NORMATIVA DE REFERÊNCIA

| Norma | Objeto | Papel nesta skill |
|---|---|---|
| Portaria ICMBio nº 5.592, de 11/12/2025, Art. 37, V | Competência da CGOV sobre o QCF | Enquadramento regimental (texto verificado — ver `local/normative-sources/20251211_Art_37_Portaria_5592-2025_texto_verificado.md`) |
| Decreto nº 12.258, de 25/11/2024 | Aprova a Estrutura Regimental e o Quadro Demonstrativo dos Cargos em Comissão e das Funções de Confiança do ICMBio (Anexos I a IV) | Fonte primária do QCF vigente — transcrição verificada em `local/normative-sources/20241125_Decreto 12.258_Estrutura Regimental e Quadro de Cargos.md` |
| Lei nº 14.204, de 16/09/2021 | Institui os Cargos Comissionados Executivos (CCE) e as Funções Comissionadas Executivas (FCE); extinguiu o DAS e a FCPE; disciplina transformação, critérios de ocupação e remuneração | Regime jurídico de fundo dos CCE/FCE — confirmado via texto oficial do Planalto nesta rodada |
| Decreto nº 10.829, de 05/10/2021 | Regulamenta a Lei nº 14.204/2021 | Regulamento aplicável a apostilamento, permuta CCE↔FCE, registro no SIORG, regimento interno e realocação (arts. 11 a 14, conforme citado no Art. 4º do Decreto nº 12.258/2024) |
| Decreto nº 9.739, de 28/03/2019 | Normas gerais sobre estrutura, cargos em comissão e funções de confiança na APF | ⚠️ Citado no Art. 4º do Decreto nº 12.258/2024 (arts. 14 e 15, quanto a SIORG e apostilamento) — texto integral não verificado nesta rodada; usar a citação apenas no escopo já confirmado pelo Decreto nº 12.258/2024 |

> ⚠️ **Nunca invente código, nível, quantitativo ou unidade de um CCE/FCE.**
> O Anexo II do Decreto nº 12.258/2024 (já transcrito no acervo) é a única
> fonte confiável do QCF vigente do ICMBio. Qualquer proposta de mudança
> parte do que está lá registrado — se o dado não estiver disponível no
> acervo nem for informado pelo usuário, pergunte; não estime.

---

## FASE 1 — DIAGNÓSTICO DO GATILHO E ESCOPO DA PROPOSTA

Antes de qualquer estruturação, identificar:

### 1.1 Qual é o gatilho?

| Gatilho | Tipo de alteração no QCF | Normalmente acionado junto com |
|---|---|---|
| Criação, extinção ou fusão de unidade organizacional | Criação/extinção de CCE-FCE vinculados à unidade | `cgov-regimento-interno` |
| Redistribuição de competências entre unidades | Realocação de CCE/FCE entre unidades (dentro do ICMBio) | `cgov-regimento-interno` |
| Necessidade de mais/menos cargos de chefia em uma unidade | Alteração de quantitativo | — |
| Reclassificação de nível de um cargo/função já existente | Alteração de código/nível (ex.: FCE 1.07 → FCE 1.10) | — |
| Conversão entre as duas naturezas do mesmo posto | Permuta CCE↔FCE (Decreto nº 10.829/2021, arts. 11–14) | — |
| Remanejamento entre o ICMBio e outro órgão/entidade | Transferência líquida de cargos (como no Anexo III do Decreto nº 12.258/2024) | Articulação com o órgão/entidade destinatário |
| Reestruturação decorrente de novo Decreto de Estrutura Regimental | Revisão geral do QCF | `cgov-regimento-interno` (obrigatório) |

### 1.2 O que muda concretamente?

Para cada gatilho identificado, registrar contra o Anexo II vigente
(Decreto nº 12.258/2024):

- **Situação atual:** unidade, denominação do cargo/função, código CCE/FCE,
  quantitativo hoje.
- **Situação proposta:** o que muda (quantitativo, código/nível, unidade de
  lotação, natureza CCE/FCE).
- **Justificativa técnica:** por que a mudança é necessária (carga de
  trabalho, nova competência, redistribuição, etc.).
- **Impacto orçamentário:** calcular a diferença de valor unitário/total
  usando os valores oficiais da Lei nº 14.204/2021 (Anexo II daquela Lei) —
  nunca estimar valor de cargo sem a tabela oficial.

> Lembrete regimental: **o disposto no caput do art. 6º da Lei nº 14.204/2021
> exige que a transformação não implique aumento de despesa.** Toda proposta
> deve demonstrar neutralidade de custo (ou sinalizar explicitamente que
> depende de dotação orçamentária adicional, o que exige instrumento diverso
> de uma simples transformação por decreto).

---

## FASE 2 — CONSOLIDAÇÃO DAS PROPOSTAS DAS UNIDADES

O inciso V fala em **"elaboração e consolidação das propostas"** — no
plural. A CGOV normalmente reúne pedidos de várias unidades antes de
formatar uma proposta única. Não elabore a proposta isoladamente a partir
de um único pedido sem checar se há outras demandas pendentes.

1. Levantar, com cada unidade solicitante, a mesma tabela da Fase 1.2.
2. Consolidar em um **quadro comparativo único** (Situação Atual × Situação
   Proposta × Justificativa × Unidade Demandante), no mesmo espírito da
   Planilha de Remanejamento do Anexo III do Decreto nº 12.258/2024.
3. Verificar conflitos entre propostas de unidades diferentes (ex.: duas
   unidades pedindo o mesmo cargo por permuta).
4. Se houver dúvida sobre se a competência de uma unidade já comporta a
   função pretendida, usar `cgov-auditoria-competencias` antes de prosseguir.

---

## FASE 3 — ESTRUTURAÇÃO TÉCNICA DO QUADRO

Ao formatar a proposta consolidada, seguir a mesma estrutura tabular do
Anexo II do Decreto nº 12.258/2024:

| UNIDADE | CARGO/FUNÇÃO Nº | DENOMINAÇÃO CARGO/FUNÇÃO | CCE/FCE ATUAL | CCE/FCE PROPOSTO |
|---|---|---|---|---|

E, para o impacto orçamentário, a mesma lógica do Quadro Resumo de Custos
(situação atual × situação nova × diferença), usando os valores unitários
oficiais da tabela f do Anexo I da Lei nº 11.526/2007 (na redação dada pelo
Anexo II da Lei nº 14.204/2021).

> ⚠️ Os valores unitários de CCE/FCE mudam por reajuste normativo ao longo
> do tempo. Confirme com o usuário se a tabela de valores disponível está
> atualizada antes de calcular impacto orçamentário — não presuma que os
> valores vigentes na data de instalação desta skill continuam corretos.

---

## FASE 4 — INSTRUMENTO NORMATIVO CABÍVEL

Esta é a decisão mais sensível do processo: **nem toda alteração do QCF
exige um novo Decreto.** O próprio Decreto nº 12.258/2024 (Art. 4º) distingue
o que segue por ato inferior:

| Situação | Instrumento | Base |
|---|---|---|
| Alteração dos quantitativos e distribuição de CCE/FCE já existentes, sem aumento de despesa | Decreto (ato do Poder Executivo federal) | Lei nº 14.204/2021, art. 7º |
| Registro de dados no SIORG | Ato inferior a decreto | Decreto nº 9.739/2019, arts. 14–15 (citado no Decreto nº 12.258/2024, Art. 4º, I) |
| Apostilamento | Ato inferior a decreto | Decreto nº 9.739/2019, arts. 14–15; Decreto nº 10.829/2021, arts. 11–14 (Decreto nº 12.258/2024, Art. 4º, II) |
| Permuta entre CCE e FCE (mesmo código/nível) | Ato inferior a decreto | Decreto nº 10.829/2021, arts. 11–14 (Decreto nº 12.258/2024, Art. 4º, IV) |
| Realocação de cargos/funções dentro da Estrutura Regimental do ICMBio (sem mudança de quantitativo total) | Ato inferior a decreto | Decreto nº 10.829/2021, arts. 11–14 (Decreto nº 12.258/2024, Art. 4º, VI) |
| Criação líquida de CCE/FCE, mudança de quantitativo total do ICMBio, remanejamento para/de outro órgão | Decreto | Lei nº 14.204/2021, art. 7º; precedente: Decreto nº 12.258/2024, Art. 2º e Anexo III |

> Se a proposta não se enquadrar claramente em nenhuma linha acima, **não
> presuma o instrumento** — sinalize a dúvida com ⚠️ e recomende consulta à
> PFE/ICMBio antes de qualquer encaminhamento formal.

---

## FASE 5 — ARTICULAÇÃO COM O REGIMENTO INTERNO

Sempre que a proposta de QCF decorrer de, ou impactar, uma competência do
Regimento Interno (criação/extinção/fusão de unidade, redistribuição de
competências), coordenar simultaneamente com `cgov-regimento-interno`:

- A alteração do RI (Portaria ICMBio nº 5.592/2025) não pode criar unidade
  ou cargo que o QCF vigente (Decreto nº 12.258/2024) não comporte — e
  vice-versa: uma proposta de QCF vinculada a uma unidade que ainda não
  existe no RI depende da alteração regimental correspondente primeiro (ou
  em conjunto).
- Use o mesmo Quadro de Consistência Regimental produzido por
  `cgov-regimento-interno` como insumo para checar se a distribuição de
  CCE/FCE proposta é coerente com as competências redistribuídas.

---

## FASE 6 — ENTREGA E DOCUMENTAÇÃO

Ao final de qualquer análise, apresentar:

1. **Quadro comparativo consolidado** (Situação Atual × Proposta ×
   Justificativa × Unidade Demandante).
2. **Instrumento normativo recomendado** (Fase 4), com a base que fundamenta
   a recomendação — sinalizando ⚠️ se houver dúvida.
3. **Impacto orçamentário estimado**, com a fonte da tabela de valores usada.
4. **Pendências de articulação** com o Regimento Interno, se houver.
5. **Próximos passos** — inclusive se a proposta precisa seguir para a
   PFE/ICMBio ou para consulta à Secretaria de Gestão e Inovação do
   Ministério da Gestão e da Inovação em Serviços Públicos (órgão central do
   Sistema, conforme o histórico de remanejamento do Decreto nº 12.258/2024,
   Art. 2º).

---

## REGRAS TRANSVERSAIS

- A CGOV **coordena e consolida** propostas — não decide nem edita o QCF
  unilateralmente. A decisão final é do Poder Executivo federal (via
  Decreto) ou da autoridade competente pelo ato inferior cabível.
- Nunca invente código, nível, quantitativo, unidade ou valor de CCE/FCE.
  Use apenas o que está no Anexo II do Decreto nº 12.258/2024 (ou norma mais
  recente que o tenha atualizado) ou o que o usuário fornecer explicitamente.
- Toda proposta de transformação deve demonstrar neutralidade de despesa
  (Lei nº 14.204/2021, art. 7º), salvo se o usuário sinalizar que busca
  aumento de despesa — nesse caso, o instrumento cabível muda e a hipótese
  deve ser sinalizada como excepcional.
- QCF (Quadro de Cargos e Funções Comissionadas) não deve ser confundido com
  DFT (Dimensionamento da Força de Trabalho, Art. 37, VI — skill
  `cgov-cadeia-valor`): o QCF trata da estrutura de cargos de chefia e
  assessoramento (CCE/FCE); o DFT trata do dimensionamento da força de
  trabalho como um todo, incluindo cargos efetivos.
- Saída sempre em Markdown; nunca gerar `.docx` diretamente.
