# SCOUT — M1.2

## Evolução do dispêndio estadual em Ciência, Tecnologia e Inovação em Santa Catarina

> Primeiro laboratório de dados do SCOUT a partir de uma base pública do Ministério da Ciência, Tecnologia e Inovação (MCTI).

**Status:** em desenvolvimento

![SCOUT — Radar Tecnológico](imagens/scout_radar.jpeg)

---

## 1. Sobre o SCOUT

O SCOUT é um projeto de investigação orientado por dados, concebido para observar mudanças ao longo do tempo e construir uma engrenagem reutilizável de coleta, estruturação, análise e comunicação de evidências.

O Projeto Avaliativo M1.2 representa a primeira peça concreta e verificável dessa proposta.

Neste ciclo, uma base pública do Ministério da Ciência, Tecnologia e Inovação (MCTI) é utilizada como laboratório de experimentação.

O objetivo deste M1.2 não é construir o SCOUT inteiro, mas aplicar sua lógica em um recorte real de dados públicos.

A pesquisa permanece aberta à exploração da fonte. O recorte analítico apresentado neste projeto corresponde ao segundo recorte definido a partir da investigação da base.

---

## 2. Pergunta de investigação

### Como evoluiu o dispêndio estadual em Ciência, Tecnologia e Inovação em Santa Catarina ao longo do tempo?

O recorte foi definido a partir da exploração da estrutura da base e da identificação de indicadores relacionados ao dispêndio estadual em Ciência, Tecnologia e Inovação.

A escolha de Santa Catarina delimita o primeiro laboratório analítico sem impedir que o SCOUT seja posteriormente ampliado para outras Unidades da Federação, regiões, indicadores e relações temporais.

---

## 3. Fonte dos dados

**Instituição:** Ministério da Ciência, Tecnologia e Inovação — MCTI

**Base:** Indicadores Nacionais de Ciência, Tecnologia e Inovação

**Arquivo utilizado:**

`INDICADORES_CeT_PUB_2025.xlsx`

A base disponibilizada pelo MCTI contém diferentes estruturas relacionadas a indicadores, valores, unidades da federação, universidades, estudos e metadados.

No arquivo analisado foram identificadas sete abas:

- `METODOLOGIA`
- `INDICADORES`
- `TABELAS`
- `INDICADORES_VALOR`
- `TABELA_UF`
- `TABELA_UNIVERSIDADE`
- `ESTUDO`

---

## 4. Entendimento da fonte

A investigação inicial identificou duas estruturas centrais para o modelo analítico.

### `INDICADORES`

Contém os metadados dos indicadores:

- `INDICADOR`
- `DESCRICAO_INDICADOR`
- `TIPO_INDICADOR`
- `GRUPO_INDICADOR`
- `FONTE_INDICADOR`
- `NOTAS_ESPECIFICAS`
- `ELABORACAO_INDICADOR`
- `LINK_NOTAS_METODOLOGICAS`

Essa estrutura permite interpretar o significado dos indicadores e contextualizar seus valores.

### `INDICADORES_VALOR`

Contém os valores históricos:

- `ANO`
- `INDICADOR`
- `VALOR`

A relação direta identificada entre as duas estruturas é:

`INDICADORES.INDICADOR → INDICADORES_VALOR.INDICADOR`

Assim, a dimensão do indicador fornece o contexto semântico, enquanto a tabela fato registra os valores observados ao longo do tempo.

---

## 5. Granularidade

Foi realizada uma verificação de duplicidade utilizando a combinação:

`ANO + INDICADOR`

Resultado:

**0 duplicidades encontradas.**

A combinação `ANO + INDICADOR` foi, portanto, validada como a granularidade adotada para a tabela fato deste ciclo.

> **Grão:** um indicador em um determinado ano.

A métrica armazenada na tabela fato é:

`VALOR`

---

## 6. Uma particularidade importante da base

Os códigos dos indicadores podem incorporar o próprio recorte geográfico.

Exemplos identificados:

- `DISP_EST_CT_REG_N`
- `DISP_EST_CT_REG_NE`
- `DISP_EST_CT_REG_SE`
- `DISP_EST_CT_REG_S`
- `DISP_EST_CT_REG_CO`

Também existem códigos específicos por Unidade da Federação.

Essa característica é importante para a interpretação dos indicadores e foi considerada na definição do recorte analítico.

O código do indicador pode, portanto, carregar informação contextual que não aparece como uma coluna geográfica diretamente na tabela de valores.

---

## 7. Modelo dimensional

