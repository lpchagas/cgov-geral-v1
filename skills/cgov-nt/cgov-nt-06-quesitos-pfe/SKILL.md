---
name: cgov-nt-06-quesitos-pfe
description: >
  Sexta etapa (condicional) da suíte canônica cgov-nt: redige a seção de
  Análise para a PFE-ICMBio de QUALQUER Nota Técnica que subsidie a edição,
  alteração ou revisão de ato administrativo do ICMBio — não apenas PGD ou
  PSPEADBio — respondendo, de forma fiel e completa, aos 8 quesitos do Anexo II
  da Portaria ICMBio nº 271/2013. Use ao invocar /cgov-nt-06, "análise para a
  PFE", "quesitos da Portaria 271", "subsidiar a PFE", "análise jurídica
  preliminar", "Anexo II". A necessidade desta etapa é definida em
  `NT_ESTADO.md` (em `local/analyses/SEI_[processo]_[apelido]/`) pela triagem
  (`cgov-nt-01`, Passo 3.1) com base no destino do produto (a NT seguirá para
  a PFE?), não pelo Tipo de dado (A/B/C/D). Para NTs que não subsidiam ato
  administrativo, esta skill deve ser dispensada.
---

# cgov-nt-06 — Análise para a PFE-ICMBio (Anexo II da Portaria nº 271/2013)

> **Nota de versão:** esta skill foi reescrita a partir da leitura do texto
> integral da Portaria ICMBio nº 271, de 27 de dezembro de 2013 (Anexo II),
> fornecido pelo usuário. A tabela de "8 quesitos" que constava de versões
> anteriores desta skill — herdada, sem verificação, de `cgov-pgd-sk7` e
> `cgov-pspeadbio-sk4` — **estava incompleta e parcialmente incorreta**: faltavam
> por completo os quesitos 2, 3, 5 e 6 do Anexo II, e a maior parte dos
> subitens de detalhamento. A tabela abaixo é a transcrição fiel do Anexo II.

## PRÉ-EXECUÇÃO OBRIGATÓRIA

1. **Localização do `NT_ESTADO.md`:** o arquivo do processo em análise vive em
   `local/analyses/SEI_[processo]_[apelido]/NT_ESTADO.md` — não na raiz do
   projeto. Identifique a subpasta pelo processo SEI mencionado nesta
   conversa; se houver apenas um processo com triagem em andamento sob
   `local/analyses/`, use-o diretamente. Se houver mais de um e não for possível
   identificar o processo pelo contexto, pergunte ao usuário antes de
   prosseguir.
2. Leia `NT_ESTADO.md` — confirme que a triagem (`cgov-nt-01`, Passo 3.1) marcou
   os quesitos PFE como necessários. Essa necessidade depende do destino final
   do produto (a NT subsidiará edição/alteração/revisão de ato administrativo?),
   não do Tipo de dado (A/B/C/D). Um caso Tipo B (ex.: consulta interna cujos
   dados embasam a revisão de uma Instrução Normativa) pode exigir esta skill
   tanto quanto um caso Tipo A. Se `NT_ESTADO.md` não deixar isso claro,
   pergunte ao usuário antes de prosseguir.
3. **Pré-requisito de conteúdo:** os capítulos de diagnóstico e propostas
   (`cgov-nt-04` e, se aplicável, `cgov-nt-05`) devem estar concluídos — os
   achados e recomendações alimentam diretamente as respostas aos quesitos 1,
   2, 7 e 8 abaixo.
4. Aplique o Padrão de Redação CGOV (`cgov-nt-03`): prosa no presente do
   indicativo, sem invenção de norma ou artigo.

## OS 8 QUESITOS DO ANEXO II (Portaria ICMBio nº 271/2013)

