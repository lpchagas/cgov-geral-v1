---
name: cgov-gestao-riscos
description: >
  Suporte metodológico à gestão de riscos institucionais da CGOV/ICMBio (Art.
  37, parágrafo único, IX, da Portaria ICMBio nº 5.592/2025), aplicando a
  Metodologia da Portaria ICMBio nº 975/2021 — as 7 etapas (4.1 a 4.7), a
  sintaxe obrigatória do risco e as Tabelas 1 a 13 (categorias, escalas,
  matrizes de impacto x probabilidade e de classificação, eficácia de
  controles, priorização, estratégias e plano 5W2H). IMPORTANTE: trata do
  risco institucional (Art. 37-IX) — não do risco de projeto/entrega do
  Plano de Entregas, que é o S10 do pgd-agente-icmbio (projeto irmão). Use ao
  invocar /cgov-gestao-riscos, GESTAO_RISCOS, "mapear riscos", "matriz de
  riscos", "risco inerente", "risco residual", "risco extremo", "evento de
  risco", "eficácia do controle", "plano de tratamento", "CTGRIC", "SITAI",
  "PGRI", "Portaria 975", "Portaria 255", "identificar/avaliar/tratar risco".
  Acione também se o risco vier descrito fora dessa sintaxe. PGRI = riscos;
  PGR (Programa de Gestão para Resultados) é a skill cgov-pgr.
---

# cgov-gestao-riscos — Gestão de Riscos Institucionais (CGOV/ICMBio)

Esta skill apoia a CGOV/ICMBio no cumprimento do **Art. 37, parágrafo único,
inciso IX**, da Portaria ICMBio nº 5.592, de 11 de dezembro de 2025 — coordenar,
em conjunto com o **CTGRIC**, a implementação da Política de Gestão de Riscos —
aplicando a **PGRI** (Portaria ICMBio nº 255/2020) e, sobretudo, a
**Metodologia de Gestão de Riscos do ICMBio** (Portaria ICMBio nº 975/2021).

---

## CONVENÇÃO DE SIGLAS — LEIA ANTES DE QUALQUER COISA

| Sigla | Significado | Norma | Esta skill? |
|---|---|---|---|
| **PGRI** | **Política de Gestão de Riscos e Integridade** | Portaria ICMBio nº 255/2020 | ✅ **sim** |
| **PGR** | Programa de Gestão para Resultados e Inovação | Portaria ICMBio nº 1.572/2023 | ❌ use `cgov-pgr` |
| **PGD** | Programa de Gestão e Desempenho (teletrabalho) | IN ICMBio nº 14/2025 | ❌ use `cgge-especialista-pgd` |

> **Nunca escreva "PGR de riscos" ou "Plano de Gestão de Riscos — PGR".** O
> instrumento de riscos é a **PGRI**. A sigla PGR pertence exclusivamente ao
> Programa de Gestão para Resultados. Se o usuário usar PGR querendo dizer
> riscos, corrija-o de forma breve e siga adiante.

> **IMPORTANTE — risco institucional × risco de projeto/entrega.** Esta
> skill trata exclusivamente do **risco institucional** no sentido do
> Art. 37, IX, da Portaria ICMBio nº 5.592/2025 e da PGRI (Portaria ICMBio
> nº 255/2020, metodologia da Portaria ICMBio nº 975/2021) — riscos que
> ameaçam objetivos estratégicos e processos organizacionais do ICMBio como
> um todo. Ela **não** trata do **risco de projeto/entrega** — dependências,
> restrições e ameaças à execução de uma entrega específica do Plano de
> Entregas —, que é o objeto do componente **S10** do assistente
> `pgd-agente-icmbio`, um projeto irmão fora deste repositório. Os dois usam
> a palavra "risco" mas respondem a lógicas e formulários diferentes: se o
> usuário perguntar sobre risco de atraso ou de inviabilidade de uma entrega
> específica do Plano de Entregas (não um risco institucional amplo),
> esclareça a distinção e direcione ao S10, em vez de aplicar a Metodologia
> da Portaria nº 975/2021 a um objeto que ela não foi desenhada para tratar.

---

## BASE NORMATIVA

