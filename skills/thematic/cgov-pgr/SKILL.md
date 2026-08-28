---
name: cgov-pgr
description: >
  IMPORTANTE: aqui PGR = Programa de Gestão para Resultados e Inovação do
  ICMBio (Portaria ICMBio nº 1.572/2023). NÃO é a PGRI — Política de Gestão de
  Riscos e Integridade, Portaria ICMBio nº 255/2020 (use cgov-gestao-riscos) —
  nem o PGD de teletrabalho (use cgge-especialista-pgd). Suporte à
  implementação, ao funcionamento e ao monitoramento do PGR (Art. 37, parágrafo
  único, VIII, da Portaria ICMBio nº 5.592/2025): eixos de Capacitação,
  Consultoria Interna e Laboratório de Inovação; ações transversais de Gestão
  do Programa e Rede de Multiplicadores; papéis de consultor interno,
  multiplicador, ponto focal e Liderança do Programa; seleção de iniciativas;
  e Relatório Anual de Resultados. Use ao invocar /cgov-pgr, PGR, "Programa de
  Gestão para Resultados", "Portaria 1.572", "gestão para resultados",
  "consultoria interna", "consultor interno PGR", "multiplicador PGR",
  "laboratório de inovação", "rede de multiplicadores", "inovação
  institucional", "relatório de resultados do PGR", "iniciativa PGR".
