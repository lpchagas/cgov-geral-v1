# Contribuição e manutenção

## Convenções

- Use nomes em minúsculas, separados por hífen, para skills e documentos novos.
- Crie workspaces apenas em `local/analyses/` no formato
  `SEI_<numero-sem-barras>_<apelido-curto>/`.
- Mantenha versões supersedidas em `archive/`; não as apague.

## Mudanças em skills

1. Altere a fonte em `skills/cgov-nt/` ou `skills/thematic/`.
2. Atualize ou execute os evals aplicáveis.
3. Confirme que instruções, exemplos e caminhos ativos permanecem coerentes.
4. Registre a decisão e o resultado em `docs/governance/decision-log.md`.
5. Se a skill estiver instalada fora do repositório, reinstale-a e atualize o
   snapshot de referência somente após confirmar a versão instalada.

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
