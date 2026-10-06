import fs from 'node:fs/promises';
import path from 'node:path';
import { pathToFileURL } from 'node:url';
import os from 'node:os';
// pdfjs-dist: defina PDFJS_PATH ou instale com `npm install --prefix ~/.local/share/cgov-tools pdfjs-dist`
const PDFJS = process.env.PDFJS_PATH ?? path.join(os.homedir(), '.local/share/cgov-tools/node_modules/pdfjs-dist/legacy/build/pdf.mjs');
const pdfjsLib = await import(pathToFileURL(PDFJS).href);

const [rootArg, outArg] = process.argv.slice(2);
if (!rootArg || !outArg) throw new Error('uso: node transcribe_normative_batch.mjs <origem> <saida>');
const root = path.resolve(rootArg), out = path.resolve(outArg);
await fs.mkdir(out, { recursive: true });
const entries = (await fs.readdir(root, { withFileTypes: true }))
  .filter(e => e.isFile() && e.name.toLowerCase().endsWith('.pdf'))
  .sort((a,b) => a.name.localeCompare(b.name, 'pt-BR'));
const isoDate = (stem) => {
  const m = stem.match(/^(\d{4})(\d{2})(\d{2})/);
  return m ? `${m[1]}-${m[2]}-${m[3]}` : '';
};
const kind = (stem) => {
  const m = stem.match(/\b(Lei|Decreto|Portaria(?:\s+Conjunta)?|Resolução|Instrução Normativa|Medida Provisória|Deliberação)\b/i);
  return m ? m[1] : 'Ato normativo';
};
const number = (stem) => {
  const m = stem.match(/\b(?:Lei|Decreto|Portaria|Resolução|Instrução Normativa|Medida Provisória|Deliberação)\s+(?:n[ºo°]?\s*)?([\d.]+(?:[-/]\d{4})?)/i);
  return m ? m[1] : '';
};
for (const entry of entries) {
  const pdfName = entry.name, stem = pdfName.slice(0, -4), pdfPath = path.join(root, pdfName);
  const data = new Uint8Array(await fs.readFile(pdfPath));
  const doc = await pdfjsLib.getDocument({ data }).promise;
  const pages = [];
  for (let n = 1; n <= doc.numPages; n++) {
    const page = await doc.getPage(n);
    const content = await page.getTextContent();
    const text = content.items.map(i => i.str).join(' ').replace(/\s+([,.;:])/g, '$1').replace(/ {2,}/g, ' ').trim();
    pages.push({ page: n, text });
  }
  await fs.writeFile(path.join(out, `${stem}.pages.json`), JSON.stringify({ pdf: pdfName, pages }, null, 2), 'utf8');
  const body = pages.map(p => `<!-- Página ${p.page} -->\n\n${p.text}\n`).join('\n');
  const md = `---\nato: "${kind(stem)}"\nnumero: "${number(stem)}"\ndata: "${isoDate(stem)}"\nfonte_pdf: "${pdfName}"\nformato: "transcrição em Markdown"\nrevisado_em: "2026-08-29"\n---\n\n> Nota editorial: esta transcrição reproduz o conteúdo visível do PDF, preserva grafias e eventuais erros materiais do original e corrige somente falhas atribuíveis à extração. A conferência página a página está registrada no relatório desta execução.\n\n# ${stem}\n\n${body}`;
  await fs.writeFile(path.join(out, `${stem}.md`), md, 'utf8');
}
console.log(`rascunhos gerados: ${entries.length}`);
