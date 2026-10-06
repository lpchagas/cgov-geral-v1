# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

@AGENTS.md

## What this repository is

Not a software codebase — it is the versioned source for a suite of Claude **Skills** (`SKILL.md` files) and institutional documentation that back the Coordenação de Governança (CGOV/ICMBio)'s work: Notas Técnicas, normative analysis, risk management, AIR/ARR, and related governance instruments. There is no build, lint, or test tooling (no `package.json` or `Makefile`; `scripts/` holds only maintenance helpers) — "tests" are eval cases graded by running a skill against a prompt and checking its output against `expected_output`/`expectations`, not an automated harness.

## Commands

- **Run an eval case**: open `skills/<family>/<skill-name>/evals/evals.json`, take one `prompt`, run it through the corresponding skill, and manually check the output against that case's `expected_output` and `expectations` list. There is no runner script — do this by hand or via a subagent.
- **Validate a `SKILL.md` edit**: confirm the YAML frontmatter still has `name` and `description`; the `description` field has a **1,024-character hard limit** when installed via Customize → Skills in Claude (this has bitten the thematic skills before — see `docs/governance/decision-log.md` §10.3).
- **Git**: single-branch repo (`main`); the repository is **public**. `local/` is fully gitignored — never `git add` anything under it.
- **Publish to operations**: after a commit, `bash scripts/publicar-operacao.sh` builds `dist/skills/*.zip` and refreshes the Cowork read-only reference; `--verificar` only lists installed skills that differ from source.
- **Drive links**: `bash scripts/link-acervo.sh` (re)creates `local/normative-sources`, `local/acervo-drive` and `local/analyses` from `.env`.

## This session is the development flow

Claude Code in this repository is the **development** side only (see `docs/fluxos-de-trabalho.md`). Day-to-day CGOV work — Notas Técnicas, SEI process analyses — runs in Claude Cowork against the CGOV folder on Google Drive, not here.

- Don't produce process work here. `local/analyses/` is a link to the operational area on the Drive; editing it is denied in `.claude/settings.json`. Eval/test output goes to `local/pilots/`.
- The 14 skills whose source lives in `skills/` are hidden from the model here (`skillOverrides`), because the installed copy synced into Claude Code can lag behind the source. Read and test the source `SKILL.md`, not the installed skill.
- Operational feedback arrives in `local/acervo-drive/manutencao/PENDENCIAS.md`; check it when asked what to fix next.
- `git commit` and `git push` always ask for confirmation; the user must approve explicitly.

## Architecture

### Four-way split, by publication status

| Path | Role | Change rule |
|---|---|---|
| `skills/cgov-nt/`, `skills/thematic/` | Canonical skill **source** | Edit → run relevant evals → record decision in `docs/governance/decision-log.md` |
| `local/installed-reference/` | Read-only snapshots of *other* skills as actually installed | Reference only; don't edit to "fix" the installed skill |
| `archive/` | Sanitized historical evidence | Append context; never rewrite content |
| `docs/` | Public documentation | Keep links, normative citations, and personal-data scrubbing accurate |
| `local/` | Working acervo: links to the Drive (normative sources, per-process analyses), pilots, archive | Gitignored entirely — never committed |

**The critical gotcha**: editing a file in `skills/` does **not** change the skill as installed in a Claude account. Skills are installed via Customize → Skills, and source/installed can drift silently — this has happened repeatedly (decision-log §§10–11, 14) and produced skills that contradicted the actual norm they were meant to implement. Any skill edit requires: revise source → run evals → reinstall with overwrite → confirm the reinstalled version matches source → log it.

### The `cgov-nt` pipeline and its state file

`cgov-nt-01-triagem` is the mandatory entry point for any Nota Técnica; it classifies the demand against Art. 37 of Portaria ICMBio nº 5.592/2025 and creates `NT_ESTADO.md`, which subsequent skills (`cgov-nt-02` through `07`, invoked conditionally per the routing `cgov-nt-01` writes into `NT_ESTADO.md`) read and update. This state file lives at `local/analyses/SEI_<processo-sem-barras>_<apelido-curto>/NT_ESTADO.md` — **not** in the skill directories and **not** at the repo root (an earlier convention that was deliberately migrated away from; see decision-log §§12–13). Existing per-process workspaces already there (`02070.001696_2026-31_RADAR`, `02070.020239_2025_64_ECOA`, etc.) are real working folders, not examples.

Fixed drafting conventions the whole suite enforces (validated against a real, filed Nota Técnica — not invented): present tense in NT prose (future tense only inside the text of a normative act itself); chapters as `### Capítulo N`, subsections `#### N.1` restarting per chapter (never subordinate numbering like `4.1.1` — this was tried and rejected); final proposition in lowercase roman numerals `(i) (ii) (iii)`; never invent a law/decree/portaria/article number — flag the gap with ⚠️ instead.

### Multi-platform instruction layering

This repo already serves more than one assistant surface, and the layering matters if you're asked to touch any of these files:

- **`AGENTS.md`** (repo root) — the cross-tool rules file, read natively by Antigravity (rules since IDE 1.20.5) and by OpenAI Codex/ChatGPT's coding surface. Claude Code does **not** read `AGENTS.md` natively — this `CLAUDE.md` pulls it in via the `@AGENTS.md` import above so it doesn't have to be duplicated. Keep `AGENTS.md` itself as pointers, not full instructions — its own text says so.
- **`docs/system-instructions/escritorio-cgov.md`** — the Claude Cowork **project** instructions (paste into the Cowork project's instruction field). The Cowork project is linked to the CGOV folder on Google Drive, **not** this repo; §3 of that file maps the skills' `local/...` paths to the Drive layout and points to the published read-only copy of `docs/`.
- **`docs/system-instructions/analista-governanca.md`** (v3.0, ~1,200 lines) — a **self-contained** system-instructions document with the normative base (Art. 37 full text, risk-methodology tables, AIR/ARR non-incidência vs. dispensa distinction, etc.) internalized inline, for assistants with **no file access** at all (Gemini Gems, ChatGPT GPTs/Projects). It exists precisely because a prior version assumed the model "knew" ICMBio's internal norms and it silently invented plausible-but-wrong details (decision-log §11.6 calls this out explicitly as the lesson learned). If you edit governance facts anywhere in this repo, this file is a second place they need to stay in sync — it does not re-read the rest of the repo at runtime.
- **`docs/system-instructions/analista-processos-sei.md`** — companion instructions for SEI process triage, integrated with the above.

### Sigla (acronym) discipline

CGOV governance work depends on strictly not confusing similarly-named instruments. This is fixed vocabulary, not house style — get it wrong and a citation in a real Nota Técnica is wrong: **PGR** = Programa de Gestão para Resultados e Inovação (Portaria nº 1.572/2023, Art. 37-VIII); **PGRI** = Política de Gestão de Riscos e Integridade (Portaria nº 255/2020, Art. 37-IX); **PGD** = Programa de Gestão e Desempenho / teletrabalho (IN ICMBio nº 14/2025, Art. 37-VII); **PGE** = Política de Gestão Estratégica, Portaria nº 768/2020 — **revoked**, do not cite as current (decision-log §14.2).

### Conventions (from `CONTRIBUTING.md`)

- New skills/docs: lowercase, hyphen-separated names.
- New process workspaces only under `local/analyses/`, named `SEI_<numero-sem-barras>_<apelido-curto>/`.
- Superseded versions go to `archive/` — never delete them.
- No personal data, matrículas, SEI drafts, or non-redistributable source copies in anything destined for `docs/` or `skills/` (those are the publishable/public paths).
