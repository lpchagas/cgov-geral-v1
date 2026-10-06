# Fluxos de trabalho — desenvolvimento e operação

> Implantado em 06/10/2026. Define como o Escritório CGOV é desenvolvido
> (Claude Code) e como é usado no dia a dia técnico e administrativo da
> Coordenação (Claude Cowork), e como uma versão passa de um para o outro.

## 1. Visão geral

| | **Desenvolvimento** | **Operação (produção)** |
|---|---|---|
| Para quê | Criar e corrigir skills, instruções, documentação e scripts | Produzir Notas Técnicas, pareceres, análises de processos SEI e demais demandas da CGOV |
| Ferramenta | Claude Code (WSL) | Claude Cowork (app Claude no Windows), projeto "Escritório CGOV" |
| Pasta de trabalho | `~/projetos/cgov-geral-v1` (este repositório) | Pasta **CGOV** do Google Drive |
| Versão das skills | Fonte em `skills/` (rascunho até o commit) | Skills **instaladas** na conta Claude |
| Documentação | `docs/` (edição) | `_acervo-escritorio-virtual/_referencia/docs/` (cópia só leitura) |
| Dados de processos | Não produz; só lê quando precisa de exemplo real | `_acervo-escritorio-virtual/analyses/` |
| Publicação | Git → GitHub (**repositório público**) | Nada é publicado; tudo fica no Drive |

Regra central: **o Cowork nunca edita o repositório e o Claude Code nunca
produz trabalho de processo.** O que liga os dois é a *publicação* (§4) num
sentido e o arquivo de *pendências* (§5) no outro.

```
 DESENVOLVIMENTO (Claude Code, WSL)            OPERAÇÃO (Claude Cowork, Windows)
 ~/projetos/cgov-geral-v1                      My Drive\...\CGOV
   skills/  docs/  scripts/  (Git)               normative-sources\
   local/normative-sources ──link──────────────►   (PDFs e transcrições)
   local/analyses ─────────link──────────────►  _acervo-escritorio-virtual\
                                                   analyses\SEI_...\NT_ESTADO.md
        │ commit → scripts/publicar-operacao.sh    _referencia\docs\  (só leitura)
        ├──► dist/skills/*.zip ── reinstalar ──►  skills instaladas na conta
        └──► _referencia\docs\ ─────────────────►
        ◄──────────── manutencao\PENDENCIAS.md ◄── registro de problemas
```

## 2. Configuração do computador

Feita em 06/10/2026; refaça estes passos só em computador novo ou após
reinstalar o WSL.

### 2.1 Desenvolvimento (WSL)

1. Restaurar ou clonar o repositório em `~/projetos/cgov-geral-v1`.
2. Copiar `.env.example` para `.env` e ajustar os quatro caminhos:
   `CGOV_NORMATIVE_SOURCES`, `CGOV_ACERVO_DRIVE`, `CGOV_ANALYSES` e
   `CGOV_REFERENCIA`.
3. Criar os links para o Drive:

   ```bash
   bash scripts/link-acervo.sh
   ```

4. Instalar o leitor de PDF usado pelos scripts de transcrição:

   ```bash
   npm install --prefix ~/.local/share/cgov-tools pdfjs-dist
   ```

5. Criar `.claude/settings.local.json` (não versionado) bloqueando edição
   direta na pasta CGOV do Drive, ajustando o caminho:

   ```json
   { "permissions": { "deny": ["Edit(//mnt/c/Users/<usuário>/My Drive/<pasta>/CGOV/**)"] } }
   ```

O que já vem versionado em `.claude/settings.json`:

- o Claude Code **pede confirmação** antes de `git commit` e `git push`;
- a edição em `local/analyses/`, `local/normative-sources/`,
  `local/acervo-drive/` e `.env` é **bloqueada**;
- as 14 skills cuja fonte está neste repositório ficam ocultas para o modelo
  (`skillOverrides: user-invocable-only`). Assim, nas sessões de
  desenvolvimento o Claude trabalha sobre a **fonte** em `skills/` e não é
  acionado pela versão instalada, que pode estar desatualizada. Para testar
  a versão instalada de propósito, chame-a pelo nome (`/cgov-nt-01-triagem`).

### 2.2 Operação (Windows, Claude Cowork)

1. No Google Drive para desktop, deixar a pasta CGOV como **"Disponível
   offline"** (evita erros de leitura no WSL e no Cowork).
