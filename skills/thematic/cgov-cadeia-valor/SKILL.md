---
name: cgov-cadeia-valor
description: >
  Suporte à elaboração, atualização e análise da Cadeia de Valor, do Catálogo
  de Produtos e Serviços e do Dimensionamento da Força de Trabalho (DFT) do
  ICMBio, conforme Art. 37, VI, da Portaria ICMBio nº 5.592/2025 e a Portaria
  SEDGG/ME nº 7.888/2022. Cobre: arquitetura de macroprocessos (finalísticos,
  de apoio e gerenciais); modelagem com SIPOC; elaboração e revisão do
  Catálogo; alinhamento da Cadeia de Valor com o Planejamento Estratégico; e
  orientação sobre DFT. Use ao invocar /cgov-cadeia-valor, CADEIA_VALOR,
  "cadeia de valor", "catálogo de produtos", "catálogo de serviços",
  "macroprocesso", "processo finalístico", "processo de apoio", "processo
  gerencial", "SIPOC", "Portaria 7.888", "DFT", "dimensionamento da força de
  trabalho", "arquitetura de processos", "atualizar a cadeia de valor",
  "revisar os macroprocessos". Acione também quando o usuário descrever um
  fluxo de atividades e pedir para estruturá-lo na arquitetura institucional
  do ICMBio.
instalado_em: 2026-08-04
status: instalada na conta Claude (Customize -> Skills)
---

# cgov-cadeia-valor — Cadeia de Valor, Catálogo de Produtos/Serviços e DFT (CGOV/ICMBio)

Esta skill apoia a CGOV/ICMBio no cumprimento do **Art. 37, VI** da Portaria
ICMBio nº 5.592/2025 — coordenar as atividades de elaboração, monitoramento e
modernização da Cadeia de Valor e Catálogo de Produtos e Serviços, em
consonância com o **Dimensionamento da Força de Trabalho (DFT)**.

---

## BASE NORMATIVA E METODOLÓGICA DE REFERÊNCIA

| Documento | Objeto | Papel nesta skill |
|---|---|---|
| Portaria ICMBio nº 5.592/2025, Art. 37, VI | Competência da CGOV sobre Cadeia de Valor e DFT | Enquadramento regimental |
| Portaria SEDGG/ME nº 7.888, de 1º/09/2022 | Metodologia federal de DFT | Orientações sobre o processo de dimensionamento |
| Guia de Gestão por Processos na APF (MGI) | Referência metodológica federal | Estrutura de macroprocessos, classificação de processos |
| BPM CBOK (ABPMP) | Framework internacional de gestão por processos | Referência conceitual: SIPOC, ciclo PDCA de processos |
| Portaria ICMBio nº 1.164/2025 | Planejamento Estratégico ICMBio 2025-2027 | Alinhamento da Cadeia de Valor com a estratégia |

> ⚠️ **A Cadeia de Valor e o Catálogo de Produtos/Serviços vigentes do ICMBio
> são documentos institucionais que devem ser fornecidos pelo usuário ou estar
> disponíveis no projeto.** Esta skill estrutura e analisa — não cria dados
> institucionais sem base documental.

---

## FASE 1 — IDENTIFICAÇÃO DO ESCOPO

Antes de qualquer modelagem, confirmar:

1. **Objeto de trabalho:** o usuário quer (a) modelar um novo processo/
   macroprocesso, (b) revisar a Cadeia de Valor existente, (c) elaborar ou
   atualizar o Catálogo de Produtos/Serviços, ou (d) analisar para fins de DFT?
2. **Nível de análise:** Cadeia de Valor (nível estratégico), macroprocesso
   (nível tático) ou processo (nível operacional)?
3. **Insumos disponíveis:** Cadeia de Valor atual, Catálogo existente,
   fluxogramas, normas que regem o processo, entrevistas com equipes.
4. **Finalidade:** atualização normativa, suporte ao PGD, DFT, relatório
   gerencial, alinhamento estratégico?

---

## FASE 2 — ESTRUTURAÇÃO DA CADEIA DE VALOR

### 2.1 Arquitetura de Macroprocessos

A Cadeia de Valor do ICMBio deve ser organizada em três categorias:

| Categoria | Definição | Exemplos no contexto ICMBio |
|---|---|---|
| **Finalísticos** | Entregam diretamente o valor ao cidadão/beneficiário final | Proteção e Manejo de UCs, Licenciamento, Biodiversidade |
| **De Apoio** | Sustentam os finalísticos sem gerar valor diretamente | Gestão de Pessoas, TIC, Infraestrutura, Contabilidade |
| **Gerenciais** | Dirigem, monitoram e controlam o desempenho | Planejamento Estratégico, Governança, Gestão de Riscos, Controle Interno |

Para cada macroprocesso identificado, registrar:
- **Nome:** substantivo + complemento (ex.: "Gestão da Biodiversidade")
- **Categoria:** Finalístico / Apoio / Gerencial
- **Objetivo:** resultado que o macroprocesso deve produzir
- **Principais entregas (outputs):** produtos ou serviços gerados
- **Clientes/beneficiários:** quem recebe as entregas
- **Unidades responsáveis:** líderes e participantes no ICMBio

