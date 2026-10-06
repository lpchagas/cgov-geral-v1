---
name: cgov-regimento-interno
description: >
  Suporte à coordenação da atualização do Regimento Interno (RI) do ICMBio,
  conforme Art. 37, IV, da Portaria ICMBio nº 5.592/2025. Cobre revisão geral
  por novo Decreto de Estrutura Regimental, alteração pontual por criação,
  extinção ou fusão de unidade, e correção de inconsistência em vigência.
  Orienta o diagnóstico de gatilho e impacto, a articulação interunidades, a
  redação da minuta de portaria de alteração, a hierarquia normativa, a
  legística e a submissão à PFE. Integra-se com cgov-auditoria-competencias,
  cgov-comparar-versoes e cgov-saneamento-legistica. Use ao invocar
  /cgov-regimento-interno, REGIMENTO_INTERNO, "atualizar o regimento",
  "alterar o RI", "revisão do regimento interno", "Portaria 5.592", "Decreto
  de Estrutura Regimental", "criação de unidade", "extinção de unidade",
  "mudança de competência", "alterar artigo do regimento", "minuta de
  portaria de alteração do RI". Acione também quando o usuário perguntar se
  uma mudança organizacional exige atualização do RI.
---

# cgov-regimento-interno — Coordenação da Atualização do Regimento Interno (CGOV/ICMBio)

Esta skill apoia a CGOV/ICMBio no cumprimento do **Art. 37, IV** da Portaria
ICMBio nº 5.592/2025 — coordenar as atividades de atualização do Regimento
Interno — assegurando que qualquer alteração seja tecnicamente fundamentada,
legisticamente correta e previamente validada pela PFE/ICMBio.

---

## BASE NORMATIVA DE REFERÊNCIA

| Norma | Objeto | Papel nesta skill |
|---|---|---|
| Decreto nº 12.258, de 25/11/2024 | Estrutura Regimental e QCF do ICMBio | Norma superior que o RI operacionaliza; alterações no RI não podem contrariar o Decreto |
| Portaria ICMBio nº 5.592, de 11/12/2025 | Regimento Interno vigente do ICMBio | Objeto de análise e atualização |
| Decreto nº 12.002, de 22/04/2024 | Normas para elaboração, redação e alteração de atos normativos | Técnica legislativa obrigatória para a minuta |
| Lei Complementar nº 95, de 26/02/1998 | Elaboração, redação, alteração e consolidação de leis | Referência de legística (aplicável por analogia a atos infralegais) |
| Portaria ICMBio nº 271, de 2013 (Anexo II) | Quesitos para submissão à PFE | Checklist de análise jurídica prévia |

> ⚠️ **Hierarquia rígida:** o Regimento Interno está subordinado ao Decreto de
> Estrutura Regimental. Nenhuma alteração no RI pode criar competências,
> unidades ou cargos que o Decreto não prevê. Se o usuário propuser algo que
> ultrapasse o Decreto, sinalize imediatamente como inviável sem a prévia
> alteração do Decreto por Ato do Executivo.

---

## FASE 1 — DIAGNÓSTICO DO GATILHO E ESCOPO DA ALTERAÇÃO

Antes de qualquer redação, identificar:

### 1.1 Qual é o gatilho?

| Gatilho | Tipo de alteração no RI | Prioridade |
|---|---|---|
| Novo Decreto de Estrutura Regimental | Revisão geral (novo RI ou emenda substancial) | Alta — prazo normalmente definido pelo Decreto |
| Criação, extinção ou fusão de unidade organizacional | Alteração pontual de artigos afetados | Alta |
| Reclassificação ou redistribuição de competências entre unidades | Alteração dos artigos de competência das unidades envolvidas | Média |
| Correção de erro material, omissão ou inconsistência interna | Errata ou portaria de retificação | Variável |
| Decisão de Comitê ou Diretoria Colegiada | Depende do objeto — verificar se exige alteração formal ou apenas normativo complementar | Variável |

### 1.2 Quais artigos e unidades são afetados?

Para cada gatilho identificado:
- Listar os **artigos do RI vigente** (Portaria ICMBio nº 5.592/2025) que
  precisam ser alterados, criados ou revogados.
- Identificar as **unidades impactadas** (tanto as que perdem quanto as que
  ganham competências).
- Verificar se a alteração exige atualização simultânea do **Quadro de Cargos
  e Funções Comissionadas** (QCF) — se sim, acionar também o processo de
  atualização do QCF (Art. 37, V).

> Se o escopo não estiver claro, aplique `cgov-auditoria-competencias` antes
> de prosseguir — ela mapeia sobreposições e lacunas que podem ser resolvidas
> na mesma rodada de atualização.

---

## FASE 2 — ARTICULAÇÃO INTERUNIDADES

A atualização do RI é uma competência de **coordenação**, não de elaboração
unilateral. Orientar o processo de consulta:

### 2.1 Mapeamento de interessados

- **Unidades com competências alteradas:** consulta obrigatória para validar
  se a nova redação reflete com precisão o que fazem.
- **CGGE (supervisora da CGOV):** validação prévia antes de submissão formal.
- **Diretoria Colegiada / Presidência:** aprovação final (ou delegação
  expressa para o nível de Portaria).
- **PFE/ICMBio:** análise jurídica da minuta antes da publicação.

### 2.2 Instrumento de coleta de contribuições

Sugerir ao usuário a elaboração de:
1. **Ofício Circular** às unidades impactadas, com prazo de resposta,
   contendo: objeto da revisão, artigos afetados, perguntas específicas
   sobre precisão da redação proposta.
