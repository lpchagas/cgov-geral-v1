# Contribuição e manutenção

## Convenções

- Use nomes em minúsculas, separados por hífen, para skills e documentos novos.
- Workspaces de processos são criados pelo fluxo operacional (Cowork) em
  `local/analyses/` (link para o Drive), no formato
  `SEI_<numero-sem-barras>_<apelido-curto>/`. Testes de desenvolvimento vão
  para `local/pilots/`.
- Mantenha versões supersedidas em `archive/`; não as apague.

## Mudanças em skills

1. Altere a fonte em `skills/cgov-nt/` ou `skills/thematic/`.
2. Atualize ou execute os evals aplicáveis.
3. Confirme que instruções, exemplos e caminhos ativos permanecem coerentes.
4. Registre a decisão e o resultado em `docs/governance/decision-log.md`.
5. Após o commit, rode `bash scripts/publicar-operacao.sh` e reinstale no
   Claude as skills que o script listar (pacotes em `dist/skills/`). Ver
   [`docs/fluxos-de-trabalho.md`](docs/fluxos-de-trabalho.md).

## Espelho para a Antigravity — `.agents/skills/`

A Antigravity carrega skills de `.agents/skills/<nome>/SKILL.md`, não de
`skills/`. `.agents/skills/` é um espelho gerado, ignorado pelo Git — nunca
edite os arquivos ali diretamente. Sempre que um `SKILL.md` em
`skills/cgov-nt/` ou `skills/thematic/` for alterado, regenere a cópia
correspondente em `.agents/skills/` antes da próxima sessão na Antigravity:

```bash
cp skills/<família>/<skill>/SKILL.md .agents/skills/<skill>/SKILL.md
```

Ver `docs/multiplatform.md` para o mapeamento completo de qual aplicativo lê
qual arquivo.

## Revisão antes de publicar

Não inclua dados pessoais, matrículas, rascunhos, dados de pesquisa, documentos
SEI internos ou cópias de fontes sem autorização de redistribuição. Use links
oficiais no catálogo normativo; materiais locais devem permanecer em `local/`.
