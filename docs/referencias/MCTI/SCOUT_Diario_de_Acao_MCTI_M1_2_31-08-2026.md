# SCOUT — DIÁRIO DE AÇÃO
## Projeto Avaliativo M1.2 — Base Pública MCTI

### MARCO DE CONTINUIDADE — 31/08/2026

## 1. OBJETIVO DO PROJETO

O SCOUT é o projeto maior. O M1.2 é a entrega concreta do curso que estamos aproveitando para construir a primeira peça real, verificável e reutilizável do SCOUT.

A intenção é que o projeto avaliativo não seja um trabalho descartável, mas funcione como um primeiro laboratório da engrenagem do SCOUT.

A sequência de trabalho definida é:

> **FONTE → ENTENDIMENTO → MODELAGEM/DW → AED → TRATAMENTO → VISUALIZAÇÃO → DOCUMENTAÇÃO → GITHUB**

---

## 2. POR QUE A BASE MCTI?

Escolhemos a base **Indicadores Nacionais de Ciência, Tecnologia e Inovação — MCTI** porque ela permite trabalhar com séries históricas, múltiplos indicadores e possíveis relações entre indicadores.

O objetivo não é simplesmente produzir um dashboard sobre CT&I.

A base MCTI será usada como **primeiro ambiente de experimentação da engrenagem do SCOUT**:

> **Fonte pública → coleta → tratamento → modelagem → análise → visualização → documentação → evidência**

A pergunta analítica definitiva ainda não foi escolhida. Ela deverá surgir/refinar-se a partir da exploração da base real.

Uma pergunta central em observação é:

> **Quando uma mudança aparece em um indicador, quanto tempo leva para essa mudança aparecer em outros indicadores relacionados?**

Essa pergunta permanece como hipótese de trabalho, não como decisão definitiva.

---

## 3. O QUE JÁ FOI FEITO

### Fonte

Base pública do MCTI localizada e documentada.

Arquivo principal:

`INDICADORES_CeT_PUB_2025.xlsx`

Também estão disponíveis na pasta `data`:

- `INDICADORES_CeT_PUB_2025` — JSON
- `INDICADORES_CeT_PUB_2025.RData`
- `INDICADORES_CeT_PUB_2025` — Excel

### Estrutura do Excel

Identificamos 7 abas:

1. `METODOLOGIA`
2. `INDICADORES`
3. `TABELAS`
4. `INDICADORES_VALOR`
5. `TABELA_UF`
6. `TABELA_UNIVERSIDADE`
7. `ESTUDO`

---

## 4. INVESTIGAÇÃO REALIZADA HOJE

### 4.1 Aba `INDICADORES`

A aba foi observada diretamente no Excel.

Identificamos as seguintes colunas:

- `INDICADOR`
- `DESCRICAO_INDICADOR`
- `TIPO_INDICADOR`
- `GRUPO_INDICADOR`
- `FONTE_INDICADOR`
- `ELABORACAO_INDICADOR`
- `NOTAS_ESPECIFICAS`
- `LINK_NOTAS_METODOLOGICAS`

A leitura inicial indica que `INDICADORES` funciona como uma estrutura de **descrição/metadados dos indicadores**, e não como a tabela principal de valores.

Também foram observados códigos de indicadores com diferentes recortes embutidos no próprio código, incluindo referências a regiões e estados.

Exemplos observados:

- `DISP_EST_CT_REG_N`
- `DISP_EST_CT_REG_NE`
- `DISP_EST_CT_REG_SE`
- `DISP_EST_CT_REG_S`
- `DISP_EST_CT_REG_CO`

Também aparecem códigos aparentemente específicos por UF.

### Observação importante

Isso reforça que **não devemos assumir antecipadamente** que toda a granularidade seja simplesmente:

> `ANO + INDICADOR → VALOR`

Essa relação continua sendo uma **hipótese a validar**.

---

## 5. ABA `INDICADORES_VALOR`

Estrutura observada:

| Coluna | Conteúdo |
|---|---|
| `ANO` | ano do indicador |
| `INDICADOR` | código do indicador |
| `VALOR` | valor numérico |

Exemplos observados no início da tabela:

`2000 | DISP_NAC_PD_OREX | 934930000`

`2000 | DISP_NAC_PD_ENSU | 3211400000`

