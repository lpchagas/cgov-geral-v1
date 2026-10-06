---
name: cgov-air-arr
description: >
  Suporte metodológico à Análise de Impacto Regulatório (AIR) e à Avaliação de
  Resultado Regulatório (ARR) no ICMBio, conforme Art. 37, X, da Portaria
  ICMBio nº 5.592/2025 e o Decreto nº 10.411/2020. Cobre: triagem de
  incidência, não incidência (art. 3º, § 2º) e dispensa (art. 4º); diagnóstico
  do problema regulatório com árvore de causas; análise de alternativas
  normativas e não normativas; impactos sobre partes afetadas; estrutura do
  relatório de AIR; e ARR de normas em vigor. Use ao invocar /cgov-air-arr,
  AIR_ARR, "análise de impacto regulatório", "avaliação de resultado
  regulatório", "AIR", "ARR", "Decreto 10.411", "problema regulatório",
  "alternativas não normativas", "dispensa de AIR", "nota de dispensa",
  "impacto de norma", "custo-benefício regulatório", "partes afetadas pela
  norma", "qualidade regulatória", "justificativa de edição de norma". Acione
  também quando o usuário perguntar se um ato precisa de AIR ou se pode
  dispensá-la antes de ser editado.
---

# cgov-air-arr — Análise de Impacto Regulatório e Avaliação de Resultado Regulatório (CGOV/ICMBio)

Esta skill apoia a CGOV/ICMBio no cumprimento do **Art. 37, X** da Portaria
ICMBio nº 5.592/2025 — elaborar e difundir recomendações metodológicas para
AIR e ARR — aplicando o **Decreto nº 10.411, de 30 de junho de 2020** e os
guias metodológicos da Casa Civil.

---

## BASE NORMATIVA E METODOLÓGICA DE REFERÊNCIA

| Documento | Objeto | Papel nesta skill |
|---|---|---|
| Decreto nº 10.411/2020 | Regulamenta AIR e ARR na administração federal | Fonte primária: hipóteses de não incidência e dispensa, etapas obrigatórias, conteúdo do relatório |
| Lei nº 13.874/2019, art. 5º, e Lei nº 13.848/2019, art. 6º | Fundamento legal da AIR | Base habilitante do Decreto |
| Diretrizes Gerais e Guia Orientativo AIR (Casa Civil, 2018) | Metodologia para elaboração de AIR | Roteiro de seções e boas práticas |
| Guia Orientativo para ARR (Casa Civil, 2021) | Metodologia para ARR de normas em vigor | Critérios de avaliação de efetividade regulatória |
| Portaria ICMBio nº 5.592/2025 (Art. 37, X) | Competência normativa da CGOV | Enquadramento regimental |

> ⚠️ **Nunca cite artigos ou incisos de normas sem confirmar a redação exata.**
> Ao referenciar o Decreto 10.411/2020, indique a seção e não o artigo exato
> quando não tiver certeza do dispositivo específico.
>
> ✅ **Exceção — dispositivos já verificados.** Os arts. 1º (§§ 1º e 3º), 2º (II),
> 3º (§ 2º), 4º (e §§ 1º a 3º), 6º, 7º, 9º-A, 12 e 15 do Decreto nº 10.411/2020
> foram conferidos contra o texto oficial (Planalto) em 04/08/2026 e estão
> transcritos nesta skill. Podem ser citados com o número do dispositivo.
> Considerar as alterações dos Decretos nº 11.243/2022 e nº 11.259/2022.

---

## MODO 1 — ANÁLISE DE IMPACTO REGULATÓRIO (AIR)

Use quando o ICMBio está **prestes a editar ou revisar** um ato normativo.

### Passo 1.1 — Triagem: incidência, não incidência e dispensa

Antes de estruturar a AIR, faça a triagem em três perguntas, **nesta ordem**.
Colete do usuário: tipo do ato (Portaria, IN, Resolução, Norma de Execução,
Ordem de Serviço), objeto, e se os efeitos alcançam agentes econômicos ou
usuários dos serviços prestados — ou apenas o âmbito interno do Instituto.

#### (a) O Decreto se aplica ao caso?

O Decreto nº 10.411/2020 alcança os atos normativos **de interesse geral de
agentes econômicos ou de usuários dos serviços prestados** (art. 1º, § 1º).
Ele **não se aplica** a propostas de edição de decreto nem a atos a serem
submetidos ao Congresso Nacional (art. 1º, § 3º).