| Norma | Objeto | Papel nesta skill |
|---|---|---|
| **Portaria ICMBio nº 975/2021** | Metodologia de Gestão de Riscos do ICMBio | ✅ **Fonte primária** — texto extraído e verificado em 04/08/2026; as Tabelas 3 a 13 reproduzidas abaixo são fiéis ao Anexo |
| **Portaria ICMBio nº 255/2020** | **PGRI** — Política de Gestão de Riscos e Integridade | Política que a Metodologia operacionaliza |
| **Portaria ICMBio nº 4.529/2025** | Institui o **CTGRIC** e seu regimento | ✅ verificada em 14/08/2026 — a **CGOV é a Secretaria-Executiva** do Comitê |
| **Portaria ICMBio nº 253/2026** | Programa de Integridade **Integra+** — norma **vigente** | ✅ verificada em 14/08/2026; revogou a nº 1.257/2022, que sucedera a nº 923/2020 |
| Portaria ICMBio nº 1.164/2025 | Planejamento Estratégico 2025-2027 | Monitoramento trimestral pelo Petrvs; revogou a PGE |
| Decreto nº 11.529/2023 | SITAI | O CTGRIC compõe o SITAI como unidade setorial no ICMBio (USI) |
| ⛔ Portaria ICMBio nº 768/2020 | Política de Gestão Estratégica — PGE | **REVOGADA** pelo art. 12 da Portaria nº 1.164/2025 — **não citar como vigente** |
| ⛔ Portaria ICMBio nº 923/2020 | Integra+ (versão original) | Superada; a Portaria nº 975/2021 ainda a cita — remissão desatualizada |
| IN Conjunta MP/CGU nº 1/2016 | Controles internos, gestão de riscos e governança | Marco federal |
| ABNT NBR ISO 31000:2018 e ISO/IEC 31010:2019 | Diretrizes e técnicas | Referência conceitual; **não** substitui a Metodologia do ICMBio |

> **Regra de precedência:** em qualquer divergência entre a Portaria ICMBio
> nº 975/2021 e um referencial externo (ISO, COSO, TCU, CGU), **prevalece a
> Portaria nº 975/2021**. Não importe escalas, matrizes ou nomenclaturas de
> outras fontes.

---

## FASE 1 — ESCOPO E OBJETO

Pergunte apenas o que não estiver claro no contexto:

1. **Objeto:** qual processo organizacional, unidade, objetivo estratégico ou
   contrato está sendo analisado?
2. **Fase do ciclo:** (a) mapeamento do zero, (b) revisão de matriz existente,
   (c) elaboração de plano de tratamento, ou (d) monitoramento?
3. **Contexto institucional:** há deliberação do CTGRIC, do Comitê Gestor ou da
   alta gestão que oriente o escopo?
4. **Insumos:** planilha de riscos, ata, relatório de auditoria, mapeamento do
   processo?
5. **Equipe:** cada Diretoria e o Gabinete designam equipe para participar das
   etapas — quem responde por este processo?

> Se o essencial estiver claro, prossiga e registre as lacunas como pendências.

---

## FASE 2 — AS 7 ETAPAS DA PORTARIA ICMBio Nº 975/2021

### Etapa 4.1 — Entendimento do Contexto

Identificar os objetivos do processo organizacional e definir os contextos
externo e interno.

**4.1.1 Mapeamento do processo** — pela ferramenta **SIPOC**, na ordem de
preenchimento indicada pela própria Tabela 1 da norma:

| Ordem | Elemento | Conteúdo |
|---|---|---|
| (1) | **Processos** | Conjunto de ações e atividades inter-relacionadas executadas para alcançar o produto |
| (2) | **Produtos/Serviços** | Resultados do processo — o que os clientes esperam receber |
| (3) | **Clientes** | Pessoas, departamentos, instituições ou outros processos que recebem os produtos |
| (4) | **Insumos** | Elementos necessários para que o processo aconteça (dados, materiais, recursos) |
| (5) | **Fornecedores** | Origens dos insumos |

> Preencha nesta ordem — processo → saídas → clientes → entradas → fornecedores.
> É contraintuitivo em relação à sigla, mas é o que a norma determina.

**4.1.2 Análise do ambiente** — fatores do contexto geral (Tabela 2 da norma).

### Etapa 4.2 — Identificação de Riscos

**4.2.1 Descrição dos riscos.** Técnicas admitidas pela norma: *brainstorming*,
questionários, entrevistas, *check-list*, matriz SWOT, análise de dados
históricos, análise de premissas, opiniões especializadas, necessidades das
partes interessadas e diagramas de causa e efeito.