Após a investigação da estrutura da fonte, foi definido um **Star Schema simplificado** para o M1.2.

O modelo foi deliberadamente mantido enxuto, considerando o recorte analítico e evitando adicionar estruturas que não sejam necessárias nesta etapa.

![Modelo dimensional decidido](imagens/modelo_decidido.jpeg)

### Estrutura do modelo

O modelo é composto por:

- `DIM_INDICADOR`
- `FATO_INDICADORES_VALOR`
- `DIM_ANO`

### Tabela fato

`FATO_INDICADORES_VALOR`

**Grão:**

> um indicador em um determinado ano.

**Métrica:**

`VALOR`

**Campos:**

- `ANO`
- `INDICADOR`
- `VALOR`

A chave lógica adotada é:

`ANO + INDICADOR`

---

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

A dimensão é responsável por fornecer o contexto e a descrição necessários para interpretar a métrica `VALOR`.

---

### Dimensão temporal

`DIM_ANO`

Campo:

- `ANO`

A dimensão temporal permite organizar a análise da evolução dos indicadores ao longo dos anos.

---

## 8. Recorte analítico

**Unidade da Federação:** Santa Catarina — SC

**Tema:** dispêndio estadual em Ciência, Tecnologia e Inovação

**Dimensão temporal:** ano

O recorte foi definido como uma forma de transformar a exploração ampla da fonte em uma investigação analítica delimitada.

A delimitação não representa o encerramento da pesquisa sobre a base.

Ela representa o recorte utilizado neste laboratório do M1.2.

---

## 9. Metodologia

O projeto segue a cadeia:

**Fonte → Entendimento → Modelagem/DW → AED → Tratamento → Visualização → Documentação → GitHub**

A investigação é orientada pelo princípio:

> **pergunta → dado → estrutura → consulta → análise → evidência → interpretação**

A intenção é construir as análises a partir da pergunta de investigação, evitando a produção de visualizações sem uma questão analítica associada.

A pesquisa sobre a fonte continua durante o desenvolvimento do projeto. Novas descobertas poderão ser documentadas quando forem relevantes para a compreensão dos dados e para a análise.

---

## 10. Tecnologias

- Excel / LibreOffice Calc — inspeção inicial da fonte
- SQLite — estruturação e consulta dos dados
- Beekeeper Studio — exploração SQL
- SQL — consultas analíticas
- Python
- Pandas — tratamento e análise
- Seaborn — visualização
- Git / GitHub — versionamento e documentação

---

## 11. Consultas e análise

A etapa de SQL será utilizada para:

- relacionar a tabela fato à dimensão de indicadores;
- filtrar o recorte analítico;
- organizar a série temporal;
- realizar agregações quando pertinentes;
- investigar variações;
- produzir consultas analíticas relacionadas à pergunta de investigação.

Recursos de SQL avançado, como CTEs e funções de janela, serão utilizados quando contribuírem efetivamente para a análise, sem introduzir complexidade apenas para demonstrar recurso técnico.

---

## 12. AED — Análise Exploratória de Dados

A análise exploratória deverá observar, entre outros aspectos:

- quantidade de registros;
- quantidade de indicadores;
- período disponível;
- valores ausentes;
- estatísticas descritivas;
- distribuição dos valores;
- comportamento temporal;
- variações relevantes;
- possíveis valores atípicos ou comportamentos que exijam investigação.

Eventuais comportamentos atípicos serão investigados antes de qualquer decisão de tratamento.

---

## 13. Visualização

A visualização será orientada pela pergunta de investigação.

A primeira visualização analítica deverá representar a evolução temporal do dispêndio estadual em Ciência, Tecnologia e Inovação em Santa Catarina.

Outras visualizações poderão ser incorporadas caso contribuam para responder à pergunta ou aprofundar a interpretação dos dados.

---

## 14. Tratamento dos dados

O tratamento será realizado somente após o entendimento da estrutura e da análise exploratória.

As transformações deverão ser documentadas para preservar a rastreabilidade entre:

**fonte original → dado tratado → análise → evidência**

A fonte original não será alterada.

---

## 15. Estrutura conceitual do projeto

O M1.2 materializa uma primeira aplicação da engrenagem do SCOUT:

```text
FONTE
  ↓
ENTENDIMENTO
  ↓
MODELAGEM / DW
  ↓
AED
  ↓
TRATAMENTO
  ↓
VISUALIZAÇÃO
  ↓
DOCUMENTAÇÃO
  ↓
GITHUB