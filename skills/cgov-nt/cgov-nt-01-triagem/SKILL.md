---
name: cgov-nt-01-triagem
description: >
  Primeira etapa OBRIGATÓRIA de qualquer Nota Técnica (NT) ou parecer da
  Coordenação de Governança (CGOV/ICMBio), para QUALQUER processo ou tema —
  não apenas PGD ou PSPEADBio. Triagem e enquadramento regimental da demanda
  (Art. 37, Portaria ICMBio nº 5.592/2025), identificação de normas aplicáveis,
  definição de quais skills cgov-nt-02 a 07 são necessárias, e criação do
  arquivo de estado `NT_ESTADO.md` em `local/analyses/SEI_[processo]_[apelido]/`
  (substitui CLAUDE.md por processo). Use ao invocar /cgov-nt-01, /TRIAGEM_NT,
  "nova nota técnica", "quero elaborar uma NT", "abrir NT sobre [tema]",
  "enquadrar essa demanda", "qual eixo do Art. 37 se aplica", "essa NT precisa
  de PFE?". Acione SEMPRE antes de cgov-nt-02 a 07 — se não houver
  `NT_ESTADO.md` para o processo em análise, redirecione para cá primeiro.
---

# cgov-nt-01 — Triagem e Enquadramento Regimental da Demanda

Esta é a **porta de entrada única** da suíte canônica **cgov-nt (01 a 07)** para
elaboração de Notas Técnicas, pareceres e manifestações da CGOV/ICMBio, aplicável a
**qualquer processo** em análise — revisões normativas, consultas internas, análises
de governança institucional, criação de comitês, gestão de riscos, PGD/PGR, Cadeia
de Valor, DFT, AIR/ARR, etc. — sem exigir customização prévia por projeto.

O objetivo desta skill é responder a três perguntas antes de qualquer redação:
**(1) o que estamos analisando, (2) com base em que competência e normas, e
(3) qual roteiro de skills desta suíte o caso concreto exige.**

---

## FASE 1 — COLETA DE DADOS MÍNIMOS

Pergunte ao usuário **apenas o que não estiver disponível no contexto atual** (chat,
arquivos do projeto, ou anexos já enviados):

1. **Objeto da análise:** norma, minuta, proposta, consulta, dado ou situação a ser
   analisada (peça um resumo de 1 a 3 linhas se não houver documento anexado).
2. **Processo SEI** (se houver) e **unidade(s) demandante(s) e interessada(s)**.
3. **Gatilho do trabalho:** despacho recebido, demanda espontânea da CGOV,
   encaminhamento da PFE/Presidência, consulta interna a servidores, etc.
4. **Existência de dados brutos** a analisar (planilha de respostas, minuta articulada,
   indicadores, atas) — se houver, peça que sejam anexados ao projeto/conversa.
5. **Destino final do produto:** apenas parecer interno da CGOV, ou NT que seguirá
   para manifestação da PFE/ICMBio (isso decide se cgov-nt-06 será necessária).

> Não interrompa o fluxo pedindo tudo de uma vez — se o essencial (objeto da análise)
> já estiver claro pela mensagem do usuário ou por arquivo anexado, prossiga e apenas
> sinalize as lacunas restantes como pendências no `NT_ESTADO.md` (Fase 3).

---

## FASE 2 — ENQUADRAMENTO REGIMENTAL (RACIOCÍNIO INTERNO)

Antes de responder, raciocine internamente nestes quatro passos:

**Passo 1 — Classificação do eixo de competência (Art. 37, Portaria ICMBio nº
5.592/2025).** A CGOV lidera dois processos organizacionais (governança de processos
organizacionais; e gestão de riscos institucionais) e possui as seguintes atribuições
(Parágrafo único):

