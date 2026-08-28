---
name: cgov-nt-05-propostas
description: >
  Quinta etapa (opcional, conforme triagem) da suíte canônica cgov-nt: redige
  o Capítulo 4 — Propostas de Ajuste e Recomendações — de QUALQUER Nota Técnica
  da CGOV/ICMBio, a partir do Quadro Consolidado de Achados produzido por
  cgov-nt-04. Gera recomendações numeradas com fundamento normativo, redação
  saneada (quando aplicável) e quadro de prioridades. Use ao invocar
  /cgov-nt-05, "propostas de ajuste", "capítulo 4", "recomendações da NT",
  "redação saneada", "matriz de consolidação das propostas". Se a NT for
  puramente descritiva/de status e não comportar recomendações (ver
  NT_ESTADO.md, Tipo D), esta skill pode ser dispensada — confirme com o
  usuário antes de pular a etapa.
---

# cgov-nt-05 — Capítulo 4: Propostas de Ajuste e Recomendações

## PRÉ-EXECUÇÃO OBRIGATÓRIA

1. **Localização do `NT_ESTADO.md`:** o arquivo do processo em análise vive em
   `local/analyses/SEI_[processo]_[apelido]/NT_ESTADO.md` — não na raiz do
   projeto. Identifique a subpasta pelo processo SEI mencionado nesta
   conversa; se houver apenas um processo com triagem em andamento sob
   `local/analyses/`, use-o diretamente. Se houver mais de um e não for possível
   identificar o processo pelo contexto, pergunte ao usuário antes de
   prosseguir.
2. Leia `NT_ESTADO.md`, em especial o Quadro Consolidado de Achados (Capítulo 3,
   produzido por `cgov-nt-04`).
3. **Pré-requisito de conteúdo:** cada recomendação desta skill deve derivar de
   um achado numerado do Capítulo 3. Não introduza recomendações "novas" sem
   lastro em achado registrado — se identificar uma questão relevante não
   capturada antes, retorne a `cgov-nt-04` para registrá-la como achado primeiro.
4. Aplique o Padrão de Redação CGOV (`cgov-nt-03`).

## FASE 1 — CLASSIFICAÇÃO DO TIPO DE RECOMENDAÇÃO

Para cada achado do Capítulo 3, identifique o tipo de recomendação cabível —
isso determina o formato da proposta na Fase 2:

- **Correção normativa/legística:** aplica-se quando o achado é um problema de
  redação, remissão ou técnica legislativa em minuta de ato normativo → use o
  formato "Redação Atual × Problema × Proposta Saneada", fundamentado no
  Decreto nº 12.002/2024 e na LC nº 95/1998.
- **Ajuste organizacional/de competências:** aplica-se a sobreposições ou
  lacunas de responsabilidade → proponha redistribuição de atribuições ou
  matriz RACI corrigida.
- **Ação de gestão/processo:** aplica-se a achados quantitativos/qualitativos
  de consultas internas ou de gestão de riscos → proponha ação de mitigação,
  ajuste procedimental ou encaminhamento de estudo complementar.
- **Recomendação de governança institucional:** aplica-se a temas de arranjo
  organizacional, comitês ou alinhamento estratégico → proponha diretriz ou
  condicionante para a instituição da proposta analisada.

## FASE 2 — REDAÇÃO

> Numeração reiniciada por capítulo (`#### 4.1`, `#### 4.2`...), conforme
> padrão validado por piloto contra NT real da CGOV — ver `cgov-nt-03`. A
> análise para a PFE (`cgov-nt-06`), quando necessária, é publicada como
> subitem deste mesmo Capítulo 4 (ex.: item 4.4) na prática observada da CGOV,
> não como um capítulo numerado à parte — ajuste a numeração conforme o
> número final de subitens deste capítulo.

```
### Capítulo 4 — Propostas de Ajustes e Recomendações

#### 4.1. Diretrizes gerais das propostas
[parágrafo: base metodológica das propostas e sua relação com o Capítulo 3]

#### 4.2. Recomendações

**Recomendação nº 1 — [Título] (achado nº [X] do Quadro Consolidado)**

[texto analítico: problema e justificativa técnica]

[Se correção normativa:]
| Redação Atual | Problema Identificado | Proposta Saneada |
|---|---|---|
| "..." | ... | "..." |

**Fundamento normativo:** [norma e artigo — sem invenção]
**Risco institucional se não corrigido:** [consequência prática]

---
[repetir para cada recomendação numerada]
---

**Tabela — Matriz de Consolidação das Propostas**
| Item | Achado nº | Recomendação (síntese) |
|---|---|---|

**Quadro de Prioridades**
| Prioridade | Nº | Recomendação | Justificativa |
|---|---|---|---|
| URGENTE | | | |
| PRIORITÁRIO | | | |
| DESEJÁVEL | | | |
```

As prioridades devem ser **herdadas** das prioridades já atribuídas aos
achados correspondentes no Capítulo 3 (`cgov-nt-04`) — não reclassifique sem
justificar a divergência.

## REGRA ESPECIAL — RECOMENDAÇÃO SEM SOLUÇÃO CLARA

Se um achado urgente não tiver solução técnica evidente, não force uma
recomendação artificial. Registre-o como "Recomendação nº [N] — Necessidade de
estudo complementar" e explique o que precisa ser levantado antes de uma
proposta concreta.

## PÓS-EXECUÇÃO

Acrescente ao `NT_ESTADO.md` (na subpasta localizada na Pré-execução): `Cap. 4
— Propostas: concluído em [data]. N recomendações formuladas.`

## ENCADEAMENTO

```
/cgov-nt-04 → /cgov-nt-05 (esta skill, se aplicável) → /cgov-nt-06 (se aplicável) → /cgov-nt-07
```
