---
name: cgov-nt-07-conclusao
description: >
  Sétima e última etapa da suíte canônica cgov-nt: redige o Capítulo 5 —
  Conclusão, Proposição e Encaminhamentos — de QUALQUER Nota Técnica da
  CGOV/ICMBio, com síntese diagnóstica quantificada, posicionamento técnico
  assertivo, proposição formal e bloco de assinaturas. Use ao invocar
  /cgov-nt-07, "conclusão da NT", "capítulo 5", "encaminhamentos",
  "fechar a nota técnica", "finalizar o parecer". Requer que todos os
  capítulos anteriores aplicáveis (cgov-nt-03 a cgov-nt-06, conforme o roteiro
  definido em `NT_ESTADO.md`, em `local/analyses/SEI_[processo]_[apelido]/`) já
  estejam concluídos.
---

# cgov-nt-07 — Capítulo 5: Conclusão, Proposição e Encaminhamentos

## PRÉ-EXECUÇÃO OBRIGATÓRIA

1. **Localização do `NT_ESTADO.md`:** o arquivo do processo em análise vive em
   `local/analyses/SEI_[processo]_[apelido]/NT_ESTADO.md` — não na raiz do
   projeto. Identifique a subpasta pelo processo SEI mencionado nesta
   conversa; se houver apenas um processo com triagem em andamento sob
   `local/analyses/`, use-o diretamente. Se houver mais de um e não for possível
   identificar o processo pelo contexto, pergunte ao usuário antes de
   prosseguir.
2. Leia `NT_ESTADO.md` por completo — roteiro de execução, achados
   consolidados (com contagem por prioridade) e recomendações formuladas.
3. **Pré-requisito de conteúdo:** confira, no roteiro do `NT_ESTADO.md`, que
   todas as etapas marcadas como "necessárias" na triagem (`cgov-nt-01`)
   estão de fato concluídas. Se alguma etapa obrigatória estiver pendente,
   interrompa e liste o que falta antes de redigir a conclusão — **a
   conclusão nunca deve ser redigida antes do Quadro Consolidado de Achados**.
4. A conclusão deve ser **assertiva e propositiva**, não uma reprodução do que
   já foi dito. Deve posicionar-se claramente sobre o mérito da análise.
5. Aplique o Padrão de Redação CGOV (`cgov-nt-03`).

## FORMATO DE SAÍDA

> Formato validado por piloto contra NT real protocolada (nº 20/2026/CGOV):
> capítulo com numeração reiniciada (`### 5.1`, não `#### 5.1`), proposição em
> algarismos romanos minúsculos entre parênteses — (i), (ii), (iii) — e
> encaminhamentos em lista com o destinatário em negrito, não em algarismos
> romanos maiúsculos. Este padrão substitui o que constava de versões
> anteriores desta skill.

```
## 5. CONCLUSÃO E PROPOSIÇÃO

### 5.1. Síntese diagnóstica.
[Um a dois parágrafos: total de achados, distribuição por eixo temático e por
prioridade (Urgente/Prioritário/Desejável) — usar os números exatos
registrados em NT_ESTADO.md pelo Capítulo 3. Tom objetivo e quantificado,
citando percentuais/índices relevantes já calculados nos capítulos anteriores.]

### 5.2. Conclusão técnica.
[Posicionamento assertivo, adaptado à natureza do objeto analisado:
- Se minuta normativa: apta ou não para publicação, com quais condicionantes?
- Se consulta interna: quais direcionamentos a alta gestão deve adotar, e a
  quais riscos institucionais a manutenção do texto atual expõe a Autarquia?
- Se governança institucional: a proposta está em conformidade, não
  conformidade, ou conformidade condicionada?
1 a 2 parágrafos em prosa direta, sem reabrir a análise já feita nos capítulos
anteriores.]

### 5.3. Proposição.
Ante o exposto, esta Coordenação de Governança **PROPÕE**:

(i) [ação 1, com referência à recomendação/tabela do Capítulo 4, se aplicável];

(ii) [ação 2]; e

(iii) [ação 3].

### 5.4. Encaminhamentos.

- À **[destinatário 1]**: [ação, objeto, referência aos itens desta NT];
- À **[destinatário 2]**: [ação, objeto]; e
- Ao **Processo SEI nº [número]**: juntada da presente Nota Técnica para
  instrução dos autos.

---

À consideração superior.

[Nome Completo]
[Cargo] — CGOV/ICMBio

[Nome Completo]
Coordenador(a) de Governança — CGOV/ICMBio

[Nome Completo]
Coordenador(a)-Geral de Governança e Gestão Estratégica — CGGE/ICMBio
```

**Regras de redação obrigatórias:**
- Síntese quantificada: usar os números reais de achados/prioridades — nunca
  aproximar ou arredondar sem indicar que é aproximação.
- Proposição em algarismos romanos minúsculos entre parênteses — (i), (ii),
  (iii); encaminhamentos em lista com o nome do destinatário em negrito.
- Bloco de assinaturas sem matrícula SIAPE (preenchida manualmente no SEI).
- Não gerar arquivo `.docx`.

## REGRA ESPECIAL — CONCLUSÃO DIVIDIDA

Se os achados apontarem em direções conflitantes (ex.: parte da equipe técnica
recomenda uma solução e os dados de consulta apontam outra), não force um
consenso artificial na Seção 5.2: explicite a divergência e proponha, na
Seção 5.3, que a decisão final seja submetida à instância superior com as
duas alternativas tecnicamente descritas.

## PÓS-EXECUÇÃO

Atualize `NT_ESTADO.md` (na subpasta localizada na Pré-execução): `NT
concluída em [data]. Pronta para revisão final e tramitação no SEI.` Sugira
ao usuário revisar o documento consolidado (concatenação de todos os
capítulos gerados pela suíte) antes da tramitação.

## ENCADEAMENTO

```
/cgov-nt-04 → [/cgov-nt-05] → [/cgov-nt-06] → /cgov-nt-07 (esta skill — etapa final)
```