#### (b) Hipóteses de NÃO INCIDÊNCIA — art. 3º, § 2º

A obrigação de AIR **não se aplica** aos atos normativos:

| Inciso | Hipótese |
|---|---|
| I | de natureza administrativa, cujos efeitos sejam restritos ao âmbito interno do órgão ou da entidade |
| II | de efeitos concretos, destinados a disciplinar situação específica, cujos destinatários sejam individualizados |
| III | que disponham sobre execução orçamentária e financeira |
| IV | que disponham estritamente sobre política cambial e monetária |
| V | que disponham sobre segurança nacional |
| VI | que visem a consolidar outras normas sobre matérias específicas, sem alteração de mérito |

#### (c) Hipóteses de DISPENSA — art. 4º

A AIR **poderá ser dispensada, desde que haja decisão fundamentada** do órgão
ou da entidade competente, nas hipóteses de:

| Inciso | Hipótese |
|---|---|
| I | urgência |
| II | ato destinado a disciplinar direitos ou obrigações definidos em norma hierarquicamente superior que não permita, técnica ou juridicamente, diferentes alternativas regulatórias |
| III | ato normativo considerado de baixo impacto |
| IV | atualização ou revogação de normas consideradas obsoletas, sem alteração de mérito |
| V | preservação de liquidez, solvência ou higidez dos mercados de seguro, resseguro, capitalização e previdência complementar; dos mercados financeiros, de capitais e de câmbio; ou dos sistemas de pagamentos |
| VI | manutenção da convergência a padrões internacionais |
| VII | redução de exigências, obrigações, restrições, requerimentos ou especificações com o objetivo de diminuir custos regulatórios |
| VIII | revisão de normas desatualizadas para adequação ao desenvolvimento tecnológico consolidado internacionalmente (Decreto nº 10.229/2020) |

**Definição de baixo impacto (art. 2º, II):** ato que, cumulativamente, (a) não
provoque aumento expressivo de custos para agentes econômicos ou usuários dos
serviços; (b) não provoque aumento expressivo de despesa orçamentária ou
financeira; e (c) não repercuta de forma substancial nas políticas públicas de
saúde, segurança, ambientais, econômicas ou sociais.

#### ⚠️ Distinção crítica — não confunda os dois regimes

Este é o erro técnico mais comum no tema. **Não incidência ≠ dispensa**, e as
consequências formais são diferentes:

| | Não incidência (art. 3º, § 2º) | Dispensa (art. 4º) |
|---|---|---|
| Natureza | A obrigação não incide sobre o ato | A obrigação incide, mas é afastada |
| Decisão fundamentada | Não exigida pelo art. 4º | **Exigida** (*caput*) |
| Nota técnica de fundamentação | Não decorre do art. 4º, § 1º | **Exigida** (art. 4º, § 1º) |
| Conteúdo mínimo da nota, se por urgência | — | Problema regulatório + objetivos (art. 4º, § 2º) |
| ARR obrigatória | — | Em até **3 anos**, se a dispensa foi por urgência (art. 12) |
| Consulta pública | Facultativa (art. 9º-A) | Facultativa (art. 9º-A); nas hipóteses dos incisos III, VI e VIII, se não houver consulta, usar outro mecanismo de participação social |
| Publicidade | — | Nota disponibilizada no sítio eletrônico, ressalvado sigilo da LAI (art. 4º, § 3º) |

Em ambos os casos permanece o **dever de motivação** do ato administrativo
(Lei nº 9.784, de 29 de janeiro de 1999, art. 50).

**Redação-modelo para ato interna corporis do ICMBio:**

> "O ato proposto tem natureza administrativa e efeitos restritos ao âmbito
> interno do Instituto, hipótese de **não incidência** da obrigação de análise
> de impacto regulatório, nos termos do art. 3º, § 2º, inciso I, do Decreto
> nº 10.411, de 30 de junho de 2020 — o que não afasta o dever de motivação
> previsto no art. 50 da Lei nº 9.784, de 29 de janeiro de 1999."

> Se o caso for de **dispensa** (art. 4º), elabore a **Nota de Dispensa de AIR**
> com: identificação do ato; inciso do art. 4º invocado; justificativa
> fundamentada; se por urgência, o problema regulatório e os objetivos
> pretendidos, com registro do prazo de 3 anos para a ARR; e identificação da
> autoridade responsável pela decisão.

