---
name: cgov-transcrever-normativos
description: >
  Extrai, transcreve, revisa e grava em Markdown atos normativos disponíveis
  como PDF no acervo local da CGOV/ICMBio. Use quando o usuário pedir OCR,
  transcrição fidedigna, conversão para texto legível por máquina, criação de
  arquivo .md ao lado de Lei, Decreto, Portaria, Instrução Normativa,
  Resolução ou outro ato em local/normative-sources, inclusive em lote. Inclui
  inspeção da camada textual, OCR local em português, preservação de artigos,
  anexos, tabelas e redações revogadas, segunda revisão visual e controle de
  qualidade antes da gravação final. Não acione para simples interpretação
  jurídica, resumo, comparação de versões, pesquisa de norma na internet ou
  redação de Nota Técnica sem pedido de transcrição do PDF.
metadata:
  criado_em: "2026-08-29"
  status: "fonte canônica"
---

# cgov-transcrever-normativos — PDFs normativos para Markdown verificável

Converta cada PDF indicado pelo usuário em um arquivo Markdown fidedigno,
legível por máquina e auditável. O **PDF local é a fonte de controle**: versões
oficiais em HTML ou texto servem para conferência independente, mas nunca para
substituir silenciosamente a edição, a consolidação ou os erros materiais
visíveis no PDF.

## Limites e segurança

- Trabalhe apenas nos PDFs colocados em escopo pelo usuário. Para pedidos sobre
  a pasta inteira, separe atos normativos de livros, guias e normas técnicas;
  processe os atos ainda sem `.md` e reporte os demais itens fora do escopo.
- Mantenha PDFs, páginas renderizadas, OCR e rascunhos em ambiente local. Nunca
  envie `local/normative-sources/` ou documentos internos a serviços externos.
- Use `local/analyses/normative-transcription/<data-hora>-<slug>/` para páginas,
  OCR, rascunhos e relatório de revisão. Esse material permanece fora do Git.
- Grave o resultado definitivo em `local/normative-sources/`, com o mesmo nome
  base do PDF e extensão `.md`.
- Se já existir um `.md` correspondente, não o sobrescreva sem pedido explícito
  de atualização. Compare as versões e preserve o arquivo anterior até a
  aprovação da substituição.
- Não altere, renomeie nem regrave o PDF de origem.
- Não transforme erro aparente do ato em correção editorial. Preserve grafia,
  numeração, repetição e erro material visíveis e explique-os na nota editorial.

## 1. Precheck e inventário

1. Leia as instruções do projeto e confirme o destino autorizado.
2. Execute `skills/thematic/cgov-transcrever-normativos/scripts/inventory_normative_sources.py`
   para relacionar PDFs,
   arquivos Markdown existentes, páginas e hashes quando solicitados.
3. Registre para cada PDF: total de páginas, tamanho, existência de `.md`, tipo
   de publicação e provável natureza da camada textual.
4. Antes de editar, confira `git status`. Não toque em alterações alheias; o
   diretório `local/` deve continuar ignorado pelo Git.

## 2. Diagnóstico da extração

Tente primeiro a extração direta. Considere a camada textual inadequada quando
estiver vazia, muito menor que o conteúdo visível, fora de ordem, formada por
códigos de glifos ou incapaz de preservar caracteres e palavras. Nesses casos:

1. renderize todas as páginas, normalmente a 250–300 dpi;
2. execute OCR em `pt-BR`; em Windows, use
   `skills/thematic/cgov-transcrever-normativos/scripts/ocr_windows.ps1` sobre
   as imagens renderizadas;
3. mantenha a ordem das páginas e, no rascunho de trabalho, a referência de
   origem de cada trecho;
4. inspecione visualmente tabelas, carimbos, textos tachados, notas marginais e
   anexos que o OCR possa omitir.

Se a capacidade de PDF disponível no ambiente oferecer renderização ou OCR,
ela pode ser usada. Prefira sempre processamento local para o acervo interno.

## 3. Transcrição em Markdown

Produza um arquivo por ato. Use UTF-8 e este frontmatter mínimo:

```yaml
---
ato: "[tipo do ato]"
numero: "[número]"
data: "AAAA-MM-DD"
fonte_pdf: "[nome exato do PDF]"
formato: "transcrição em Markdown"
revisado_em: "AAAA-MM-DD"
---
```

Após o frontmatter, inclua uma nota editorial curta informando que o Markdown
transcreve o conteúdo visível, preserva erros materiais do original e corrige
somente falhas atribuíveis à extração/OCR.

Regras estruturais:

- título do ato em um único `#`;
- capítulos em `##` e seções em `###`;
- artigo, parágrafo, inciso e alínea em parágrafos separados;
- assinaturas e metadados de publicação preservados;
- anexos integralmente identificados;
- tabelas convertidas para Markdown sem perder linhas, valores ou unidades;
- cabeçalhos com `rowspan` ou `colspan` achatados em nomes compostos explícitos,
  sem deslocar os dados;
- redação visivelmente revogada ou tachada representada por `~~texto~~`, com a
  anotação de revogação/alteração mantida;
- não inserir numeração, vigência, redação consolidada ou nota que não conste
  do PDF.

Uma fonte oficial primária pode esclarecer um caractere ou trecho duvidoso.
Compare a edição e a data: se o texto oficial estiver consolidado de modo
diferente do PDF, registre a divergência e mantenha o PDF como transcrição.

## 4. Segunda revisão independente

Separe a produção da conferência. Na segunda passagem, revise a partir das
páginas renderizadas, sem presumir que o rascunho está correto.

Confira, página por página:

- título, ementa, preâmbulo, artigos e sequência dos dispositivos;
- números, datas, remissões, siglas, nomes próprios e assinaturas;
- sinais de ordinal, parágrafos, incisos e alíneas;
- continuidade de frases interrompidas por mudança de página;
- anexos, quadros e somatórios;
- textos tachados, redações anteriores e notas de vigência;
- cabeçalhos e rodapés que pertençam à publicação;
- páginas em branco, evitando tratá-las como conteúdo ausente.

Registre no workspace local quais páginas foram conferidas e os erros de OCR
corrigidos. Quando houver dúvida material não resolvida pela imagem nem por
fonte primária equivalente, marque `[trecho ilegível no PDF]`; nunca adivinhe.

## 5. Barreira de qualidade e gravação

Execute
`skills/thematic/cgov-transcrever-normativos/scripts/qa_transcription.py` para
cada par PDF/Markdown ainda no workspace. A gravação definitiva só ocorre
quando não houver erro bloqueante.

Além das verificações automáticas, confirme manualmente:

- cobertura de todas as páginas e sequência completa dos artigos;
- equivalência visual das tabelas e anexos;
- ausência de modernização ou correção silenciosa do texto-fonte;
- um `.md` final para cada PDF concluído.

Depois da aprovação:

1. copie o rascunho revisado para `local/normative-sources/<mesmo-stem>.md`;
2. compare os hashes do rascunho e do arquivo final;
3. confirme UTF-8 válido, zero caracteres `U+FFFD` e PDF original intacto;
4. confirme que o arquivo final continua ignorado pelo Git;
5. remova apenas imagens e arquivos temporários gerados nesta execução, após
   validar o caminho exato. Preserve o relatório de revisão se o usuário pedir
   trilha de auditoria.

## Resultado a apresentar

Informe os arquivos criados com links locais, a quantidade de páginas
revisadas, o método usado por arquivo, as validações executadas e os aparentes
erros materiais do original que foram deliberadamente preservados. Diferencie
claramente transcrição concluída, dúvida residual e arquivo não processado.