> A Portaria numera os quesitos de 1 a 8, mas o texto oficial publicado exibe
> os marcadores dos quesitos 4 a 8 como "10, 11, 12, 13, 14" — inconsistência
> de numeração do próprio documento original, identificável porque os
> subitens de detalhamento de cada quesito (ex.: "7.1, 7.2, 7.3" sob o quesito
> rotulado "13") retomam a numeração 4 a 8. Esta skill usa a numeração real
   dos subitens (1 a 8) como fonte da verdade, e não os marcadores "10-14" —
> **não replique o "10, 11, 12, 13, 14" em documentos oficiais**.

**Quesito 1 — Deve ser tomada alguma providência?**
| Subitem | Pergunta |
|---|---|
| 1.1 | O Instituto e a autoridade interessada dispõem de competência legal para a iniciativa? Há competência concorrente? A proposta está formulada adequadamente? |
| 1.2 | Qual o objetivo pretendido (orientar, controlar, aperfeiçoar, extinguir)? |
| 1.3 | Quais as razões que determinaram a iniciativa? |
| 1.4 | Que falhas ou distorções foram identificadas? |
| 1.5 | Que repercussões tem o problema? |
| 1.6 | Qual o número de atingidos pelo problema e o número de casos a resolver? |
| 1.7 | O que poderá acontecer se nada for feito (o problema se agrava, permanece estável, é superado)? |
| 1.8 | A proposta pode afetar situações consolidadas? Há ameaça à segurança jurídica? |

**Quesito 2 — Quais as alternativas disponíveis?**
| Subitem | Pergunta |
|---|---|
| 2.1 | Qual o resultado da análise do problema? Quais as causas e que ações podem eliminar ou diminuir seus efeitos? |
| 2.2 | Quais instrumentos de ação são adequados aos objetivos pretendidos, considerando: (a) desgaste e encargos para cidadãos/economia; (b) eficácia; (c) custos para o orçamento da autarquia; (d) efeitos sobre o ordenamento jurídico e metas estabelecidas; (e) efeitos colaterais; (f) aceitação pelos interessados e responsáveis pela execução; (g) possibilidade de impugnação judicial? |

**Quesito 3 — O ato corresponde às expectativas dos cidadãos/servidores e é inteligível para todos?**
| Subitem | Pergunta |
|---|---|
| 3.1 | O ato proposto será entendido e aceito pelos destinatários? |
| 3.2 | As limitações e restrições impostas são indispensáveis (proibições, comparecimento obrigatório, exigência de requerimento, dever de prestar informações, multas/penas, outras sanções)? |
| 3.3 | Podem as medidas restritivas ser substituídas por outras? |
| 3.4 | Os requisitos exigidos podem ser reduzidos a um mínimo aceitável? |
| 3.5 | Os destinatários da norma entendem o vocabulário, a organização, a extensão das frases e a lógica do texto? |

**Quesito 4 — Que tipo de ato e qual hierarquia deve ter a normatização?**
| Subitem | Pergunta |
|---|---|
| 4.1 | A matéria já não foi regulada em disposição de hierarquia superior? Há redundância a evitar? |
| 4.2 | Por que a matéria deve ser regulada por esta autoridade — caberia regulação por autoridade hierarquicamente inferior? |

**Quesito 5 — Deve a normatização ter prazo de vigência limitado?**
Norma temporária, submetida a período probatório, é o caso mais adequado?

**Quesito 6 — As normas preservam direito adquirido e demais garantias fundamentais? As exigências impostas são indispensáveis?**
Exemplos de exigência a escrutinar: proibições/necessidade de autorização;
comparecimento obrigatório; exigência de requerimento; dever de prestar
informações; imposição de multas e penas; outras sanções.

**Quesito 7 — O ato é exequível?**
| Subitem | Pergunta |
|---|---|
| 7.1 | As responsabilidades quanto à execução das medidas estão bem definidas? |
| 7.2 | Qual a opinião das autoridades incumbidas da execução quanto à clareza dos objetivos e à possibilidade de execução? |
| 7.3 | A regra foi submetida a testes de exequibilidade com as autoridades encarregadas de aplicá-la? Que conclusão se chegou? |

