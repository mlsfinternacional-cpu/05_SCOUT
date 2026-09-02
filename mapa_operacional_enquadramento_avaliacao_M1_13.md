# SCOUT — Mapa de Enquadramento do Projeto Avaliativo

> Documento de trabalho para orientar a construção do Scout a partir dos conteúdos da formação e manter o projeto alinhado ao escopo da avaliação.

## 1. O que estamos construindo

O **Scout** será desenvolvido como um projeto individual de investigação e análise de dados, utilizando uma **base pública do MCTI** como fonte.

A proposta é aproveitar o projeto avaliativo para construir algo que, além de atender aos requisitos da formação, possa evoluir como projeto documentado de portfólio.

> **Não construir o Scout depois da avaliação; construir o Scout já dentro do escopo da avaliação.**

## 2. Escopo identificado na Semana 13

**Projeto Individual:** projeto avaliativo relacionado a Python e Visualização.

**Entrega:**
- escolha de base pública em DW;
- AED;
- tratamento de dados da fonte;
- criação de visualizações;
- documentação do projeto;
- utilização correta do GitHub para versionamento.

Esse enunciado passa a ser a **régua principal de enquadramento do Scout**.

# 3. Mapa de conteúdos → Scout

## Semana 8 — Modelagem Dimensional

**Conteúdos:** DW; OLTP × OLAP; ETL/ELT; Star Schema; Snowflake; fatos e dimensões; PK/FK; normalização; escolha entre Star e Snowflake.

**Aplicação no Scout:** investigar primeiro a estrutura real da base MCTI e só então avaliar entidades, campos, chaves, relações, fatos/dimensões e a adequação a Star Schema ou Snowflake.

**Decisão:** não definir previamente Star ou Snowflake. A escolha será derivada da estrutura dos dados e da necessidade analítica.

## Semana 9 — SQL para DW

**Conteúdos:** `SELECT`, `WHERE`, `ORDER BY`, `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `SUM`, `COUNT`, `AVG`, `HAVING`, `DATE_TRUNC`, `EXTRACT`.

**Aplicação no Scout:** transformar perguntas analíticas em consultas.

> **pergunta → dados necessários → relacionamento → query → resultado → interpretação**

SQL será ferramenta de investigação, não apenas exercício.

## Semana 10 — SQL Avançado e Performance

**Conteúdos:** subconsultas; CTEs (`WITH`); Window Functions; `ROW_NUMBER()`; `RANK()`; `SUM() OVER()`; índices; otimização; partitioning; materialized views.

**Aplicação no Scout:** utilizar técnicas avançadas quando houver necessidade analítica real, por exemplo para organizar consultas complexas, rankings, acumulados e comparações.

**Princípio:** não inserir técnicas apenas para cumprir checklist.

## Semana 11 — Análise e Visualização

**Conteúdos:** AED; padrões e anomalias; média; mediana; desvio padrão; quartis; boxplots; histogramas; Pandas Profiling; Sweetviz.

**Aplicação no Scout:**

**dados tratados → exploração → distribuição → padrões → anomalias → hipóteses/insights**

Outliers não serão automaticamente removidos; primeiro serão investigados e interpretados.

## Semana 12 — Visualização com Seaborn

**Conteúdos:** correlações; heatmaps; linha; barra; dispersão; customização; subplots; layouts; exportação.

**Aplicação no Scout:** visualizações destinadas a comunicar os achados da investigação, incluindo comparações, tendências, relações entre variáveis e correlações.

As ferramentas e técnicas serão usadas quando agregarem valor analítico.

# 4. Cadeia técnica do Scout

```text
BASE PÚBLICA MCTI
       ↓
EXCEL (.xlsx)
       ↓
INVESTIGAÇÃO DA ESTRUTURA
       ↓
MODELAGEM
(Star Schema / Snowflake)
       ↓
BANCO SQLITE
       ↓
BEEKEEPER STUDIO
       ↓
SQL
       ↓
SQL AVANÇADO
       ↓
PYTHON / PANDAS
       ↓