| Inciso | Atribuição (resumo) |
|---|---|
| I | Planejar, coordenar e monitorar as ações dos processos organizacionais sob liderança da CGOV |
| II | Política de Governança Institucional (Portaria ICMBio nº 4.101/2023) |
| III | Métodos, padrões e soluções para gestão por processos |
| IV | Atualização do Regimento Interno do ICMBio |
| V | Adequação do Quadro Demonstrativo de Cargos e Funções Comissionadas Executivas |
| VI | Cadeia de Valor e Catálogo de Produtos e Serviços / Dimensionamento da Força de Trabalho (DFT) |
| VII | Operacionalização do PGD (Planos de Entregas, Planejamento Estratégico, Cadeia de Valor) — em conjunto com a CGGP |
| VIII | Implementação do Programa de Gestão para Resultados e Inovação (PGR) |
| IX | Política de Gestão de Riscos — em conjunto com o CTGRIC |
| X | Recomendações metodológicas para AIR e ARR (Decreto nº 10.411/2020) |

Identifique **o(s) inciso(s)** em que a demanda se enquadra. Se a demanda não se
enquadrar em nenhum inciso, sinalize isso explicitamente ao usuário (ver Regra
Especial ao final) em vez de forçar um enquadramento artificial.

**Passo 2 — Identificação das normas aplicáveis.** Combine o Regimento Interno
(sempre citado como base de competência) com as normas específicas do eixo
identificado (ex.: risco → Portaria ICMBio nº 975/2021; AIR/ARR → Decreto nº
10.411/2020; atos normativos → Decreto nº 12.002/2024 e LC nº 95/1998; integridade →
Decreto nº 11.529/2023). **Nunca presuma o número de artigo/inciso de uma norma que
você não tem certeza** — cite a norma de forma geral e sinalize a necessidade de
confirmação, em vez de inventar.

**Passo 3 — Diagnóstico do tipo de produto.** Classifique a NT em um (ou mais) dos
padrões abaixo — a classificação determina **apenas** se `cgov-nt-02` (instrução
técnica de dados) e o diagnóstico normativo prévio são necessários. **A
necessidade de quesitos PFE (`cgov-nt-06`) é decidida à parte, no Passo 3.1
abaixo — nunca infira PFE apenas a partir do Tipo.**

- **Tipo A — Análise crítica de minuta normativa articulada** (auditoria de
  remissões, fluxo ou competências de um texto normativo): precisa de diagnóstico
  normativo prévio (`cgov-comparar-versoes`, `cgov-modelar-fluxo`,
  `cgov-auditoria-competencias`, `cgov-saneamento-legistica`) antes de `cgov-nt-02`.
- **Tipo B — Análise de consulta interna com dados** (survey, formulário,
  indicadores): precisa de tabulação quantitativa e/ou qualitativa (`cgov-nt-02`)
  antes da redação.
- **Tipo C — Análise de governança institucional** (criação de comitê, sobreposição
  de competências, arranjo organizacional): pode dispensar `cgov-nt-02` se não
  houver dados brutos, indo direto para `cgov-nt-03`.
- **Tipo D — Nota Técnica de acompanhamento/status** (ex.: status de recomendações
  de auditoria, status de DFT): estrutura mais enxuta; avalie com o usuário se todos
  os capítulos da suíte são necessários.

> ⚠️ **Um mesmo processo pode combinar tipos.** Uma consulta interna sobre a
> revisão de uma Instrução Normativa é, ao mesmo tempo, **Tipo B** quanto à
> natureza do dado bruto (survey) e pode exigir manifestação da PFE quanto ao
> **objeto final** (a própria revisão normativa) — os dois eixos são
> independentes. Não presuma que "Tipo B" dispensa a PFE.

