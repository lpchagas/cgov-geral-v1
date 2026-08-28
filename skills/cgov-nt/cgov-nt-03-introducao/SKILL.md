---
name: cgov-nt-03-introducao
description: >
  Terceira etapa da suíte canônica cgov-nt: redige o Capítulo 1 — Introdução —
  de QUALQUER Nota Técnica da CGOV/ICMBio (não apenas PGD ou PSPEADBio), com
  cabeçalho institucional, destinatário, interessado, referências normativas,
  contextualização, metodologia e escopo do documento. Use ao invocar
  /cgov-nt-03, "redigir a introdução da NT", "capítulo 1", "abrir a nota
  técnica", "cabeçalho da NT", ou qualquer pedido de redação da seção inicial
  de uma Nota Técnica da CGOV. Requer que `cgov-nt-01` (triagem) já tenha sido
  executada e que exista `NT_ESTADO.md` em
  `local/analyses/SEI_[processo]_[apelido]/`; se não existir, redirecione para
  cgov-nt-01 primeiro.
---

# cgov-nt-03 — Capítulo 1: Introdução

## PRÉ-EXECUÇÃO OBRIGATÓRIA

1. **Localização do `NT_ESTADO.md`:** o arquivo do processo em análise vive em
   `local/analyses/SEI_[processo]_[apelido]/NT_ESTADO.md` — não na raiz do
   projeto. Identifique a subpasta pelo processo SEI mencionado nesta
   conversa; se houver apenas um processo com triagem em andamento sob
   `local/analyses/`, use-o diretamente. Se houver mais de um e não for possível
   identificar o processo pelo contexto, pergunte ao usuário antes de
   prosseguir.
2. Leia `NT_ESTADO.md` (metadados, enquadramento regimental, normas de
   referência, e — se já executada — a síntese de `cgov-nt-02`).
3. Se `NT_ESTADO.md` não existir, interrompa e redirecione para `cgov-nt-01`.
4. Aplique o **Padrão de Redação CGOV** (comum a todas as skills 03-07 desta
   suíte — ver seção abaixo) antes de gerar qualquer texto.

## PADRÃO DE REDAÇÃO CGOV (aplica-se a cgov-nt-03 a cgov-nt-07)

- **Prosa da própria NT:** verbos no **presente do indicativo** (ex.: "consolida",
  "conclui-se que", "tem por objetivo") — confirmado pela leitura da NT real
  nº 20/2026/CGOV. **Não use futuro simples na prosa da Nota Técnica.**
- **Redação de dispositivo de ato normativo** (quando a NT propuser ou citar
  texto de artigo/inciso de portaria/IN que ainda entrará em vigor): aí sim,
  futuro simples do indicativo, por força do Decreto nº 12.002/2024 — essa
  regra é do texto normativo em si, não da prosa analítica da NT. Não confunda
  os dois registros.
- Remissões normativas sempre com número e data completos na primeira menção
  (ex.: "Decreto nº 12.002, de 22 de abril de 2024"); menções subsequentes podem
  ser abreviadas ("Decreto nº 12.002/2024").
- Cada capítulo é um cabeçalho `### Capítulo N — [Nome]` dentro da Seção 4
  (FUNDAMENTAÇÃO/ANÁLISE TÉCNICA/PARECER); as subseções usam numeração decimal
  **reiniciada por capítulo** (`#### N.1`, `#### N.2`...), nunca subordinada a
  "4.N.M". Este padrão foi validado por piloto contra NT real protocolada da
  CGOV — não use a variante "4.1/4.1.1".
- Prosa fluida nos parágrafos narrativos; tabelas apenas para dados comparativos
  ou consolidados — não liste em bullet points o que pode ser dito em prosa.
- **Nunca invente número de Lei, Decreto, Portaria, artigo ou inciso.** Se não
  houver certeza, cite a norma de forma geral e sinalize com ⚠️ a necessidade de
  confirmação pelo servidor responsável.
- Não gerar arquivo `.docx` — entregar sempre em Markdown, diretamente no chat.

## FORMATO DE SAÍDA

> **Padrão de numeração (validado por piloto contra NT real nº 20/2026/CGOV):**
> cada capítulo é um cabeçalho `### Capítulo N — [Nome]` autônomo, e suas
> subseções usam numeração **reiniciada por capítulo** (`#### N.1`, `#### N.2`),
> não subordinada a "4.N.M". Este é o padrão efetivamente usado nas Notas
> Técnicas protocoladas da CGOV (confirmado em NT nº 20/2026/CGOV, Capítulos 1
> e 5), e substitui o padrão "4.1/4.1.1" que constava de versões anteriores
> desta skill.

```
Nota Técnica nº [N]/[ANO]/CGOV/CGGE/GABIN/ICMBio
Brasília-DF, [data]
Assunto: [assunto — extraído do NT_ESTADO.md]

---

## 1. DESTINATÁRIO
[unidade(s) — de NT_ESTADO.md]

## 2. INTERESSADO
[interessado(s) — de NT_ESTADO.md]

## 3. REFERÊNCIAS
- [normas identificadas na triagem, em ordem hierárquica: Lei > Decreto > Portaria > IN/Guia]

## 4. FUNDAMENTAÇÃO/ANÁLISE TÉCNICA/PARECER

### Capítulo 1 — Introdução

#### 1.1. Contextualização e objetivo
[2-3 parágrafos: natureza do objeto analisado, relevância institucional, e
fundamento da competência da CGOV para se manifestar, citando o inciso do
Art. 37 identificado em NT_ESTADO.md]

#### 1.2. Histórico e metodologia
[1-2 parágrafos: como surgiu a demanda, período/processo de coleta de dados
ou de análise normativa, universo considerado — apenas se aplicável ao caso;
omita o que não existir no processo concreto]

#### 1.3. Escopo do documento
[texto: estrutura das seções seguintes, ajustada ao roteiro definido em
NT_ESTADO.md — cite apenas os capítulos que de fato serão produzidos]
```

## REGRA ESPECIAL — DADOS FALTANTES

Se algum campo essencial (destinatário, referências, número da NT) não constar
de `NT_ESTADO.md`, não o preencha com um placeholder genérico silenciosamente:
liste as pendências ao final da resposta e pergunte objetivamente ao usuário.

## PÓS-EXECUÇÃO

Acrescente à seção "Capítulos já redigidos" do `NT_ESTADO.md` (na subpasta
localizada na Pré-execução) uma linha: `Cap. 1 — Introdução: concluído em
[data].` e marque o item correspondente do roteiro como concluído.

## ENCADEAMENTO

```
/cgov-nt-01 → [/cgov-nt-02, se aplicável] → /cgov-nt-03 (esta skill) → /cgov-nt-04
```