2. No app Claude, aba Cowork, criar ou abrir o projeto **"Escritório CGOV"**:
   - pasta do projeto: a pasta **CGOV** do Drive (a que contém
     `normative-sources\` e `_acervo-escritorio-virtual\`);
   - instruções do projeto: colar o conteúdo de
     `_referencia\docs\system-instructions\escritorio-cgov.md` (a parte
     abaixo da primeira linha `---`).
3. Em Customize → Skills, instalar as skills a partir de
   `dist/skills/*.zip` (ver §4). No Windows, a pasta é
   `\\wsl.localhost\Ubuntu\home\<usuário>\projetos\cgov-geral-v1\dist\skills`.

**Não vincule o repositório do WSL ao Cowork.** Testado em 06/10/2026: pelo
caminho `\\wsl.localhost\...` o Windows não segue os links do repositório
para o Drive (`local/normative-sources` aparece vazio), o WSL precisaria
estar ligado e o Cowork poderia alterar o código-fonte das skills.

## 3. Fluxo de desenvolvimento (Claude Code)

Abra o Claude Code em `~/projetos/cgov-geral-v1`. Ciclo de uma mudança:

1. **Origem.** Leia `_acervo-escritorio-virtual/manutencao/PENDENCIAS.md`
   (pelo link: `local/acervo-drive/manutencao/PENDENCIAS.md`) e escolha a
   pendência, ou descreva a melhoria.
2. **Editar a fonte** em `skills/<família>/<skill>/SKILL.md`, `docs/` ou
   `scripts/`. Nunca edite `.agents/skills/` nem a referência no Drive.
3. **Validar:**
   - cabeçalho do `SKILL.md` com `name` e `description` (até 1.024
     caracteres);
   - evals da skill (`evals/evals.json` ou `trigger_eval.json`); saídas de
     teste vão para `local/pilots/`, nunca para `local/analyses/`;
   - sem dados pessoais, matrículas ou documentos SEI internos em `docs/` e
     `skills/` (o repositório é público).
4. **Registrar** a decisão em `docs/governance/decision-log.md`.
5. **Espelhar para a Antigravity**, se usada:
   `cp skills/<família>/<skill>/SKILL.md .agents/skills/<skill>/SKILL.md`.
6. **Commit e push** (o Claude Code pede confirmação).
7. **Publicar para a operação** (§4).
8. **Fechar a pendência** em `PENDENCIAS.md`: "resolvida em `<commit>`".

## 4. Publicação: do desenvolvimento para a operação

Depois do commit:

```bash
bash scripts/publicar-operacao.sh
```

O script:

1. recusa publicar se houver alteração sem commit em `skills/` ou `docs/`;
2. gera `dist/skills/<skill>.zip` (sem `evals/`) a partir do commit atual;
3. substitui `_acervo-escritorio-virtual/_referencia/docs/` pela versão do
   commit e grava `LEIA-ME.md` com o número do commit;
4. compara as skills instaladas na conta com a fonte e lista as que precisam
   ser reinstaladas.

Em seguida, para cada skill listada, no app Claude: Customize → Skills →
enviar o `.zip` correspondente, substituindo a versão anterior. Se
`escritorio-cgov.md` mudou, cole o novo texto nas instruções do projeto no
Cowork. Para só conferir as skills instaladas, sem publicar:

```bash
bash scripts/publicar-operacao.sh --verificar
```

A comparação usa a cópia que o Claude Code sincroniza da conta em
`~/.claude/skills/synced/`; depois de reinstalar, ela se atualiza em até
10 minutos com o Claude Code aberto.

## 5. Fluxo operacional (Claude Cowork)

Abra o projeto "Escritório CGOV" no Cowork.

- **Nota Técnica ou parecer:** comece sempre por `cgov-nt-01-triagem`. A
  pasta do processo é criada em
  `_acervo-escritorio-virtual/analyses/SEI_<nº sem barras>_<apelido>/`, com
  `NT_ESTADO.md`; as skills seguintes (`cgov-nt-02` a `07`) leem e
  atualizam esse arquivo.
- **Demandas temáticas** (riscos, AIR/ARR, cadeia de valor, regimento,
  PGR, QCF): use a skill correspondente; os produtos vão para a mesma pasta
  do processo.
- **Rotina administrativa:** o Cowork enxerga também as pastas `CGOV_*`
  (processos, projetos, normativas, Notas Técnicas assinadas). Tarefas
  recorrentes podem virar tarefas agendadas do Cowork.
- **Normas:** consulte `normative-sources\`. Para transcrever um PDF novo,
  use `cgov-transcrever-normativos`; o `.md` é gravado ao lado do PDF.
- **Mapa de caminhos:** as skills citam caminhos do repositório; as
  instruções do projeto mandam traduzir `local/analyses/` →
  `_acervo-escritorio-virtual/analyses/` e `local/normative-sources/` →
  `normative-sources/`. Se o Cowork criar uma pasta `local/` dentro da pasta
  CGOV, mova o conteúdo para o lugar certo e registre uma pendência.
- **Problema ou melhoria:** não corrija a skill no Cowork. Peça ao Cowork
  para registrar em `_acervo-escritorio-virtual/manutencao/PENDENCIAS.md`
  (modelo no próprio arquivo, sem dados pessoais).

## 6. Regras de segurança

| Regra | Por quê |
|---|---|
| Dados de processos só no Drive (`analyses/`) | Contêm rascunhos e informação interna; o Drive tem backup e o repositório é público |
| Nada de `local/`, `.env` ou `dist/` no Git | Já ignorados pelo `.gitignore` |
| Commit e push sempre com confirmação | Repositório público; configurado em `.claude/settings.json` |
| A referência no Drive é descartável | Cada publicação a substitui por inteiro |
| Skill instalada só a partir de `dist/skills/` | Garante que produção = commit publicado |

## 7. Pendências conhecidas (06/10/2026)

- Reinstalar `cgov-cadeia-valor`, `cgov-pgr` e `cgov-regimento-interno`: as
  versões instaladas ainda citam caminhos antigos (`REGISTRO_DECISOES.md`,
  `04_fontes_normativas/`).
- Atualizar as instruções do projeto no Cowork com a nova versão de
  `escritorio-cgov.md` e trocar a pasta do projeto para a pasta CGOV.
- Avaliar, no fluxo de desenvolvimento, deixar as skills neutras quanto ao
  caminho (hoje dependem do mapa de caminhos das instruções do Cowork).
- `ocr_windows.ps1` (`cgov-transcrever-normativos`) depende do PowerShell do
  Windows: não roda no WSL e o funcionamento no Cowork ainda não foi verificado.
- Cópia local das análises anterior à mudança mantida em
  `local/_backup/analyses_pre-drive_20261006/` (fora do Git); pode ser
  apagada depois de confirmado o uso pelo Drive.