**Quesito 8 — Existe relação equilibrada entre custos e benefícios?**
| Subitem | Pergunta |
|---|---|
| 8.1 | Qual o ônus imposto aos atingidos pela norma? |
| 8.2 | Os atingidos podem suportar esses custos adicionais? |
| 8.3 | A medida impõe despesas adicionais ao orçamento da União/Estados/Municípios? Como enfrentá-las? |
| 8.4 | Foi feita análise de custo-benefício? A que conclusão se chegou? |
| 8.5 | Como serão avaliados a eficácia, o desgaste e os efeitos colaterais após a entrada em vigor? |

> **Fundamento adicional:** o Art. 7º, §2º, "b" do Anexo I da Portaria nº
> 271/2013 exige que a nota técnica contenha "histórico, fundamentação legal,
> análise e parecer com as justificativas da proposição" — estrutura que
> corresponde, na suíte cgov-nt, aos Capítulos 1 (`cgov-nt-03`), 2-3
> (`cgov-nt-04`) e 4 (`cgov-nt-05`), já produzidos antes desta skill.

## FORMATO DE SAÍDA

> Na prática observada da CGOV (validado por piloto contra NT real), esta
> análise é publicada como **subitem do Capítulo 4** (tipicamente item 4.4,
> após as recomendações de `cgov-nt-05`), não como capítulo autônomo. Ajuste o
> número do subitem à numeração final do Capítulo 4 no documento em elaboração.

```
#### 4.4. Questões a analisar na elaboração de atos administrativos, nos
termos do Anexo II da Portaria ICMBio nº 271/2013

[parágrafo de abertura: finalidade desta seção — subsidiar a PFE/ICMBio quanto
à conveniência, oportunidade, exequibilidade e custo-benefício da proposta,
com base nos diagnósticos dos capítulos anteriores]

**1. Deve ser tomada alguma providência?**
R: [Sim/Não] — [resposta corrida cobrindo os subitens 1.1 a 1.8 pertinentes ao
caso concreto; nem todo subitem exigirá desenvolvimento próprio em todo caso]

**2. Quais as alternativas disponíveis?**
R: [...]

**3. O ato corresponde às expectativas dos servidores/cidadãos e é inteligível para todos?**
R: [...]

**4. Que tipo de ato e qual hierarquia deve ter a normatização?**
R: [...]

**5. Deve a normatização ter prazo de vigência limitado?**
R: [...]

**6. As normas preservam direito adquirido e demais garantias fundamentais?**
R: [...]

**7. O ato é exequível?**
R: [...]

**8. Existe relação equilibrada entre custos e benefícios?**
R: [...]
```

**Regras de redação obrigatórias:**
- Cada um dos 8 quesitos recebe resposta assertiva (Sim/Não/Parcialmente),
  seguida de justificativa fundamentada — nunca deixe um quesito sem
  posicionamento.
- Os subitens (1.1 a 1.8, 2.1 a 2.2, etc.) orientam o conteúdo da resposta,
  mas não precisam necessariamente aparecer como sub-respostas destacadas no
  texto final — incorpore-os à prosa corrida da resposta ao quesito principal,
  salvo quando a complexidade do caso recomendar desenvolvimento próprio.
- Se um quesito (ou subitem) não puder ser respondido com segurança pelos
  elementos disponíveis, registre isso explicitamente como limitação, em vez
  de presumir uma resposta.
- Nunca invente artigo, número de norma ou dado quantitativo não constante de
  `NT_ESTADO.md`.

## PÓS-EXECUÇÃO

Acrescente ao `NT_ESTADO.md` (na subpasta localizada na Pré-execução):
`Quesitos PFE (Anexo II, Portaria nº 271/2013): concluídos em [data].`

## ENCADEAMENTO

```
/cgov-nt-04 → [/cgov-nt-05] → /cgov-nt-06 (esta skill, se aplicável) → /cgov-nt-07
```
