# SCOUT — M1.2
## Evolução do dispêndio estadual em Ciência, Tecnologia e Inovação em Santa Catarina

> Primeiro laboratório de dados do SCOUT a partir de uma base pública do
> Ministério da Ciência, Tecnologia e Inovação (MCTI).

![Conceito visual do SCOUT](imagens/conceito.jpeg)

---

## 1. Sobre o SCOUT

O SCOUT é um projeto de investigação orientado por dados, concebido para
observar mudanças ao longo do tempo e construir uma engrenagem reutilizável
de coleta, estruturação, análise e comunicação de evidências.

O Projeto Avaliativo M1.2 representa a primeira peça concreta e verificável
dessa proposta.

Neste primeiro ciclo, a base pública de Indicadores Nacionais de Ciência,
Tecnologia e Inovação (CT&I), do MCTI, é utilizada como laboratório de
experimentação.

O objetivo não é construir o SCOUT inteiro, mas aplicar sua lógica em um
recorte real de dados públicos.

---

## 2. Pergunta de investigação

### Como evoluiu o dispêndio estadual em Ciência, Tecnologia e Inovação
### em Santa Catarina ao longo do tempo?

O recorte foi definido após a exploração da estrutura da base, considerando
a disponibilidade de indicadores estaduais e de séries históricas.

O projeto concentra a análise em Santa Catarina para manter o primeiro
ciclo do SCOUT suficientemente delimitado, sem perder a possibilidade de
expansão futura para outras Unidades da Federação.

---

## 3. Fonte dos dados

**Instituição:** Ministério da Ciência, Tecnologia e Inovação — MCTI

**Base:** Indicadores Nacionais de Ciência, Tecnologia e Inovação

**Arquivo utilizado:**

`INDICADORES_CeT_PUB_2025.xlsx`

A base disponibilizada pelo MCTI contém diferentes estruturas relacionadas
a indicadores, valores, unidades da federação, universidades, estudos e
metadados.

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

A investigação inicial identificou duas estruturas centrais:

### `INDICADORES`

Contém os metadados dos indicadores, incluindo:

- `INDICADOR`
- `DESCRICAO_INDICADOR`
- `TIPO_INDICADOR`
- `GRUPO_INDICADOR`
- `FONTE_INDICADOR`
- `ELABORACAO_INDICADOR`
- `NOTAS_ESPECIFICAS`
- `LINK_NOTAS_METODOLOGICAS`

### `INDICADORES_VALOR`

Contém os valores históricos:

- `ANO`
- `INDICADOR`
- `VALOR`

A relação central observada é:

`INDICADORES.INDICADOR → INDICADORES_VALOR.INDICADOR`

A primeira estrutura explica o indicador; a segunda registra seu valor
em determinado ano.

---

## 5. Granularidade

Foi realizada uma verificação de duplicidade utilizando `ANO + INDICADOR`.

Resultado:

**0 duplicidades encontradas.**

Assim, `ANO + INDICADOR` foi validado como candidata à granularidade da
tabela fato utilizada no modelo.

---

## 6. Uma particularidade importante da base

Os códigos dos indicadores podem incorporar o próprio recorte geográfico.

Exemplos:

- `DISP_EST_CT_REG_N`
- `DISP_EST_CT_REG_NE`
- `DISP_EST_CT_REG_SE`
- `DISP_EST_CT_REG_S`
- `DISP_EST_CT_REG_CO`

Também existem códigos específicos por Unidade da Federação.

Essa característica foi considerada na definição do recorte e no tratamento
dos dados.

---

## 7. Modelo dimensional

Após a investigação da estrutura da fonte, foi definido um **Star Schema
simplificado** para o M1.2.

O modelo foi deliberadamente mantido enxuto, considerando o recorte analítico
e evitando adicionar estruturas que não sejam necessárias nesta etapa.

![Modelo dimensional decidido](imagens/modelo_decidido.jpeg)

### Tabela fato

`FATO_INDICADORES_VALOR`

**Grão:**

> um indicador em um determinado ano.

**Métrica:**

`VALOR`

Campos:

- `ANO`
- `INDICADOR`
- `VALOR`

### Dimensão indicador

`DIM_INDICADOR`

Campos:

- `INDICADOR`
- `DESCRICAO_INDICADOR`
- `TIPO_INDICADOR`
- `GRUPO_INDICADOR`
- `FONTE_INDICADOR`
- `NOTAS_ESPECIFICAS`
- `ELABORACAO_INDICADOR`
- `LINK_NOTAS_METODOLOGICAS`

### Dimensão temporal

`DIM_ANO`

Campo:

- `ANO`

### Relações

A relação direta identificada entre a dimensão de indicadores e a tabela
fato ocorre por meio de:

`DIM_INDICADOR.INDICADOR → FATO_INDICADORES_VALOR.INDICADOR`

A dimensão temporal se relaciona à tabela fato por:

`DIM_ANO.ANO → FATO_INDICADORES_VALOR.ANO`

O recorte geográfico em Santa Catarina está presente no próprio código dos
indicadores selecionados, conforme a estrutura identificada na fonte.

---

## 8. Recorte analítico

**Unidade da Federação:** Santa Catarina (SC)

**Tema:** dispêndio estadual em Ciência, Tecnologia e Inovação

**Dimensão temporal:** ano

O recorte permite investigar a evolução histórica do indicador e aplicar
consultas analíticas, tratamento, AED e visualizações.

---

## 9. Metodologia

O projeto seguirá a cadeia:

**Fonte → Entendimento → Modelagem/DW → AED → Tratamento →
Visualização → Documentação → GitHub**

A investigação será orientada pelo princípio:

> pergunta → dado → estrutura → consulta → análise → evidência → interpretação

A intenção é evitar a construção de gráficos sem uma pergunta analítica
associada.

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

## 11. Etapas do projeto

- [x] Localização da base pública
- [x] Inspeção da estrutura da fonte
- [x] Identificação das tabelas/abas
- [x] Investigação da relação entre indicadores e valores
- [x] Validação da granularidade `ANO + INDICADOR`
- [x] Definição do recorte em Santa Catarina
- [x] Definição do modelo dimensional conceitual
- [ ] Modelagem lógica
- [ ] Criação do banco SQLite
- [ ] Consultas SQL
- [ ] SQL avançado
- [ ] Tratamento dos dados
- [ ] AED
- [ ] Visualizações
- [ ] Interpretação dos resultados
- [ ] Consolidação da documentação
- [ ] Publicação/finalização no GitHub

---

## 12. Resultados

*Seção a ser preenchida após a execução das análises.*

Serão apresentados:

- evolução temporal do dispêndio;
- principais variações observadas;
- estatísticas descritivas;
- eventuais comportamentos atípicos;
- evidências obtidas por SQL e Python;
- interpretação dos resultados.

---

## 13. Próximos passos

1. Validar a modelagem lógica a partir do modelo conceitual.
2. Criar o banco SQLite.
3. Carregar os dados tratados.
4. Executar as primeiras consultas SQL.
5. Realizar a AED.
6. Construir as visualizações.
7. Consolidar os achados.
8. Finalizar a documentação e o repositório.

---

## 14. SCOUT além do M1.2

O M1.2 constitui um primeiro laboratório do SCOUT.

A arquitetura e o processo desenvolvidos neste projeto poderão futuramente
ser ampliados para outros estados, regiões, indicadores e relações
temporais.

O objetivo de longo prazo do SCOUT é transformar diferentes fontes e
indicadores em uma estrutura capaz de apoiar investigações sobre mudanças,
relações e possíveis defasagens entre fenômenos.