### Passo 1.2 — Definição do Problema Regulatório

Esta é a etapa mais crítica e frequentemente mal executada. Orientar o usuário:

1. **Descrever o problema** em uma frase objetiva, do ponto de vista dos
   cidadãos, servidores ou do meio ambiente — não do ICMBio como organização.
2. **Separar sintomas de causas raízes** usando a Árvore de Causas:
   - Sintoma: manifestação visível do problema (ex.: "alta taxa de não
     conformidade no licenciamento").
   - Causa raiz: origem estrutural (ex.: "ausência de prazo mínimo para
     instrução do processo").
3. **Quantificar o problema** sempre que possível: número de afetados, custo
   estimado, frequência do evento.
4. **Delimitar o escopo**: o problema é novo (AIR para edição) ou decorre de
   norma existente ineficaz (AIR para revisão / ARR)?

> ⚠️ Alerte se o usuário apresentar como "problema regulatório" algo que é
> uma solução (ex.: "o problema é que não temos uma portaria regulando X") —
> isso é prematura definição de resposta, não do problema.

### Passo 1.3 — Análise de Alternativas

O Decreto nº 10.411/2020 exige que se descrevam as alternativas possíveis,
consideradas as opções de não ação, de soluções normativas e, sempre que
possível, de soluções não normativas (art. 6º, VI). Orientar a construção de
ao menos três alternativas:

| Alternativa | Tipo | Exemplo |
|---|---|---|
| A0 | Não fazer nada (linha de base) | Manter o status quo e monitorar |
| A1 | Solução não normativa | Capacitação, ajuste de processo, comunicação |
| A2 | Solução normativa mínima | Portaria de procedimento interno |
| A3 | Solução normativa ampla | IN com efeitos externos |

Para cada alternativa, analisar:
- Eficácia esperada (resolve o problema completamente? parcialmente?).
- Custos para o ICMBio e para os afetados.
- Facilidade de implementação e monitoramento.
- Riscos de efeitos adversos não pretendidos.

**Metodologias admitidas para aferir a razoabilidade do impacto econômico
(art. 7º):** análise multicritério; análise de custo-benefício; análise de
custo-efetividade; análise de custo; análise de risco; ou análise risco-risco.
Outra metodologia é admitida desde que justificada como a mais adequada ao caso
concreto (art. 7º, § 2º). A escolha deve ser justificada e apresentar o
comparativo entre as alternativas (art. 7º, § 1º).

### Passo 1.4 — Identificação das Partes Interessadas e Impactos

- Mapear os **grupos afetados** pela alternativa escolhida (servidores, unidades
  de conservação, populações locais, setor produtivo, outros órgãos).
- Para cada grupo, estimar o impacto: positivo/negativo, direto/indireto,
  imediato/de longo prazo.
- Avaliar expressamente os **impactos sobre microempresas e empresas de pequeno
  porte** e as medidas para minimizá-los (art. 6º, VII-A, e § 2º).
- Indicar se é necessária **consulta pública** antes da edição do ato. Após a
  conclusão da AIR, se o órgão optar pela edição, alteração ou revogação de ato
  normativo, o texto preliminar **deve** ser objeto de consulta pública
  (art. 9º, na redação do Decreto nº 11.243/2022), realizada pelo portal
  Participa + Brasil (art. 10). Prazo mínimo, ressalvada urgência: 60 dias para
  casos que impactem significativamente o comércio internacional e 45 dias para
  os demais (art. 9º, § 2º).

### Passo 1.5 — Estrutura do Relatório de AIR (art. 6º)

Orientar a organização do documento final com o conteúdo mínimo do art. 6º:

1. Sumário executivo objetivo e conciso, em linguagem simples e acessível.
2. Identificação do problema regulatório, com causas e extensão.
3. Identificação dos agentes econômicos, usuários dos serviços e demais
   afetados.
4. Fundamentação legal que ampara a ação do órgão.
5. Definição dos objetivos a serem alcançados.
6. Descrição das alternativas possíveis, incluindo não ação e, sempre que
   possível, soluções não normativas.
7. Possíveis impactos das alternativas, inclusive custos regulatórios.
8. Impactos sobre microempresas e empresas de pequeno porte.
9. Considerações sobre manifestações recebidas em participação social.
10. Mapeamento da experiência internacional.
11. Efeitos e riscos decorrentes da edição, alteração ou revogação do ato.
12. Comparação fundamentada das alternativas, com a metodologia escolhida e a
    alternativa (ou combinação) sugerida.
13. Estratégia de implementação, monitoramento e avaliação e, quando couber,
    avaliação da necessidade de alteração ou revogação de normas vigentes.

**Natureza do relatório (art. 15):** subsidia, mas **não vincula** a decisão da
autoridade competente, a quem cabe adotar a alternativa sugerida, determinar a
complementação da AIR ou adotar alternativa contrária — hipótese em que a
decisão deve ser fundamentada (art. 15, §§ 2º e 3º).

---

## MODO 2 — AVALIAÇÃO DE RESULTADO REGULATÓRIO (ARR)

Use quando o ICMBio quer avaliar **se uma norma já em vigor** está alcançando
seus objetivos.

### Passo 2.1 — Seleção da Norma e Escopo

- Identificar a norma a ser avaliada (número, data, objeto, vigência).
- Verificar se há previsão de ARR no próprio ato ou em norma superior.
- Verificar se a AIR foi dispensada por urgência — nesse caso a ARR é
  obrigatória no prazo de três anos da entrada em vigor (art. 12).
- Definir o período de análise e a unidade responsável pelo levantamento de dados.

> A ARR pode ter caráter temático e alcançar apenas partes específicas de um ou
> mais atos normativos (art. 13, § 1º). Os órgãos instituem agenda de ARR com,
> no mínimo, um ato normativo de interesse geral do seu estoque regulatório
> (art. 13, § 2º), observando preferencialmente os critérios do art. 13, § 3º:
> ampla repercussão na economia ou no País; problemas decorrentes da aplicação
> do ato; impacto significativo em organizações ou grupos específicos; matéria
> relevante para a agenda estratégica do órgão; ou vigência há, no mínimo,
> cinco anos.

### Passo 2.2 — Reconstrução do Problema Original e dos Objetivos

- Qual problema a norma pretendia resolver quando editada?
- Quais eram os resultados esperados (se registrados na AIR original ou no
  preâmbulo do ato)?
- Quais indicadores de resultado foram definidos (ou deveriam ter sido)?

### Passo 2.3 — Coleta e Análise de Evidências

- Levantar dados quantitativos e qualitativos sobre a implementação.
- Verificar: a norma foi cumprida? Gerou os efeitos pretendidos? Causou
  efeitos adversos não previstos?
- Identificar barreiras à implementação: falta de recursos, resistência,
  ambiguidade do texto, sobreposição com outras normas.

### Passo 2.4 — Diagnóstico e Recomendação

Com base na análise, emitir um dos diagnósticos:

| Diagnóstico | Significado | Recomendação |
|---|---|---|
| Eficaz e suficiente | A norma resolve o problema com custos razoáveis | Manter com ajustes de calibração, se necessários |
| Eficaz mas desproporcionalmente custosa | Resultado alcançado, mas com custo excessivo | Revisar para simplificar sem perder eficácia |
| Ineficaz | Problema persiste mesmo com a norma em vigor | Revisar causas e propor nova AIR |
| Obsoleta | Problema não existe mais ou mudou de natureza | Revogar ou consolidar |

---

## REGRAS TRANSVERSAIS

- A AIR é um instrumento de **suporte à decisão**, não substituto dela — a
  escolha da alternativa é da autoridade competente (art. 15).
- Nunca apresentar a edição de nova norma como a única alternativa sem explorar
  opções não normativas — isso contraria o art. 6º, VI, do Decreto 10.411/2020.
- Nunca tratar hipótese de não incidência (art. 3º, § 2º) como dispensa
  (art. 4º), nem vice-versa — as consequências formais são diferentes.
- Ao citar dados de impacto (custo, número de afetados), sinalize ⚠️ quando a
  estimativa for do usuário e não estiver fundamentada em fonte verificável.
- A inobservância do Decreto nº 10.411/2020 não constitui escusa válida para o
  descumprimento da norma editada nem acarreta a sua invalidade (art. 21) —
  mas isso não dispensa o órgão de cumpri-lo.
- A CGOV elabora **recomendações metodológicas** (Art. 37, X) — não emite
  pareceres jurídicos sobre a legalidade dos atos. Se houver dúvida jurídica,
  encaminhar à PFE/ICMBio.
- Saída sempre em Markdown; nunca gerar `.docx` diretamente.
