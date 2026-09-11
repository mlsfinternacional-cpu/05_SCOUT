# Análise do Dispêndio em Ciência, Tecnologia e Inovação em Santa Catarina

## Análise exploratória de dados públicos

![Fluxo da análise](imagens/Fluxo_da_analise.jpeg)

> Projeto avaliativo do Módulo 1 — Visualização de Dados e Business Intelligence.

Este repositório apresenta uma análise exploratória de dados públicos sobre o dispêndio estadual em Ciência, Tecnologia e Inovação (CT&I) em Santa Catarina.

O objetivo é investigar como esse dispêndio evoluiu ao longo do tempo, a partir de dados públicos do Ministério da Ciência, Tecnologia e Inovação (MCTI).

---

## 1. Pergunta de investigação

**Como evoluiu o dispêndio estadual em Ciência, Tecnologia e Inovação em Santa Catarina ao longo do tempo?**

**Recorte analítico:**

- **UF:** Santa Catarina — SC
- **Tema:** dispêndio estadual em Ciência, Tecnologia e Inovação
- **Dimensão temporal:** ano

---

## 1.1 Contexto de campo

Durante o desenvolvimento deste projeto, participei de uma reunião da ACIF na qual foi apresentada a política **SC Mais Inovação**, da Secretaria de Ciência, Tecnologia e Inovação de Santa Catarina.

A experiência permitiu observar, em contexto real, algumas das estratégias atualmente discutidas para o desenvolvimento da inovação no Estado, incluindo:

- desenvolvimento regional e atuação nas microrregiões;
- Centros e agentes de inovação;
- conexão entre empresas, startups, academia e governo;
- financiamento e instrumentos de apoio;
- governança e ambiente legal;
- mapeamento de demandas e oportunidades.

Essas informações **não são incorporadas à série histórica do MCTI como dados quantitativos**.

Elas são utilizadas como **contexto qualitativo para a interpretação dos resultados e dos insights**, mantendo separadas a evidência proveniente da base analisada e as observações realizadas em campo.

A intenção é aproximar duas perspectivas:

> **o que os dados públicos mostram sobre o dispêndio em CT&I**
>
> **e como a política de inovação está sendo apresentada e operacionalizada no território.**

Assim, o trabalho permanece centrado na pergunta original e na análise exploratória da base, sem transformar o projeto em uma avaliação abrangente do programa SC Mais Inovação.

---

## 2. Fonte dos dados

**Instituição:** Ministério da Ciência, Tecnologia e Inovação — MCTI

**Base:** Indicadores Nacionais de Ciência, Tecnologia e Inovação

**Arquivo:** `INDICADORES_CeT_PUB_2025.xlsx`

A base é pública e reúne indicadores e seus respectivos valores históricos.

---

## 3. Conhecimento da fonte

Antes da análise, a estrutura da base foi investigada para compreender:

- indicadores e metadados;
- valores históricos;
- relacionamentos entre as estruturas;
- granularidade dos registros;
- recortes geográfico e temporal.

Foram identificadas, entre outras, as estruturas:

- `INDICADORES`
- `INDICADORES_VALOR`

A relação entre indicador e valor histórico orientou a construção do modelo analítico.

---

## 4. Granularidade

A unidade principal da análise é:

> **um indicador em determinado ano.**

A métrica analisada é o **valor do indicador**.

A combinação `ANO + INDICADOR` foi utilizada para verificar a granularidade e possíveis duplicidades.

---

## 5. Modelagem

A partir da estrutura identificada na fonte, foi definido um **Star Schema simplificado**, adequado à pergunta de investigação.

![Modelo de dados](imagens/Modelo_decidido.jpeg)

### Modelo adotado

- `DIM_INDICADOR`
- `FATO_INDICADORES_VALOR`
- `DIM_ANO`

### Tabela fato

**FATO_INDICADORES_VALOR**

- **Grão:** um indicador em determinado ano
- **Métrica:** valor
- **Chave lógica:** `ANO + INDICADOR`

### Dimensão indicador

**DIM_INDICADOR**

Contém os atributos necessários para contextualizar e interpretar os indicadores.

### Dimensão temporal

**DIM_ANO**

Organiza a dimensão temporal para análise da evolução dos indicadores.

---

## 6. Metodologia

O fluxo da análise segue:

**Fonte → conhecimento da base → arquitetura → modelagem → SQL → análise exploratória → tratamento → visualização → insights**

Princípio orientador:

**pergunta → dado → estrutura → consulta → análise → evidência → interpretação**

A contextualização de campo entra posteriormente, após os resultados quantitativos, como apoio à interpretação:

**resultado quantitativo → contexto de campo → insight**

A observação de campo não substitui a evidência da base e não é tratada como parte da série histórica.

---

## 7. SQL

As consultas SQL são utilizadas para:

- relacionar as estruturas do modelo;
- aplicar o recorte analítico;
- organizar a série temporal;
- realizar agregações;
- investigar variações;
- produzir evidências relacionadas à pergunta de investigação.

---

## 8. Análise exploratória

A análise exploratória considera:

- quantidade de registros;
- quantidade de indicadores;
- período disponível;
- valores ausentes;
- estatísticas descritivas;
- distribuição dos valores;
- comportamento temporal;
- variações relevantes;
- possíveis valores atípicos.

---

## 9. Tratamento

O tratamento dos dados é realizado a partir dos resultados da análise exploratória.

As transformações são documentadas para preservar a rastreabilidade:

**fonte original → dado tratado → análise → evidência**

A fonte original não é alterada.

---

## 10. Visualização e Insights

As visualizações são orientadas pela pergunta de investigação.

O objetivo é identificar padrões, variações e comportamentos relevantes nos dados e transformá-los em evidências interpretáveis.

Os insights serão construídos a partir dos resultados obtidos na análise.

A experiência de campo será utilizada como **contexto para interpretação**, sem substituir os resultados quantitativos.

Uma das perguntas orientadoras nessa etapa será:

> **O que os dados mostram e o que o contexto de campo ajuda a compreender sobre esses resultados?**

---

## 11. Tecnologias

- Python
- Pandas
- SQL
- SQLite
- Excel / LibreOffice Calc
- Beekeeper Studio
- Seaborn
- Git / GitHub

---

## Estrutura do projeto

```text
05_analise_dispendio_inovacao_SC/
├── data/
├── docs/
├── imagens/
│   ├── Fluxo_da_analise.jpeg
│   └── Modelo_decidido.jpeg
├── .gitignore
├── mapa_operacional_enquadramento_avaliacao.md
└── README.md