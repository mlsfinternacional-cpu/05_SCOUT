# SCOUT — M1.2

## Evolução do dispêndio estadual em Ciência, Tecnologia e Inovação em Santa Catarina

> Primeiro laboratório de dados do SCOUT a partir de uma base pública do Ministério da Ciência, Tecnologia e Inovação (MCTI).

**Status:** em desenvolvimento

---

## 1. Sobre o SCOUT

O SCOUT é um projeto de investigação orientado por dados, concebido para observar mudanças ao longo do tempo e construir uma engrenagem reutilizável de coleta, estruturação, análise e comunicação de evidências.

O Projeto Avaliativo M1.2 representa a primeira peça concreta e verificável dessa proposta.

Neste primeiro ciclo, uma base pública do Ministério da Ciência, Tecnologia e Inovação (MCTI) é utilizada como laboratório de experimentação.

O objetivo deste M1.2 não é construir o SCOUT inteiro, mas aplicar sua lógica em um recorte real de dados públicos.

---

## 2. Pergunta de investigação

### Como evoluiu o dispêndio estadual em Ciência, Tecnologia e Inovação em Santa Catarina ao longo do tempo?

O recorte foi definido após a exploração da estrutura da base, considerando a existência de indicadores estaduais e de séries históricas.

A escolha por Santa Catarina mantém o primeiro ciclo do SCOUT delimitado e permite desenvolver a cadeia completa de investigação antes de ampliar o projeto para outros recortes.

---

## 3. Fonte dos dados

**Instituição:** Ministério da Ciência, Tecnologia e Inovação — MCTI

**Base:** Indicadores Nacionais de Ciência, Tecnologia e Inovação

**Arquivo utilizado:**

`INDICADORES_CeT_PUB_2025.xlsx`

A fonte contém diferentes estruturas relacionadas a indicadores, valores, unidades da federação, universidades, estudos e metadados.

No arquivo analisado foram identificadas sete abas:

- `METODOLOGIA`
- `INDICADORES`
- `TABELAS`
- `INDICADORES_VALOR`
- `TABELA_UF`
- `TABELA_UNIVERSIDADE`
- `ESTUDO`

A fonte original é preservada e não é alterada durante a investigação.

---

## 4. Entendimento da fonte

A investigação inicial identificou duas estruturas centrais para o recorte analítico.

### `INDICADORES`

Contém os metadados dos indicadores, incluindo:

- `INDICADOR`
- `DESCRICAO_INDICADOR`
- `TIPO_INDICADOR`
- `GRUPO_INDICADOR`
- `FONTE_INDICADOR`
- `NOTAS_ESPECIFICAS`
- `ELABORACAO_INDICADOR`
- `LINK_NOTAS_METODOLOGICAS`

Essa estrutura permite compreender o significado e as características de cada indicador.

### `INDICADORES_VALOR`

Contém os valores históricos:

- `ANO`
- `INDICADOR`
- `VALOR`

A relação direta identificada entre as estruturas é:

`INDICADORES.INDICADOR → INDICADORES_VALOR.INDICADOR`

Assim, a tabela de metadados explica o indicador e a tabela de valores registra sua ocorrência ao longo do tempo.

---

## 5. Granularidade

Foi realizada uma verificação de duplicidade utilizando a combinação:

`ANO + INDICADOR`

Resultado:

**0 duplicidades encontradas.**

A combinação `ANO + INDICADOR` foi, portanto, validada como candidata à granularidade da tabela fato utilizada no modelo.

### Granularidade definida

> Um indicador em um determinado ano.

### Métrica

`VALOR`

---

## 6. Particularidade geográfica da fonte

Uma característica importante identificada durante a investigação é que o recorte geográfico pode estar incorporado ao próprio código do indicador.

Foram observados, por exemplo:

- `DISP_EST_CT_REG_N`
- `DISP_EST_CT_REG_NE`
- `DISP_EST_CT_REG_SE`
- `DISP_EST_CT_REG_S`
- `DISP_EST_CT_REG_CO`

Também existem códigos específicos relacionados às Unidades da Federação.

Essa característica foi considerada na definição do recorte analítico e deverá ser tratada na etapa de modelagem e tratamento dos dados.

Para este M1.2, o recorte escolhido é:

**Santa Catarina (SC).**

---

## 7. Modelo dimensional

Após a investigação da estrutura da fonte, foi definido um **Star Schema simplificado** para o M1.2.

O modelo foi deliberadamente mantido enxuto, considerando o recorte analítico e evitando adicionar estruturas que não sejam necessárias nesta etapa.

![Modelo dimensional decidido](imagens/Modelo_conceitual_010826.jpeg)

### Tabela fato

`FATO_INDICADORES_VALOR`

**Granularidade:**

> um indicador em um determinado ano.

**Métrica:**

`VALOR`

**Campos:**

- `ANO`
- `INDICADOR`
- `VALOR`

A tabela fato concentra os valores utilizados na análise.

### Dimensão indicador

`DIM_INDICADOR`

Campos provenientes da estrutura `INDICADORES`:

- `INDICADOR`
- `DESCRICAO_INDICADOR`
- `TIPO_INDICADOR`
- `GRUPO_INDICADOR`
- `FONTE_INDICADOR`
- `NOTAS_ESPECIFICAS`
- `ELABORACAO_INDICADOR`
- `LINK_NOTAS_METODOLOGICAS`

A dimensão indicador fornece o contexto necessário para interpretar a métrica `VALOR`.

### Dimensão temporal

`DIM_ANO`

Campo:

- `ANO`

A dimensão temporal permite estruturar a análise da evolução dos indicadores ao longo dos anos.

---

## 8. Decisão de modelagem

O modelo adotado para este ciclo é:

```text
             DIM_INDICADOR
                   |
                   |
                   v
        FATO_INDICADORES_VALOR
                   ^
                   |
                   |
                DIM_ANO