### 2.2 Alinhamento com o Planejamento Estratégico

Verificar se cada macroprocesso:
- Está conectado a pelo menos um **Objetivo Estratégico** do PE ICMBio
  2025-2027 (Portaria ICMBio nº 1.164/2025).
- Contribui para os indicadores de resultado do Planejamento Estratégico.
- Não está duplicado ou sobreposto com outro macroprocesso já existente.

> Se houver lacunas (objetivos estratégicos sem macroprocesso correspondente)
> ou sobreposições, sinalize explicitamente — isso é insumo para revisão da
> arquitetura institucional.

---

## FASE 3 — MODELAGEM DE PROCESSO COM SIPOC

Para detalhar um processo dentro de um macroprocesso, usar a ferramenta **SIPOC**:

| Elemento | Pergunta | O que registrar |
|---|---|---|
| **S — Suppliers (Fornecedores)** | Quem fornece os insumos? | Unidades internas, órgãos externos, sistemas |
| **I — Inputs (Entradas)** | O que chega para disparar o processo? | Documentos, solicitações, dados, autorizações |
| **P — Process (Processo)** | Quais as etapas principais (máx. 7)? | Sequência lógica de atividades, com responsável |
| **O — Outputs (Saídas)** | O que o processo entrega? | Produto ou serviço resultante (deve ser mensurável) |
| **C — Customers (Clientes)** | Quem recebe as saídas? | Beneficiários internos ou externos |

**Regra de qualidade do SIPOC:**
- Toda entrada deve ter um fornecedor identificado.
- Toda saída deve ter um cliente identificado.
- O processo deve transformar entradas em saídas — processos que não
  transformam nada são na verdade controles ou aprovações, não processos.

---

## FASE 4 — CATÁLOGO DE PRODUTOS E SERVIÇOS

O Catálogo é o inventário oficial das **entregas do ICMBio** para seus
beneficiários. Para cada item do catálogo, estruturar:

| Campo | Conteúdo |
|---|---|
| **Código** | Identificador único (ex.: FIN-001) |
| **Nome do produto/serviço** | Substantivo + adjetivo/complemento |
| **Descrição** | O que é entregue, em até 3 linhas |
| **Macroprocesso de origem** | Qual macroprocesso o produz |
| **Beneficiário** | Quem recebe (cidadão, órgão, servidor) |
| **Unidade responsável** | Quem responde pela entrega |
| **Base legal** | Norma que fundamenta a atividade |
| **Indicador de volume** | Quantidade produzida (para DFT) |

---

## FASE 5 — ORIENTAÇÕES SOBRE DFT (Portaria SEDGG/ME nº 7.888/2022)

O Dimensionamento da Força de Trabalho é a etapa seguinte à Cadeia de Valor.
Esta skill orienta a conexão entre os dois instrumentos:

1. Cada **processo/subprocesso** mapeado na Cadeia de Valor serve de base para
   calcular a carga de trabalho por atividade.
2. A **quantidade e o volume das entregas** do Catálogo de Produtos/Serviços
   alimentam os cálculos de demanda de pessoal.
3. A CGOV coordena as atividades de DFT (Art. 37, VI) — **não elabora o DFT
   isoladamente**; o produto depende da participação de todas as áreas e da
   CGGP.
4. Para cada processo, registrar:
   - Tempo médio de execução por unidade de entrega.
   - Frequência de execução (diária/semanal/mensal/eventual).
   - Número atual de servidores envolvidos.

> ⚠️ Dados de pessoal e carga horária devem ser fornecidos pelo usuário ou
> pelas unidades — nunca estimados sem base empírica.

---

## FASE 6 — ENTREGA E DOCUMENTAÇÃO

Ao final de qualquer análise, apresentar:

1. **Arquitetura de macroprocessos atualizada** (tabela ou diagrama Mermaid).
2. **SIPOC(s)** do(s) processo(s) analisado(s), em formato tabular.
3. **Extrato de Catálogo** dos produtos/serviços identificados.
4. **Diagnóstico de alinhamento** com o Planejamento Estratégico (o quê está
   alinhado, o quê tem lacuna, o quê está duplicado).
5. **Próximos passos** recomendados para completar o ciclo (DFT, validação com
   áreas, publicação do catálogo atualizado).

---

## REGRAS TRANSVERSAIS

- A Cadeia de Valor é um **instrumento dinâmico** — toda revisão deve ser
  registrada com data e motivação no `docs/governance/decision-log.md` do projeto.
- Macroprocessos não são organogramas: um macroprocesso pode envolver várias
  unidades. Não confundir estrutura funcional com arquitetura de processos.
- O ICMBio é órgão de missão ambiental — os processos finalísticos devem sempre
  refletir entregas para a conservação da biodiversidade e para as comunidades
  das UCs, não apenas para a estrutura interna.
- Saída sempre em Markdown; nunca gerar `.docx` diretamente.