Também foram observados registros de anos posteriores.

### Quantidade observada

A tabela possui:

- linha 1: cabeçalho;
- último registro observado: linha **72.088**;
- aproximadamente **72.087 registros de dados**;
- último ano observado na extremidade da tabela: **2024**.

A estrutura `ANO | INDICADOR | VALOR` permanece até o final observado.

---

## 6. RELAÇÃO CENTRAL EM INVESTIGAÇÃO

A relação candidata identificada é:

```text
INDICADORES
     │
     │ INDICADOR
     ↓
INDICADORES_VALOR
```

Interpretação inicial:

**`INDICADORES`**
→ explica o que é o indicador.

**`INDICADORES_VALOR`**
→ registra o valor do indicador em determinado ano.

Essa relação é central para a futura modelagem, mas ainda não vamos definir o Star Schema.

---

## 7. O QUE AINDA PRECISAMOS VALIDAR

A principal questão técnica neste momento é:

> **Qual é a granularidade real de cada registro?**

Precisamos verificar, especialmente em `INDICADORES_VALOR`:

1. se cada combinação `ANO + INDICADOR` aparece uma única vez;
2. se existem duplicidades;
3. quantos indicadores existem;
4. quantos anos existem;
5. se todos os indicadores aparecem durante todo o período;
6. se alguns códigos incorporam recortes geográficos ou outras dimensões;
7. se o significado/tipo de `VALOR` é uniforme ou varia conforme o indicador.

---

## 8. PRÓXIMA AÇÃO

### AÇÃO 01 — VALIDAR GRANULARIDADE

A próxima investigação será verificar se existe mais de um registro para a mesma combinação:

> **`ANO + INDICADOR`**

A ferramenta escolhida para começar essa investigação será uma **Tabela Dinâmica no LibreOffice Calc**, sem alterar a fonte original.

Objetivo:

> descobrir se a combinação `ANO + INDICADOR` funciona como uma chave/granularidade única ou se existem repetições que indiquem uma estrutura mais complexa.

---

## 9. REGRA DE TRABALHO

**Não alterar a fonte original durante a investigação.**

Ainda NÃO:

- limpar os dados;
- excluir registros;
- transformar campos;
- definir a tabela fato definitiva;
- definir todas as dimensões;
- construir o Star Schema;
- fazer AED;
- criar gráficos;
- escolher definitivamente o recorte analítico.

Primeiro:

> **entender a fonte → validar granularidade → entender relacionamentos → só então modelar.**

---

## 10. STATUS DO SCOUT

### 🟢 CONCLUÍDO

- Fonte pública localizada.
- Base MCTI selecionada.
- Base documentada.
- Arquivos organizados no projeto.
- Excel inspecionado.
- 7 abas identificadas.
- `INDICADORES` parcialmente mapeada.
- `INDICADORES_VALOR` identificado e inspecionado.
- Estrutura inicial e relação central identificadas.
- Aproximadamente 72.087 registros de dados observados em `INDICADORES_VALOR`.

### 🟡 EM INVESTIGAÇÃO

- Granularidade real.
- Duplicidade de `ANO + INDICADOR`.
- Recortes embutidos nos códigos dos indicadores.
- Relacionamentos entre as demais estruturas.
- Recorte analítico definitivo.

### 🔴 AINDA NÃO INICIADO

- Modelagem do DW.
- AED.
- Tratamento.
- Visualizações.
- Documentação final.
- Versionamento/finalização do projeto no GitHub.

---

## 11. MARCADOR PARA RETOMADA

**PARAR POR HOJE AQUI.**

Próximo retorno ao SCOUT:

> **Abrir `INDICADORES_VALOR` e validar a granularidade `ANO + INDICADOR` usando Tabela Dinâmica, sem alterar a fonte.**

Depois dessa validação:

> **→ investigar relacionamentos e recortes → desenhar o Star Schema → seguir para AED.**

---

## 12. PRINCÍPIO DO PROJETO

> **O SCOUT não deve forçar os dados a responder uma pergunta escolhida previamente. A exploração da base deverá ajudar a revelar o recorte analítico.**

O MCTI é o primeiro laboratório.

O M1.2 é a primeira entrega.

O objetivo maior é começar a construir a engrenagem do SCOUT.
