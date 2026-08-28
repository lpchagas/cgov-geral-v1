---
name: cgov-nt-02-instrucao
description: >
  Segunda etapa (opcional, conforme triagem) da suíte canônica cgov-nt.
  Realiza a instrução técnica de QUALQUER dado bruto anexado ao projeto —
  planilhas/CSV de consultas internas, respostas discursivas, indicadores do
  PGD, atas — produzindo um Quadro de Achados padronizado (quantitativo e/ou
  qualitativo) que alimenta a redação dos capítulos da NT. Use ao invocar
  /cgov-nt-02, "analisar os dados da consulta", "tabular as respostas",
  "análise quantitativa", "análise qualitativa", "extrair achados", "processar
  a planilha/CSV para a NT". NÃO use para auditoria de texto normativo isolado
  (use cgov-auditoria-competencias, cgov-comparar-versoes ou
  cgov-saneamento-legistica) nem para redigir capítulos de texto corrido (use
  cgov-nt-03 a 07). Requer `NT_ESTADO.md` já criado por cgov-nt-01, em
  `local/analyses/SEI_[processo]_[apelido]/`; se não existir, redirecione para
  cgov-nt-01 primeiro.
---

# cgov-nt-02 — Instrução Técnica (Diagnóstico Analítico de Dados Brutos)

Esta skill converte dados brutos de qualquer natureza em um **Quadro de Achados**
padronizado, servindo de insumo objetivo para a redação dos capítulos da NT
(`cgov-nt-04` e `cgov-nt-05`). Ela substitui a necessidade de skills isoladas por
tipo de dado (demografia, perguntas fechadas, perguntas abertas) por um único
fluxo adaptativo.

## PRÉ-REQUISITO

1. **Localização do `NT_ESTADO.md`:** o arquivo do processo em análise vive em
   `local/analyses/SEI_[processo]_[apelido]/NT_ESTADO.md` — não na raiz do
   projeto. Identifique a subpasta pelo processo SEI mencionado nesta
   conversa; se houver apenas um processo com triagem em andamento sob
   `local/analyses/`, use-o diretamente. Se houver mais de um e não for possível
   identificar o processo pelo contexto, pergunte ao usuário antes de
   prosseguir.
2. Confirme a existência de `NT_ESTADO.md` nessa subpasta. Se ausente,
   interrompa e oriente o usuário a executar `cgov-nt-01` primeiro.
3. Leia `NT_ESTADO.md` para recuperar o enquadramento e o tipo de produto (A/B/C/D)
   definidos na triagem — isso orienta qual variante da Fase 2 usar abaixo.

## FASE 1 — IDENTIFICAÇÃO DO TIPO DE DADO

Classifique o(s) arquivo(s)/dado(s) fornecido(s) em uma ou mais categorias
(um mesmo processo pode ter mais de uma):

| Categoria | Exemplos | Técnica aplicável (Fase 2) |
|---|---|---|
| **Quantitativa estruturada** | Planilha/CSV de respostas fechadas, indicadores, frequências | 2.A |
| **Qualitativa discursiva** | Respostas abertas, atas, e-mails, relatos | 2.B |
| **Demográfica/perfil de amostra** | Cadastro de respondentes (gênero, lotação, tempo de casa etc.) | 2.C |
| **Normativa** | Minuta de portaria/IN a diagnosticar (remissões, fluxo, competências) | Encaminhar para `cgov-comparar-versoes` / `cgov-modelar-fluxo` / `cgov-auditoria-competencias` — **não duplique esse trabalho aqui** |

Se o dado for puramente normativo, não prossiga nesta skill: oriente o uso das
skills analíticas normativas dedicadas e retorne a esta suíte apenas para
consolidar os achados delas em `cgov-nt-04`.

## FASE 2 — EXECUÇÃO DA ANÁLISE

### 2.A — Análise Quantitativa
1. Valide a integridade dos dados (linhas, colunas, valores ausentes, tipos).
2. Tabule frequências/percentuais por pergunta/indicador e por variável de corte
   relevante ao caso (ex.: lotação, unidade, tempo de instituição — apenas os
   cortes que fizerem sentido para o objeto da análise, não aplique cegamente
   um template de outro processo).
3. Calcule, quando aplicável, um índice de tensão/relevância por item (ex.:
   proporção de respostas discordantes/críticas) para priorizar achados.
4. Busque correlações relevantes entre variáveis, sem forçar relações que os
   dados não sustentem.

### 2.B — Análise Qualitativa
1. Leia a íntegra das respostas/discursos antes de classificar.
2. Agrupe por tema emergente (clusterização) — não use temas de outro processo
   como categorias fixas; deixe os temas emergirem dos dados.
3. Extraia **Pares de Oposição** (argumentos conflitantes sobre o mesmo ponto)
   e **Pontos Sensíveis** (questões que exigem atenção da alta gestão).
4. Cite trechos ilustrativos de forma paraFraseada/anonimizada quando os dados
   contiverem informação identificável de servidores (LGPD).

### 2.C — Perfil da Amostra
1. Extraia e tabule as variáveis demográficas/institucionais disponíveis.
2. Avalie a representatividade (compare com o universo total, se conhecido).
3. Identifique os grupos mais impactados pelo tema em análise.

## FASE 3 — CONSOLIDAÇÃO NO QUADRO DE ACHADOS

Gere a saída, em Markdown, no chat, com esta estrutura (adapte as tabelas ao(s)
tipo(s) de dado(s) efetivamente processado(s) — não inclua seções vazias):

```
### Instrução Técnica — Quadro de Achados

**Fonte(s) de dados analisada(s):** [arquivo(s), período, universo/amostra]

#### 1. Perfil da amostra (se aplicável)
[tabela de perfil + nota sobre representatividade]

#### 2. Achados quantitativos (se aplicável)
| Nº | Tema/Pergunta | Resultado | Corte relevante | Prioridade sugerida |
|---|---|---|---|---|

#### 3. Achados qualitativos (se aplicável)
| Nº | Cluster temático | Síntese | Pares de oposição | Ponto sensível? |
|---|---|---|---|---|

#### 4. Síntese executiva (5-8 linhas)
[resumo objetivo dos achados mais relevantes para orientar a redação da NT]
```

Ao final, **acrescente esta síntese à seção "Achados e insumos consolidados" do
`NT_ESTADO.md`** (na subpasta localizada no Pré-requisito) e marque o item
correspondente do roteiro como concluído.

## REGRAS DE QUALIDADE

- Nunca invente números, percentuais ou citações que não constem dos dados
  fornecidos. Se um dado necessário não estiver disponível, declare a lacuna
  explicitamente em vez de estimar.
- Trate dados pessoais conforme a LGPD: nomes próprios, matrículas (SIAPE) ou
  identificadores de servidores não devem aparecer nos achados consolidados,
  salvo autorização explícita do usuário.
- Não gerar arquivo `.docx` — a saída é Markdown no chat (e no `NT_ESTADO.md`).

## ENCADEAMENTO

```
/cgov-nt-01 → [diagnóstico normativo prévio, se Tipo A] → /cgov-nt-02 (esta skill) → /cgov-nt-03
```