**Sintaxe obrigatória — transcrição literal da norma:**

> **"Devido o(a) `<CAUSA>`, poderá ocorrer o(a) `<EVENTO DE RISCO>`, ocasionando
> o(a) `<CONSEQUÊNCIA>` e impactando o alcance do `<OBJETIVO ESTRATÉGICO>`."**

- **CAUSA** — origem/fonte do risco. Mede-se a probabilidade analisando as causas.
- **EVENTO DE RISCO** — o fato que pode ocorrer. Não é a causa nem a consequência.
- **CONSEQUÊNCIA** — o efeito se o evento se materializar. Mede-se o impacto pelas
  consequências.
- **OBJETIVO ESTRATÉGICO** — o resultado institucional afetado.

Se o usuário descrever um risco fora dessa estrutura, **reescreva antes de
prosseguir** e explique o que faltava. Erros recorrentes: apresentar a
consequência como se fosse o evento; apresentar ausência de controle ("falta de
sistema") como se fosse risco — isso é causa; omitir o objetivo estratégico.

**4.2.2 Categorias do risco — Tabela 3 (íntegra).** Um risco pode tocar mais de
uma categoria, mas sempre há uma dominante.

| Categoria | Descrição |
|---|---|
| **Operacional** | Eventos que podem comprometer as atividades do ICMBio, normalmente associados a falhas, deficiência ou inadequação de processos internos, pessoas, infraestrutura e sistemas |
| **Legal** | Eventos derivados de alterações legislativas ou normativas que podem comprometer as atividades do ICMBio |
| **Financeiro/Orçamentário** | Eventos que podem comprometer a capacidade de contar com os recursos orçamentários e financeiros necessários, ou que comprometam a execução orçamentária (ex.: atrasos no cronograma de licitações) |
| **Reputação** | Eventos que podem comprometer a confiança da sociedade na capacidade do ICMBio de cumprir sua missão institucional; interferem na imagem da autarquia |
| **Integridade** | Eventos que podem favorecer ou facilitar práticas de corrupção, fraudes, irregularidades e/ou desvios éticos e de conduta |

**4.2.2.1 Subcategorias de integridade — Tabela 4 (as 6 da norma):**

1. Abuso de posição ou poder em favor de interesses privados
2. Nepotismo
3. Conflito de interesses
4. Pressão interna ou externa ilegal para influenciar agente público
5. Solicitação ou recebimento de vantagem indevida
6. Utilização de recursos públicos em favor de interesses privados

> Riscos de integridade são tratados no âmbito do Programa de Integridade
> **Integra+**. ⚠️ **Remissão desatualizada na norma:** a Portaria nº 975/2021
> cita a Portaria nº 923/2020 como instituidora do Integra+. A norma **vigente**
> é a **Portaria ICMBio nº 253, de 16 de janeiro de 2026**, que revogou a
> nº 1.257/2022 (a qual sucedera a nº 923/2020). Cite sempre a nº 253/2026.
>
> O Integra+ define os **riscos para a integridade** como "possibilidade de
> ocorrência de evento de corrupção, fraude, irregularidade ou desvio ético ou
> de conduta que venha a impactar o cumprimento dos objetivos institucionais"
> (art. 2º, III, da Portaria nº 253/2026) e integra-se expressamente à PGRI.

### Etapa 4.3 — Análise de Riscos

Estabelecer probabilidade e impacto dos riscos identificados.

**Tabela 5 — Escala de Probabilidade** (o gestor de riscos pode adequar **apenas**
os quantitativos da coluna "Ocorrências"):

| Nível | Descritor | Descrição | Ocorrências |
|---|---|---|---|
| 1 | Muito baixa | Evento extraordinário, sem histórico disponível de ocorrência | Até 5 |
| 2 | Baixa | Evento casual, com histórico conhecido de ocorrência | > 5 até 10 |
| 3 | Média | Evento esperado, de frequência reduzida, com histórico conhecido pela maioria dos gestores e operadores do processo | > 10 até 15 |
| 4 | Alta | Evento usual, de ocorrência habitual, com histórico amplamente conhecido | > 15 até 20 |
| 5 | Muito alta | Evento repetitivo e constante, de ocorrência numerosa | > 20 |

**Tabela 6 — Impacto nas Dimensões do Objeto:**

| Nível | Custo (aumento %) | Prazo (atraso %) | Escopo (afetação) | Qualidade (degradação) |
|---|---|---|---|---|
| 1 | Até 5 | Até 5 | Insignificante | Irrisória |
| 2 | > 5 até 10 | > 5 até 10 | Pouco | Pouco |
| 3 | > 10 até 15 | > 10 até 15 | Significativa | Relevante |
| 4 | > 15 até 20 | > 15 até 20 | Muito significativa | Muito relevante |
| 5 | > 20 | > 20 | Ampla | Grave |

**Tabela 7 — Escala de Impacto:**

| Nível | Descritor | Descrição |
|---|---|---|
| 1 | Muito baixo | Impacto insignificante nos objetivos, com dispensa de medida de reparação/recuperação |
| 2 | Baixo | Impacto mínimo nos objetivos, com possibilidade de fácil reparação/recuperação |
| 3 | Médio | Impacto mediano nos objetivos, com possibilidade de reparação/recuperação |
| 4 | Alta *(grafia do original)* | Impacto significante nos objetivos, com possibilidade remota de reparação/recuperação |
| 5 | Muito alto | Impacto máximo nos objetivos, sem possibilidade de reparação/recuperação |

### Etapa 4.4 — Avaliação de Riscos

**a) Tabela 8 — Matriz Impacto × Probabilidade.** O valor do **risco inerente** é
o produto Impacto × Probabilidade:

| Impacto ↓ / Probabilidade → | 1 Muito baixa | 2 Baixa | 3 Média | 4 Alta | 5 Muito alta |
|---|---|---|---|---|---|
| **5 Muito alta** | 5 | 10 | 15 | 20 | 25 |
| **4 Alta** | 4 | 8 | 12 | 16 | 20 |
| **3 Média** | 3 | 6 | 9 | 12 | 15 |
| **2 Baixa** | 2 | 4 | 6 | 8 | 10 |
| **1 Muito baixa** | 1 | 2 | 3 | 4 | 5 |

**b) Tabela 9 — Matriz de Classificação de Riscos.** É uma **máscara** aplicada
sobre a Tabela 8. Classifica em **Baixo, Médio, Alto ou Extremo**:

| Impacto ↓ / Probabilidade → | 1 Muito baixa | 2 Baixa | 3 Média | 4 Alta | 5 Muito alta |
|---|---|---|---|---|---|
| **5 Muito alta** | Médio | Alto | Extremo | Extremo | Extremo |
| **4 Alta** | Médio | Alto | Alto | Extremo | Extremo |
| **3 Média** | Médio | Médio | Alto | Alto | Extremo |
| **2 Baixa** | Baixo | Médio | Médio | Alto | Alto |
| **1 Muito baixa** | Baixo | Baixo | Médio | Médio | Médio |

> ⚠️ **Duas armadilhas.**
> **(1)** O nível mais alto chama-se **"Extremo"** — **não** "Crítico".
> **(2)** A classificação vem da **máscara**, não de faixas do produto. Produtos
> iguais podem ter classificações diferentes: I2×P2 = 4 → **Médio**, enquanto
> I1×P4 = 4 → **Médio** e I4×P1 = 4 → **Médio**; já I5×P3 = 15 → **Extremo**,
> enquanto I3×P5 = 15 → **Extremo** e I5×P1 = 5 → **Médio** contra I1×P5 = 5 →
> **Médio**. Sempre consulte a célula, nunca o número isolado.
>
> A matriz de classificação é passível de adequação pelos gestores de risco na
> elaboração do contexto específico — a de Impacto × Probabilidade, não.

**c) Tabela 10 — Eficácia dos Controles e cálculo do risco residual.** O gestor
de riscos **não pode** alterar esta definição.

| Eficácia | Situação do controle existente | Multiplicador |
|---|---|---|
| **Inexistente** | Ausência completa de controle | **1,00** |
| **Fraco** | Controle depositado na esfera de conhecimento pessoal dos operadores, em geral manual | **0,80** |
| **Mediano** | Pode falhar por não contemplar todos os aspectos relevantes, ou porque seu desenho/ferramentas não são adequados | **0,60** |
| **Satisfatório** | Formalizado e sustentado por ferramentas adequadas que, embora não contemplem todos os aspectos relevantes, mitigam o risco razoavelmente | **0,40** |
| **Forte** | Formalizado, mitiga o risco em todos os aspectos relevantes; nível de "melhor prática" | **0,20** |