**Passo 3.1 — Necessidade de quesitos PFE (independente do Tipo).** Execute
`cgov-nt-06` sempre que a resposta à pergunta 5 da Fase 1 ("destino final do
produto") indicar que a NT **subsidiará a edição, alteração ou revisão de um ato
normativo do ICMBio** — isso inclui tanto o caso Tipo A (auditoria direta de
minuta) quanto o caso Tipo B em que os dados de uma consulta embasam a revisão de
uma IN/portaria (como no caso de referência da revisão da IN nº 14/2025 — PGD).
Se houver dúvida, pergunte diretamente: "Este parecer seguirá para manifestação da
PFE/ICMBio sobre a validade do ato normativo correspondente?"

**Passo 4 — Definição do roteiro de execução.** Com base nos passos 1 a 3, defina
quais das skills `cgov-nt-02` a `cgov-nt-07` serão executadas e em que ordem,
marcando como "dispensável" as que não se aplicam ao caso concreto (nunca execute
uma etapa que não agrega valor apenas por rigidez ao roteiro-padrão).

---

## FASE 3 — SAÍDA: FICHA DE ENQUADRAMENTO E ARQUIVO DE ESTADO

### 3.1. Resposta ao usuário (sempre em chat, Markdown)

```
### Ficha de Enquadramento — [Título provisório do objeto de análise]

**1. Objeto da análise:** [descrição em 1-3 linhas]
**2. Processo SEI:** [nº ou "não informado / a confirmar"]
**3. Destinatário(s) / Interessado(s):** [unidades]

**4. Enquadramento regimental (Art. 37, Portaria ICMBio nº 5.592/2025):**
- Inciso(s) aplicável(is): [ex.: VII — operacionalização do PGD]
- Fundamento: [texto resumido do inciso]

**5. Normas de referência identificadas:**
- [Lista de normas — sinalizar com ⚠️ qualquer uma que precise de confirmação do usuário]

**6. Tipo de produto:** [A/B/C/D — nome do tipo]

**7. Roteiro de execução recomendado:**
| Etapa | Skill | Necessária? | Observação |
|---|---|---|---|
| Diagnóstico normativo prévio | cgov-comparar-versoes / cgov-modelar-fluxo / cgov-auditoria-competencias | [Sim/Não] | [motivo] |
| Instrução técnica (dados) | cgov-nt-02 | [Sim/Não] | [motivo] |
| Cap. 1 — Introdução | cgov-nt-03 | Sim | — |
| Cap. 2-3 — Diagnóstico | cgov-nt-04 | Sim | — |
| Cap. 4 — Propostas | cgov-nt-05 | [Sim/Não] | [motivo, se não houver recomendações a propor] |
| Quesitos PFE | cgov-nt-06 | [Sim/Não] | [conforme Passo 3.1 — resposta à pergunta 5 da Fase 1, não o Tipo] |
| Cap. 5 — Conclusão | cgov-nt-07 | Sim | — |

**8. Pendências a esclarecer antes de prosseguir:**
- [itens não informados pelo usuário, se houver]

---
✅ Arquivo `NT_ESTADO.md` criado/atualizado em `local/analyses/SEI_[processo]_[apelido]/`.
Ao invocar as próximas skills desta suíte, elas lerão este arquivo automaticamente —
não será necessário repetir o contexto.
```

### 3.2. Arquivo de estado `NT_ESTADO.md`

> **Convenção de localização (fixada em 05/08/2026):** o `NT_ESTADO.md` de cada
> processo vive em `local/analyses/SEI_[nº do processo sem barra]_[apelido curto]/`,
> nunca na raiz do projeto. Essa pasta não é sincronizada em repositórios Git do
> projeto (está no `.gitignore`) — é o espaço de rascunho e histórico de trabalho
> por processo.

1. **Determine o nome da subpasta:**
   - `[processo SEI]`: número do processo com o `/` substituído por `_`
     (ex.: `00000.000000/0000-00` → `00000.000000_0000-00`). Se não houver
     processo SEI ainda formalizado, use `sem-processo` seguido de uma data
     curta (ex.: `sem-processo_2026-08-05`).
   - `[apelido curto]`: uma palavra ou sigla que identifique o objeto da
     análise para humanos (ex.: `RADAR`, `REGIMENTO`, `IN14`, `PGR`). Infira do
     objeto da análise; se não houver um apelido óbvio, pergunte ao usuário em
     vez de inventar um.
   - Nome final da subpasta: `local/analyses/SEI_[processo SEI]_[apelido curto]/`.
2. **Verifique se a subpasta já existe** (pode haver trabalho anterior no mesmo
   processo). Se existir um `NT_ESTADO.md` prévio, **atualize-o** em vez de
   sobrescrever do zero — preserve "Achados e insumos consolidados" e
   "Capítulos já redigidos" já registrados.
3. **Se a subpasta não existir, crie-a** e, dentro dela, crie o arquivo
   `NT_ESTADO.md` com esta estrutura:

```markdown
# Estado da Nota Técnica — [Título provisório]

## Metadados
- Processo SEI: [nº]
- Destinatário: [unidade]
- Interessado: [unidade(s)]
- Data de abertura da triagem: [data]
- Local deste arquivo: `local/analyses/SEI_[processo SEI]_[apelido curto]/`

## Enquadramento (Art. 37, Portaria ICMBio nº 5.592/2025)
- Inciso(s): [...]
- Tipo de produto: [A/B/C/D]

## Normas de referência
- [lista]

## Roteiro de execução
- [ ] Diagnóstico normativo prévio (se aplicável)
- [ ] cgov-nt-02 — Instrução técnica (se aplicável)
- [ ] cgov-nt-03 — Cap. 1 Introdução
- [ ] cgov-nt-04 — Cap. 2-3 Diagnóstico
- [ ] cgov-nt-05 — Cap. 4 Propostas (se aplicável)
- [ ] cgov-nt-06 — Quesitos PFE (se aplicável)
- [ ] cgov-nt-07 — Cap. 5 Conclusão

## Achados e insumos consolidados
_(preenchido progressivamente pelas skills seguintes — não editar manualmente)_

## Capítulos já redigidos
_(cada skill acrescenta aqui um resumo de uma linha + status ao concluir)_
```

**Se o ambiente não suportar criação de arquivos persistentes** (ex.: chat avulso
sem projeto), informe isso ao usuário e ofereça reapresentar a Ficha de Enquadramento
completa no início de cada nova skill da suíte, para que ele copie/cole como contexto.

**Se houver mais de um `NT_ESTADO.md` sob `local/analyses/`** ao final desta triagem
(múltiplos processos em andamento simultaneamente), deixe isso explícito na resposta
ao usuário, citando o caminho completo do arquivo recém-criado/atualizado — as skills
seguintes (`cgov-nt-02` a `07`) precisarão dessa referência para localizar o arquivo
correto (ver "Localização do NT_ESTADO.md" em cada uma delas).

---

## REGRA ESPECIAL — DEMANDA FORA DO ESCOPO DA CGOV

Se, no Passo 1 da Fase 2, a demanda não se enquadrar em nenhum inciso do Art. 37,
não force o enquadramento. Responda com transparência:

> "A demanda descrita não parece se enquadrar nas competências regimentais da CGOV
> (Art. 37 da Portaria ICMBio nº 5.592/2025), que trata de governança de processos
> organizacionais e gestão de riscos institucionais. Ela pode ser mais adequada à
> [unidade sugerida, se identificável — ex.: CGGP para questões de pessoal, PFE para
> matéria jurídica]. Deseja que eu prossiga mesmo assim, registrando essa ressalva
> na Ficha de Enquadramento, ou prefere reencaminhar a demanda?"

## ENCADEAMENTO DA SUÍTE

```
/cgov-nt-01 (Triagem — ESTA SKILL)
        ↓
[Diagnóstico normativo prévio, se Tipo A: cgov-comparar-versoes → cgov-modelar-fluxo → cgov-auditoria-competencias]
        ↓
/cgov-nt-02 (Instrução Técnica — se houver dados brutos)
        ↓
/cgov-nt-03 (Cap. 1 — Introdução)
        ↓
/cgov-nt-04 (Cap. 2-3 — Diagnóstico)
        ↓
/cgov-nt-05 (Cap. 4 — Propostas, se aplicável)
        ↓
/cgov-nt-06 (Quesitos PFE, se aplicável)
        ↓
/cgov-nt-07 (Cap. 5 — Conclusão e Encaminhamentos)
```