2. **Planilha ou quadro comparativo** (Redação Atual × Proposta × Justificativa)
   para consolidar as contribuições — use `cgov-comparar-versoes` para
   sistematizar as posições divergentes.

---

## FASE 3 — REDAÇÃO DA MINUTA DE ALTERAÇÃO

### 3.1 Escolha do instrumento normativo

| Situação | Instrumento adequado |
|---|---|
| Alteração de até ~5 artigos, sem mudança estrutural | Portaria de Alteração Pontual |
| Revisão geral (> 30% do RI alterado ou novo Decreto como gatilho) | Nova Portaria revogando a anterior integralmente |
| Correção de erro material evidente | Errata no DOU (verificar com PFE se cabe ou se exige portaria) |

### 3.2 Estrutura da Portaria de Alteração Pontual

Seguir o Decreto nº 12.002/2024:

```
PORTARIA ICMBio Nº [X], DE [DATA].

[EMENTA: Altera dispositivos da Portaria ICMBio nº 5.592, de 11 de dezembro
de 2025, que aprova o Regimento Interno do Instituto Chico Mendes de
Conservação da Biodiversidade.]

O PRESIDENTE DO INSTITUTO CHICO MENDES DE CONSERVAÇÃO DA BIODIVERSIDADE,
no uso das atribuições que lhe conferem [dispositivo habilitador],

RESOLVE:

Art. 1º O art. [X] da Portaria ICMBio nº 5.592, de 11 de dezembro de 2025,
passa a vigorar com a seguinte redação:

"Art. [X]. [Nova redação completa do artigo — nunca apenas o trecho alterado]"

Art. 2º [Demais alterações, na ordem numérica dos artigos do RI]

Art. [último]. Esta Portaria entra em vigor na data de sua publicação.
```

> **Regras técnicas obrigatórias (Decreto nº 12.002/2024):**
> - Cada artigo alterado deve ser transcrito **na íntegra** na portaria de
>   alteração — nunca "fica acrescido de" sem reproduzir o artigo completo.
> - Não usar "deverá" (futuro simples prescritivo) — usar presente do
>   indicativo ("compete", "cabe", "é responsável por").
> - Ementa deve identificar a norma alterada com número e data completos.
> - Competências devem ser descritas com verbos no infinitivo na ementa e
>   no presente do indicativo no corpo do artigo.

### 3.3 Verificação de legística

Após redigir a minuta, aplicar `cgov-saneamento-legistica` para varredura
completa antes de submeter à consulta interunidades e à PFE.

---

## FASE 4 — ANÁLISE DE COMPETÊNCIAS DA MINUTA

Antes da submissão à PFE, aplicar `cgov-auditoria-competencias` à minuta
consolidada para verificar:

- Há verbos duplicados entre unidades diferentes no novo texto?
- Alguma competência do Decreto nº 12.258/2024 ficou sem unidade responsável?
- A nova distribuição cria alguma lacuna ou sobreposição não intencional?
- As competências de supervisão/coordenação estão coerentes com a hierarquia
  definida no organograma do RI?

Registrar os achados como **Quadro de Consistência Regimental** — insumo
obrigatório para a Nota Técnica de encaminhamento à PFE.

---

## FASE 5 — SUBMISSÃO À PFE E PUBLICAÇÃO

### 5.1 Nota Técnica de encaminhamento

A alteração do RI exige NT da CGOV com análise para a PFE. Usar a suíte
`cgov-nt-01` a `cgov-nt-07`, com atenção especial à `cgov-nt-06-quesitos-pfe`
(Portaria ICMBio nº 271/2013, Anexo II).

Quesitos críticos para alteração de RI:
- **Competência normativa:** verificar se a Presidência tem delegação ou se
  exige ato do Ministério/Decreto.
- **Adequação hierárquica:** confirmar que a Portaria não ultrapassa o Decreto
  de Estrutura Regimental.
- **Impacto sobre outras normas:** listar portarias, instruções normativas e
  regulamentos que referenciam os artigos alterados e podem precisar de
  atualização em cascata.

### 5.2 Após publicação no DOU

- Atualizar os sistemas e repositórios internos com a nova versão do RI.
- Comunicar formalmente às unidades afetadas a entrada em vigor.
- Registrar a alteração no `docs/governance/decision-log.md` do projeto com data,
  número da portaria publicada e síntese das mudanças.

---

## ORIENTAÇÕES SOBRE REVISÃO GERAL (NOVO RI)

Quando o gatilho for um novo Decreto de Estrutura Regimental:

1. Fazer leitura comparativa entre o Decreto novo e o RI vigente —
   use `cgov-comparar-versoes` para sistematizar as divergências.
2. Priorizar a reorganização das competências por unidade antes da redação.
3. Considerar a oportunidade de consolidar alterações pontuais acumuladas
   (se houver portarias de alteração anteriores em vigor).
4. Prazo típico: o Decreto costuma fixar prazo para publicação do novo RI
   — registrar e monitorar no Plano de Entregas da CGOV.

---

## REGRAS TRANSVERSAIS

- A CGOV **coordena** o processo de atualização do RI — não aprova
  unilateralmente. A decisão final é da Presidência/Diretoria Colegiada.
- Nunca propor alteração que crie competência não prevista no Decreto de
  Estrutura Regimental — isso exige instrumento superior.
- Qualquer alteração de competências com impacto em QCF (cargos e funções)
  deve ser coordenada simultaneamente com o processo de Art. 37, V.
- Saída sempre em Markdown; nunca gerar `.docx` diretamente.