AED
       ↓
SEABORN / VISUALIZAÇÕES
       ↓
INSIGHTS
       ↓
DOCUMENTAÇÃO
       ↓
GITHUB
```

## 5. Natureza da fonte

A fonte original é um **arquivo Excel (.xlsx) do MCTI**, com dados estruturados em formato tabular.

Distinção importante:
- Excel = fonte tabular original;
- SQLite = banco para investigação;
- Beekeeper Studio = ambiente de exploração e SQL;
- Star/Snowflake = modelagem a ser definida após investigação.

> **MCTI → Excel → estruturação/modelagem → SQLite → SQL → análise**

## 6. Pergunta de investigação

A pergunta final **ainda não será fechada antes da exploração da base**.

Primeiro:
1. conhecer a base;
2. identificar abas/tabelas e colunas;
3. verificar relações;
4. avaliar qualidade e disponibilidade;
5. compreender quais perguntas podem ser respondidas;
6. definir o recorte analítico.

> **Primeiro investigamos a base. Depois deixamos a base nos dizer o que o Scout pode investigar.**

## 7. Princípio metodológico

> **pergunta → dado → estrutura → consulta → análise → evidência → interpretação**

E não:

> **gráfico → procurar uma história depois.**

## 8. Enquadramento acadêmico

| Competência | Evidência no Scout |
|---|---|
| Modelagem dimensional | Estruturação e justificativa do modelo |
| SQL | Queries documentadas |
| SQL avançado | CTEs, subconsultas e/ou Window Functions quando pertinentes |
| Tratamento | Preparação e transformação |
| Python | Pandas e análise |
| AED | Estatística descritiva, padrões e anomalias |
| Visualização | Gráficos e análises com Seaborn |
| Documentação | README e documentação metodológica |
| GitHub | Versionamento e organização |

## 9. Estratégia para a avaliação

**Semana 8:** entender e estruturar.  
**Semana 9:** consultar.  
**Semana 10:** aprofundar consultas.  
**Semana 11:** explorar e analisar.  
**Semana 12:** visualizar.  
**Semana 13:** consolidar e entregar.

Assim, o projeto avaliativo será o **resultado acumulado da aplicação prática dos conteúdos**.

## 10. README — etapa posterior

O README será produzido depois que a investigação estiver organizada.

Deverá apresentar, entre outros:
- o que é o Scout;
- problema/pergunta;
- contexto e origem da base MCTI;
- natureza dos dados;
- estrutura/modelagem;
- tratamento;
- metodologia;
- queries relevantes;
- AED;
- visualizações;
- principais achados;
- ferramentas;
- organização do projeto;
- versionamento.

A documentação deverá explicar **raciocínio e decisões**, não apenas listar ferramentas.

## 11. Próximo movimento

### 1. Destrinchar a base MCTI
- abrir o arquivo;
- identificar abas/tabelas;
- verificar colunas e tipos;
- verificar chaves e relações;
- avaliar qualidade.

### 2. Definir a modelagem
- avaliar Star Schema;
- avaliar Snowflake;
- justificar a escolha.

### 3. Criar o ambiente
- SQLite;
- Beekeeper Studio;
- queries iniciais.

### 4. Definir perguntas do Scout

### 5. Aplicar SQL + Python + AED + visualização

### 6. Consolidar documentação e GitHub

# 12. Status

**🟢 ESCOPO MADURO**

Já temos:
- fonte pública: **MCTI**;
- formato: **Excel**;
- direção: **DW / Star / Snowflake**;
- banco considerado: **SQLite**;
- ferramenta SQL: **Beekeeper Studio**;
- sequência de conteúdos: **Semanas 8–13**;
- enquadramento explícito na avaliação;
- intenção de documentar e versionar no GitHub.

Ainda não definidos:
- pergunta final;
- modelo dimensional definitivo;
- estrutura final do banco;
- queries finais;
- indicadores;
- visualizações;
- conclusões.

> **Primeiro investigamos. Depois modelamos. Depois consultamos. Depois analisamos. Depois comunicamos.**