instalado_em: 2026-08-04
status: instalada na conta Claude (Customize -> Skills)
revisao: >
  04/08/2026 — reescrita a partir do texto integral da Portaria nº 1.572/2023,
  agora disponível no projeto. A versão anterior descrevia dois eixos ("Gestão
  por Resultados" e "Inovação Institucional") e um arcabouço de indicadores,
  metas e painel que não constam da norma.
---

# cgov-pgr — Programa de Gestão para Resultados e Inovação (CGOV/ICMBio)

Esta skill apoia a CGOV/ICMBio no cumprimento do **Art. 37, parágrafo único,
inciso VIII**, da Portaria ICMBio nº 5.592, de 11 de dezembro de 2025 —
coordenar a implementação do **Programa de Gestão para Resultados e Inovação
(PGR)**, instituído pela **Portaria ICMBio nº 1.572, de 29 de maio de 2023**.

---

## DISTINÇÃO ESSENCIAL: PGR × PGRI × PGD

Antes de qualquer análise, confirme o contexto da demanda:

| Instrumento | Sigla | Norma principal | Foco | Competência |
|---|---|---|---|---|
| **Programa de Gestão para Resultados e Inovação** | **PGR** | Portaria ICMBio nº 1.572/2023 | Cultura de gestão para resultados e inovação | **CGOV (Art. 37, VIII)** |
| **Política de Gestão de Riscos e Integridade** | **PGRI** | Portaria ICMBio nº 255/2020 (metodologia: nº 975/2021) | Riscos institucionais e integridade | CGOV + CTGRIC (Art. 37, IX) |
| Programa de Gestão e Desempenho | PGD | IN MGI nº 24/2023; IN ICMBio nº 14/2025 | Teletrabalho e planos de trabalho individuais | CGGP + CGOV (Art. 37, VII) |
| Política de Gestão Estratégica | PGE | Portaria ICMBio nº 768/2020 | Planejamento e avaliação da estratégia (RAE) | — |

> Teletrabalho ou planos individuais (**PGD**) → `cgge-especialista-pgd` ou
> `cgov-elaborar-entrega`. Gestão de riscos (**PGRI**) → `cgov-gestao-riscos`.
> Esta skill trata exclusivamente do **PGR**.
>
> ⚠️ **Nunca escreva "PGR de riscos" nem "Plano de Gestão de Riscos — PGR".** A
> sigla PGR pertence exclusivamente ao Programa de Gestão para Resultados; o
> instrumento de riscos é a **PGRI**. Se o usuário usar PGR querendo dizer
> riscos, corrija-o de forma breve e redirecione para `cgov-gestao-riscos`.

---

## BASE NORMATIVA

| Documento | Objeto | Status |
|---|---|---|
| **Portaria ICMBio nº 1.572, de 29/05/2023** | Institui o PGR | ✅ **Fonte primária** — texto integral local em `local/normative-sources/20230529_Portaria ICMBio 1572-2023_Institui o PGR.md` |
| Portaria ICMBio nº 5.592/2025, Art. 37, § único, VIII | Competência da CGOV sobre o PGR | ✅ verificado |
| Decreto nº 10.382/2020 | Programa de Gestão Estratégica e Transformação do Estado | Considerando da Portaria nº 1.572/2023 |
| Portaria ICMBio nº 99, de 07/02/2020 | Regras do trabalho consultivo (Art. 25) | ⚠️ não consta do projeto |
| Portaria ICMBio nº 768/2020 (PGE) e nº 1.164/2025 (PE 2025-2027) | Planejamento e avaliação da estratégia | 🔒 PE com PDF ilegível — não citar objetivo ou indicador |

> **Revogações expressas (Art. 27):** a Portaria nº 1.572/2023 revogou as
> Portarias ICMBio **nº 38/2021** e **nº 531/2021**. Não as cite como vigentes.
>
> ⚠️ **Nomenclatura de unidade.** Os arts. 3º, 12, 21 e 23 da Portaria
> nº 1.572/2023 atribuem a orientação do Programa à "Coordenação de Governança e
> Gestão Estratégica – **CGOV/GABIN**". Essa é a estrutura de 2023. Sob o
> Regimento Interno vigente (Portaria nº 5.592/2025), a CGOV atua **sob
> supervisão da CGGE**. Ao citar a norma, transcreva o original e registre a
> mudança de estrutura em nota.

---

## O QUE A NORMA ESTABELECE — E O QUE ELA NÃO ESTABELECE

> ⚠️ **Leia antes de responder sobre indicadores ou metas.** A Portaria
> nº 1.572/2023 **não institui** painel de indicadores institucionais, ficha de
> indicador, metas anuais pactuadas nem limiares de alerta. Ela estrutura um
> **programa de disseminação de cultura** — capacitação, consultoria interna e
> laboratório de inovação — cujo único instrumento de prestação de contas
> previsto é o **Relatório Anual de Resultados** (Art. 26).
>
> Se o usuário pedir indicadores e metas institucionais, esclareça a distinção e
> redirecione: esse arcabouço pertence ao **Planejamento Estratégico / PGE**
> (Portarias nº 768/2020 e nº 1.164/2025), não ao PGR. Você pode ajudar a
> construir indicadores **para as iniciativas do PGR**, mas não os apresente
> como exigência da Portaria nº 1.572/2023.

### Objetivo (Art. 4º)

Disseminar a cultura de gestão para resultados e inovação no ICMBio.

### Diretrizes (Art. 5º, I a IX)

Modelo de excelência em gestão pública · aproveitamento das competências dos
servidores desenvolvidas pela política institucional de desenvolvimento de
pessoas · otimização da alocação de recursos financeiros, humanos e
tecnológicos, com economicidade · melhoria contínua na prestação de serviços à
sociedade · melhoria contínua na efetividade da conservação da biodiversidade ·
incentivo à inovação · integração dos instrumentos de planejamento e
monitoramento já existentes · composição multidisciplinar do corpo de
consultores internos · abordagem ecossistêmica na gestão de unidades de
conservação.

### Eixos de atuação (Art. 6º) e ações transversais (Art. 7º)

| | Componente | Base |
|---|---|---|
| **Eixo I** | **Capacitação** | Arts. 8º a 10 |
| **Eixo II** | **Consultoria interna** | Arts. 11 a 14 |
| **Eixo III** | **Laboratório de Inovação** | Arts. 15 a 18 |
| Transversal I | **Gestão do Programa** | Arts. 22 a 25 |
| Transversal II | **Articulação da Rede de Multiplicadores PGR** | Arts. 19 a 21 |

---

## OS TRÊS EIXOS

### Eixo I — Capacitação (Arts. 8º a 10)

- **Propósito:** desenvolver, no corpo funcional do ICMBio, as competências
  necessárias à promoção de mudanças (Art. 8º).
- **Prioridades** de público-alvo e objetivos de aprendizagem são indicadas pela
  **Liderança do Programa** e validadas pela CGOV (Art. 9º).
- As capacitações observam a política de desenvolvimento de pessoas do ICMBio
  (Art. 10).
- O **Ciclo de Formação em Gestão para Resultados** é a porta de entrada: dele
  saem os **Consultores internos PGR** e os **Multiplicadores PGR**.

### Eixo II — Consultoria interna (Arts. 11 a 14)

- A atuação consultiva se dá mediante **elaboração e execução de iniciativas**
  (Art. 11).
- A **CGOV coordena o processo de seleção** das iniciativas a serem executadas
  pela equipe de consultores internos, indicando forma de seleção, critérios e
  quantidade (Art. 12).
- Os consultores internos são **designados em Portaria específica** (Art. 13).
- **Toda iniciativa consultiva é vinculada a um Projeto específico** (Art. 14).
- O trabalho consultivo observa a Portaria ICMBio nº 99/2020 e **não gera
  gratificações nem adicionais**, nos termos da Lei nº 8.112/1990 (Art. 25).

### Eixo III — Laboratório de Inovação (Arts. 15 a 18)

- **Propósito:** fomentar a cultura de inovação e facilitar o desenvolvimento de
  soluções (Art. 15).
- Atua por **Projetos específicos**, que sempre visam entregar soluções
  inovadoras (Art. 16).
- É organizado e coordenado por servidor reconhecido como **Consultor interno
  PGR ou Multiplicador PGR** (Art. 17).
- Cada projeto tem um **ponto focal**, com atribuições próprias (Art. 18).

---

## AÇÕES TRANSVERSAIS

### Rede de Multiplicadores PGR (Arts. 19 a 21)

- **Objetivo:** compartilhar conhecimento, experiências, inovações e boas
  práticas (Art. 19).
- **Composição:** servidores aprovados nos ciclos de formação em gestão para
  resultados (Art. 20).
- **Propósito dos multiplicadores:** difundir a cultura de gestão para
  resultados em suas unidades organizacionais (Art. 21).
- **Sem vínculo hierárquico** com a CGOV ou com a Liderança do Programa; a
  atuação não constitui ação de comando (Art. 21, § 1º).
- A **Comunidade de Prática** é o grupo de membros da rede que compartilham
  interesse comum e desejo de aprender (Art. 2º, XIV).

### Gestão do Programa — Liderança (Arts. 22 a 25)

- O PGR é gerenciado por uma **Liderança do Programa**, escolhida **pelos e
  entre os consultores internos PGR** com regime de dedicação integral
  (Art. 22).
- Mandato de **um ano**, com recondução possível (Art. 22, § 1º); as atribuições
  constam do Plano de Trabalho do servidor designado (§ 2º).
- **Atribuições (Art. 23):**
  1. interlocução centralizada com a CGOV sobre desenvolvimento e resultados dos
     eixos;
  2. composição e indicação de consultores internos para os eixos e ações
     transversais;
  3. supervisão do desempenho da equipe de consultores;
  4. animação e mobilização da Rede de Multiplicadores, podendo contar com
     pontos focais;
  5. elaboração do **Relatório Anual de Resultados do PGR**.
- **Decisão participativa** entre a Liderança e a equipe de consultores,
  observadas as prioridades e diretrizes da CGOV (Art. 24). A equipe pode
  elaborar Regimento Interno próprio de funcionamento (parágrafo único).

---

## GLOSSÁRIO OFICIAL (Art. 2º)

Use estes termos com o sentido da norma — não os substitua por equivalentes de
mercado:

| Termo | Sentido na Portaria nº 1.572/2023 |
|---|---|
| **Gestão para resultados** | Modelo de gestão em que o resultado é a referência-chave de todo o processo de gestão, vinculando dirigentes ao resultado obtido |
| **Excelência em Gestão Pública** | Conjunto de conceitos e práticas gerenciais para conduzir organizações públicas a elevados padrões, tangíveis e mensuráveis, de desempenho e qualidade |
| **Cultura organizacional** | Sistema de valores, crenças e pressuposições, formais ou não, compartilhados pelos membros da organização |
| **Consultor interno PGR** | Servidor aprovado no Ciclo de Formação que atua em atividade consultiva, mediante designação e plano de trabalho no âmbito do PGD |
| **Multiplicador PGR** | Servidor aprovado no Ciclo de Formação que aplica e compartilha as competências adquiridas no exercício profissional |
| **Gestão da Mudança** | Planejamento, aplicação, medição e monitoramento de ações de gestão do fator humano em projeto de mudança |
| **Projeto** | Esforço temporário, com início e fim programados e recursos delimitados, para criar produto, serviço ou resultado únicos |
| **Gerente de projeto** | Servidor designado para liderar a equipe, responsável por planejamento, implementação e alcance dos objetivos |
| **Gestão por processos** | Metodologias, técnicas e ferramentas para entender, analisar, projetar, monitorar e aprimorar continuamente os processos organizacionais |
| **Inovação** | Criação e implementação de novos processos, produtos, serviços, competências e métodos de entrega com melhorias significativas |
| **Laboratório de inovação** | Ambiente colaborativo de criatividade, experimentação e inovação, com metodologias ativas e cocriação |
| **Comunidade de Prática** | Grupo de multiplicadores que compartilham interesse comum e desejo de aprender |

---

## ROTEIROS DE TRABALHO

### A — Diagnóstico do ciclo vigente

Pergunte apenas o que não estiver claro:

1. Há **Liderança do Programa** designada e vigente (mandato de um ano)?
2. Há **Portaria específica** de designação dos consultores internos em vigor
   (Art. 13)?
3. Qual o **Relatório Anual de Resultados** mais recente (Art. 26)?
4. Quais **iniciativas** estão em execução e a que Projetos se vinculam
   (Art. 14)?
5. Qual o estágio de cada eixo — Capacitação, Consultoria interna, Laboratório
   de Inovação?

### B — Seleção de iniciativas (Art. 12)

A CGOV coordena o processo. Estruture com o usuário:

| Elemento | Conteúdo |
|---|---|
| Forma de seleção | Chamada interna, indicação, demanda da alta gestão |
| Critérios | Aderência às diretrizes do Art. 5º; potencial de resultado; viabilidade com a equipe disponível |
| Quantidade | Número de iniciativas por ciclo, compatível com a capacidade dos consultores |
| Vinculação | Projeto específico ao qual a iniciativa se vincula (Art. 14) |
| Gerente de projeto | Servidor designado (Art. 2º, VIII) |

### C — Projeto do Laboratório de Inovação

| Etapa | Conteúdo |
|---|---|
| Problema | O que se quer melhorar, em uma frase |
| Solução proposta | Hipótese e por quê |
| Escopo | Unidade(s), prazo, recursos |
| Ponto focal | Servidor designado e suas atribuições (Art. 18) |
| Coordenação | Consultor interno ou Multiplicador PGR (Art. 17) |
| Critério de sucesso | Como se saberá que funcionou |
| Critério de encerramento | Em que ponto se decide parar |
| Difusão | Como o aprendizado chega à Rede de Multiplicadores |

### D — Relatório Anual de Resultados (Art. 26)

Elaborado pela Liderança do Programa (Art. 23, V) e disponibilizado para
consulta em meio eletrônico. Estrutura sugerida — a norma não prescreve formato:

1. **Síntese do ciclo** — o que foi realizado nos três eixos.
2. **Capacitação** — ciclos de formação realizados, público alcançado, novos
   consultores e multiplicadores formados.
3. **Consultoria interna** — iniciativas selecionadas, executadas e concluídas;
   projetos vinculados; resultados por iniciativa.
4. **Laboratório de Inovação** — projetos, soluções entregues, aprendizados.
5. **Rede de Multiplicadores** — evolução da rede, atividades de animação,
   Comunidades de Prática ativas.
6. **Gestão do Programa** — composição da equipe, decisões relevantes.
7. **Recomendações** para o ciclo seguinte.

> Ao propor esta estrutura, deixe explícito que ela é **sugestão**, não
> exigência normativa — o Art. 26 apenas determina que o relatório exista e
> fique disponível eletronicamente.

---

## REGRAS TRANSVERSAIS

- **Não invente arquitetura.** A norma tem três eixos (Capacitação, Consultoria
  interna, Laboratório de Inovação) e duas ações transversais. Não crie eixos,
  painéis, ficha de indicador ou limiar de alerta e os atribua à Portaria
  nº 1.572/2023.
- **PGR ≠ PGRI ≠ PGD ≠ PGE.** Mantenha a distinção em todo texto produzido.
- A CGOV **coordena e orienta** o Programa; a gestão é da Liderança do Programa,
  com decisão participativa. A CGOV não executa iniciativas nem designa
  consultores por conta própria — a designação é por Portaria específica.
- Consultoria interna **não gera gratificação nem adicional** (Art. 25) — nunca
  sugira contrapartida remuneratória.
- Toda iniciativa consultiva vincula-se a um Projeto (Art. 14). Se o usuário
  propuser iniciativa solta, sinalize.
- Ao citar a norma, use a nomenclatura original ("CGOV/GABIN") e registre em
  nota a estrutura vigente sob a Portaria nº 5.592/2025.
- Não cite as Portarias nº 38/2021 e nº 531/2021 como vigentes — foram revogadas
  pelo Art. 27.
- Saída sempre em Markdown; nunca gerar `.docx` diretamente.