> **Fórmula oficial:**
> **Risco Residual = Risco Inerente × Multiplicador da eficácia do controle**
>
> Não reclassifique probabilidade e impacto para obter o residual — isso é
> método de outras metodologias, não da Portaria nº 975/2021. Depois de calcular
> o valor residual, reclassifique-o pela máscara da Tabela 9 para obter o nível.

### Etapa 4.5 — Priorização de Riscos

**Tabela 11 — Diretrizes para Priorização.** Definidas pelo Comitê Gestor; o
gestor de riscos **não pode** adequá-las.

| Nível | Descrição | Diretriz para resposta |
|---|---|---|
| **Extremo** | Nível de risco **absolutamente inaceitável** | Comunicar ao **Comitê Gestor** e ter **resposta imediata**. Postergação de medidas somente mediante deliberação do Comitê Gestor |
| **Alto** | Nível de risco **inaceitável** | Comunicar ao Comitê Gestor e ter ação tomada em período determinado. Postergação somente mediante manifestação escrita do dirigente máximo da unidade (Diretor nas Diretorias; Chefe de Gabinete no GABIN), dando ciência ao Presidente do ICMBio, que poderá avocar a decisão |
| **Médio** | Nível de risco **aceitável** | Geralmente nenhuma medida especial; requer monitoramento específico e atenção da unidade para manter o nível ou reduzi-lo sem custos adicionais |
| **Baixo** | Nível de risco **muito baixo** | Pode haver oportunidades de maior retorno explorável assumindo mais riscos, avaliando custo × benefício — como diminuir o nível de controles |

### Etapa 4.6 — Definição de Respostas aos Riscos

**4.6.1 Tabela 12 — Estratégias de tratamento.** A escolha depende do nível do
risco, do contexto do ICMBio e do custo do controle.

| Estratégia | Quando | No ICMBio significa |
|---|---|---|
| **Mitigar** | Risco **Alto** ou **Extremo**, quando os controles têm custo/benefício adequado | Implementar controles que diminuam os efeitos dos riscos |
| **Compartilhar** | Risco **Alto** ou **Extremo**, quando os controles **não** têm custo/benefício adequado | Terceirização, apólice de seguro |
| **Evitar** | Risco **Alto** ou **Extremo**, quando o controle é caro demais e não há quem compartilhe | **Encerrar o processo organizacional** — exige aprovação do Comitê Gestor |
| **Aceitar** | Risco **Médio** ou **Baixo** | Nenhum novo controle precisa ser implementado |

> A norma usa **Mitigar / Compartilhar / Evitar / Aceitar** — não use
> "Reduzir" nem "Transferir".

**4.6.2 Tabela 13 — Plano de Tratamento**, construído com base na ferramenta
**5W2H**:

| Estratégia de Tratamento | Medidas de Tratamento | Ações | Unidade Responsável | Pessoa Responsável | Custo Previsto | Data de Início | Data de Conclusão | Situação |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | a ser iniciada / em andamento / parada / concluída |

### Etapa 4.7 — Comunicação e Monitoramento

Ocorre **durante todo** o processo. O monitoramento cabe principalmente à
unidade responsável pelo processo organizacional, de modo a:

- **I** — garantir que os controles sejam eficazes e eficientes;
- **II** — analisar as ocorrências dos riscos;
- **III** — detectar mudanças que possam requerer revisão dos controles e/ou do
  Plano de Tratamento; e
- **IV** — identificar os riscos emergentes.

A **PGRI** delega **a todos os servidores** a responsabilidade de monitorar a
evolução dos níveis de risco e a efetividade dos controles nos processos em que
estejam envolvidos ou de que tenham conhecimento. Mudanças ou fragilidades
identificadas devem ser reportadas **imediatamente** ao gestor de riscos do
processo.

**Avaliação da gestão de riscos — ⚠️ remissão prejudicada.** A Portaria
nº 975/2021 determina que as Diretorias e o Gabinete apresentem os resultados
das medidas de tratamento na **Reunião de Avaliação da Estratégia — RAE**,
prevista na Política de Gestão Estratégica (Portaria ICMBio nº 768/2020).

**Essa PGE foi revogada** pelo art. 12 da Portaria ICMBio nº 1.164, de 1º de
abril de 2025, e o Planejamento Estratégico 2025-2027 **não recriou a RAE**. O
ciclo vigente de monitoramento é outro:

| Etapa | Responsável | Base |
|---|---|---|
| Monitoramento trimestral das ações prioritárias, via sistema **PGD Petrvs** | Diretorias | Portaria nº 1.164/2025, art. 8º |
| Consolidação no **Relatório Trimestral de Ações Prioritárias** | DPAE/CGGE | art. 8º, § 2º |
| Validação dos relatórios | **Comitê Gestor** | arts. 8º, § 2º, e 9º, parágrafo único |
| Relatório Anual de Avaliação das Ações Prioritárias | DPAE/CGGE | art. 9º |

> Ao tratar de reporte de riscos, **não afirme que a RAE existe**. Descreva o
> ciclo vigente acima, registre a remissão prejudicada da Portaria nº 975/2021 e
> sinalize que o foro de apresentação dos resultados de tratamento precisa de
> definição institucional. Essa é uma lacuna normativa real — declare-a, não a
> contorne.

**Instância colegiada — CTGRIC (Portaria ICMBio nº 4.529/2025).** Órgão
consultivo e propositivo de apoio ao Comitê Gestor. Presidido pela **CGGE**, tem
a **CGOV como Secretaria-Executiva** (art. 2º, I e II). Reúne-se
**trimestralmente** em caráter ordinário, com convocação de 5 dias úteis de
antecedência, presença mínima de 50%, quórum de reunião de maioria absoluta e
de aprovação de maioria simples.

Como Secretaria-Executiva, cabe à **CGOV** (art. 5º): organizar a pauta com o
Presidente · convocar as reuniões · secretariar e minutar as atas · encaminhar
as atas para aprovação · **dar encaminhamento às deliberações e monitorar seu
cumprimento** · manter o acervo documental · prestar apoio técnico e
administrativo.

Compete ao CTGRIC, entre outros (art. 3º): propor políticas, planos, normas e
metodologias de gestão de riscos, controles internos e integridade; elaborar e
monitorar o **Plano de Integridade**; **supervisionar a elaboração e o
monitoramento do Plano de Gestão de Riscos do ICMBio**; e assessorar o Comitê
Gestor. O CTGRIC compõe o **SITAI** como unidade setorial no ICMBio (USI).

---

## FASE 3 — ENTREGA

1. **Matriz de Riscos consolidada:** ID · Descrição na sintaxe oficial ·
   Categoria (Tabela 3) · Probabilidade (1-5) · Impacto (1-5) · Risco Inerente
   (produto) · Nível Inerente (máscara) · Controles existentes · Eficácia e
   multiplicador (Tabela 10) · Risco Residual (produto × multiplicador) · Nível
   Residual (máscara) · Diretriz de priorização (Tabela 11) · Estratégia
   (Tabela 12).
2. **Diagnóstico de conformidade** com a Portaria nº 975/2021 — todo desvio
   metodológico encontrado e a correção aplicada.
3. **Plano de Tratamento** (Tabela 13) para os riscos priorizados.
4. **Síntese executiva** (até 5 linhas): quantidade de riscos, distribuição por
   nível (Baixo/Médio/Alto/Extremo), quantos exigem comunicação ao Comitê
   Gestor, próximos passos.

---

## REGRAS TRANSVERSAIS

- **Mostre a conta.** Ao classificar um risco, exiba: probabilidade escolhida e
  por quê → impacto e por quê → produto → célula da máscara → eficácia do
  controle → multiplicador → residual. Um número sem derivação não é auditável.
- Nunca aceite descrição de risco sem causa, evento e consequência distintos.
- O risco inerente é calculado **sem** considerar controles; o residual aplica o
  multiplicador da Tabela 10 sobre o inerente.
- **Extremo**, não "Crítico". **Mitigar/Compartilhar/Evitar/Aceitar**, não
  "Reduzir/Transferir".
- Risco **Extremo** ou **Alto** exige comunicação ao **Comitê Gestor** — não
  sugira "aceitar" nenhum dos dois.
- Riscos de integridade conectam-se ao SITAI (Decreto nº 11.529/2023) e ao
  Programa de Integridade do ICMBio.
- Não invente categoria, subcategoria, escala, multiplicador ou nível que não
  esteja nas tabelas acima. Se o caso exigir algo fora delas, declare a lacuna.
- A CGOV **coordena** a implementação da PGRI em conjunto com o CTGRIC — não
  aprova matriz de risco de unidade nem decide tratamento por ela.
- Saída sempre em Markdown com tabelas; nunca gerar `.docx` diretamente.
