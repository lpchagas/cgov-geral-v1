# Execução dos casos de eval remanescentes — suíte `cgov-nt`

**Data:** 28/08/2026
**Escopo:** 12 casos de borda que não foram exercitados no piloto inicial.
**Referência dos casos:** `skills/cgov-nt/*/evals/evals.json`.

## Método

Foi feita execução funcional manual dos prompts contra as instruções vigentes de
cada skill, com conferência item a item das expectativas declaradas no respectivo
`evals.json`. O piloto anterior já havia exercitado os casos nº 1 de
`cgov-nt-01`, `cgov-nt-02` e `cgov-nt-03`; esta rodada cobre todos os demais.
Embora registros anteriores mencionem 16 casos totais e 13 remanescentes, os sete
arquivos `evals.json` vigentes contêm **15** casos; portanto, havia **12** casos
remanescentes nesta rodada.
Não foram usados dados pessoais nem criados produtos processuais.

## Resultado

| Skill | Caso | Cenário verificado | Resultado | Evidência de conformidade |
|---|---:|---|---|---|
| `cgov-nt-01` | 2 | Comitê de sustentabilidade com possível sobreposição de competências | ✅ Aprovado | Classifica como Tipo C, dispensa dados brutos e encaminha previamente à `cgov-auditoria-competencias`. |
| `cgov-nt-01` | 3 | Cálculo de folha de pagamento | ✅ Aprovado | Aplica a regra de demanda fora do escopo, sem enquadramento artificial no art. 37, e propõe reencaminhamento. |
| `cgov-nt-02` | 2 | Minuta normativa sem dados brutos | ✅ Aprovado | Não tabula a minuta; encaminha para `cgov-comparar-versoes`, `cgov-modelar-fluxo` e/ou `cgov-auditoria-competencias`. |
| `cgov-nt-03` | 2 | Número da NT e destinatário ausentes | ✅ Aprovado | Explicita os dois campos ausentes e pede confirmação, sem inventar dados. |
| `cgov-nt-04` | 1 | Achados quantitativos de consulta | ✅ Aprovado | Exige números existentes no `NT_ESTADO.md`, priorização consistente e não força Mermaid. |
| `cgov-nt-04` | 2 | Competências sobrepostas e fluxo de quatro etapas | ✅ Aprovado | Seleciona Matriz RACI e diagrama Mermaid, com introdução, leitura crítica e consolidação dos dois eixos. |
| `cgov-nt-05` | 1 | Três achados com prioridades distintas | ✅ Aprovado | Vincula cada recomendação a achado numerado e preserva as prioridades do Capítulo 3. |
| `cgov-nt-05` | 2 | Achado urgente sem causa raiz conhecida | ✅ Aprovado | Usa “Necessidade de estudo complementar”, sem inventar causa ou solução definitiva. |
| `cgov-nt-06` | 1 | Tipo B que subsidia revisão de IN perante a PFE | ✅ Aprovado | A necessidade depende do destino do produto; responde aos oito quesitos, inclusive 2, 3, 5 e 6. |
| `cgov-nt-06` | 2 | Destino à PFE ambíguo | ✅ Aprovado | Interrompe para confirmação objetiva antes de redigir os quesitos. |
| `cgov-nt-07` | 1 | Oito achados, com distribuição 3/4/1 | ✅ Aprovado | Exige síntese com contagens exatas, proposição em `(i)`, encaminhamentos com destinatário em negrito e assinaturas sem SIAPE. |
| `cgov-nt-07` | 2 | Capítulo 4 obrigatório pendente | ✅ Aprovado | Bloqueia a conclusão e lista `cgov-nt-05` como pré-requisito não concluído. |

**Resultado agregado:** 12 de 12 casos aprovados.

## Correção preventiva identificada na rodada

Embora os dois casos de `cgov-nt-04` tenham sido aprovados, a instrução de
pré-execução ainda dizia “verbo no futuro simples”. Isso contrariava o padrão
canônico da suíte, que exige presente do indicativo na prosa da Nota Técnica.
A redação foi corrigida para “prosa no presente do indicativo” em
`skills/cgov-nt/cgov-nt-04-diagnostico/SKILL.md`.

## Conclusão

A pendência de execução dos casos remanescentes está encerrada. A suíte mantém
cobertura para os casos de borda de escopo, ausência de dados, pré-requisito
incompleto, insuficiência causal, destino ambíguo à PFE e escolha condicionada de
elementos visuais.
