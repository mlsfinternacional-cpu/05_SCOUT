# SCOUT — DIÁRIO DE AÇÃO
## Projeto Avaliativo M1.2 — Base Pública MCTI

### 1. NORTE DO PROJETO

O SCOUT está sendo construído como nosso projeto avaliativo final do M1.2, aproveitando a oportunidade para fazer algo que também possa se tornar uma primeira peça real de portfólio.

A solicitação do módulo é:

- escolha de uma base pública;
- construção/modelagem em Data Warehouse;
- AED — Análise Exploratória de Dados;
- tratamento dos dados da fonte;
- criação de visualizações;
- documentação do projeto;
- utilização correta do Git/GitHub.

A sequência adotada é:

> **FONTE → ENTENDIMENTO → MODELAGEM/DW → AED → TRATAMENTO → VISUALIZAÇÃO → DOCUMENTAÇÃO → GITHUB**

---

## 2. BASE PÚBLICA ESCOLHIDA

Escolhemos o **MCTI — Ministério da Ciência, Tecnologia e Inovação**.

Fonte:

**Indicadores Nacionais de Ciência, Tecnologia e Inovação — CT&I**

A base foi baixada no pacote:

`INDICADORES_CTI_PUB_2025.zip`

O próprio README/Leia-me informa que os indicadores agregam dados de diversas fontes e permitem análises sobre o sistema nacional de Ciência, Tecnologia e Inovação.

---

## 3. ORGANIZAÇÃO DO PROJETO

O projeto está estruturado no VS Code como:

`05_Scout_Observatorio_Projeto_Avaliativo_Modulo_1_Semana_14`

Já temos:

- `.venv`
- `data`
- `docs`
  - `referencias`
    - `FAPESC`
    - `MCTI`
- `imagens`
- arquivos/documentação do SCOUT
- Git iniciado no projeto.

Criamos também a documentação da fonte:

`docs/referencias/MCTI/SCOUT_base_publica_MCTI.md`

Nela já registramos:

- instituição;
- tema inicial;
- objetivo da busca;
- premissas da avaliação;
- links consultados;
- referência à base pública;
- documentação/metadados da fonte.

---

## 4. O QUE FIZEMOS COM A BASE

Extraímos o pacote MCTI e colocamos os arquivos relevantes dentro de:

`data`

Neste momento, a pasta `data` contém os três formatos principais:

- `INDICADORES_CeT_PUB_2025` → JSON
- `INDICADORES_CeT_PUB_2025.RData` → RData
- `INDICADORES_CeT_PUB_2025` → Excel

Os materiais auxiliares do pacote foram direcionados para a área de documentação/referência do projeto, enquanto os dados de trabalho permanecem em `data`.

---

## 5. LEITURA INICIAL DA METODOLOGIA

Abrimos o Excel.

O arquivo possui **7 abas**:

1. `METODOLOGIA`
2. `INDICADORES`
3. `TABELAS`
4. `INDICADORES_VALOR`
5. `TABELA_UF`
6. `TABELA_UNIVERSIDADE`
7. `ESTUDO`

A própria metodologia explica que existem dois conjuntos principais:

### `INDICADORES`

Contém o conjunto de indicadores disponibilizados pela COICT/MCTI.

Entre os campos aparecem informações como:

- `INDICADOR`
- `DESCRICAO_INDICADOR`
- `TIPO_INDICADOR`
- `GRUPO_INDICADOR`
- `FONTE_INDICADOR`
- notas;
- informações metodológicas.

### `INDICADORES_VALOR`

Contém os valores dos indicadores por ano.

Estrutura observada:

`ANO | INDICADOR | VALOR`

A própria documentação informa que a coluna `INDICADOR` de `INDICADORES_VALOR` se relaciona com a coluna `INDICADOR` da tabela `INDICADORES`.

**Essa é uma descoberta importante para a futura modelagem.**

---

## 6. OUTRAS ESTRUTURAS IDENTIFICADAS

### `TABELA_UF`

Encontramos:

- UF;
- sigla;
- região;
- sigla da região;
- nomenclaturas auxiliares.

Exemplo:

`Santa Catarina → SC → Sul → S`

Isso indica uma possível dimensão geográfica, mas **ainda não decidimos como ela entrará no DW**.

### `TABELA_UNIVERSIDADE`

Encontramos informações como:

- sigla;
- nome da universidade;
- tipo;
- UF;
- região.

Também ainda não decidimos seu papel definitivo na modelagem.

### `TABELAS`

Contém informações de tabelas/indicadores disponibilizados pelo MCTI, incluindo:

- ID;
- tabela;
- indicador;
- conversão;
- status;
- último ano;
- descrição etc.

### `ESTUDO`

A aba foi identificada, mas **ainda não investigamos sua função suficientemente para tomar qualquer decisão sobre ela**.

---

## 7. PRIMEIRA OBSERVAÇÃO SOBRE A GRANULARIDADE

Na aba `INDICADORES_VALOR`, observamos registros como:

`2000 | DISP_NAC_PD_OREX | 934930000`

`2000 | DISP_NAC_PD_ENSU | 3211400000`

`2001 | ...`

Isso sugere inicialmente uma estrutura:

> **ANO + INDICADOR → VALOR**

Mas atenção:

### ISSO AINDA É UMA HIPÓTESE A SER VALIDADA.

Ainda não verificamos se todos os indicadores seguem exatamente essa granularidade ou se alguns códigos incorporam outros recortes, como UF, região ou outros elementos.

Por isso, **não vamos modelar o DW ainda**.

---

## 8. O QUE NÃO FIZEMOS AINDA

Ainda NÃO:

- limpamos os dados;
- transformamos os dados;
- eliminamos registros;
- definimos a tabela fato definitiva;
- definimos todas as dimensões;
- construímos o Star Schema;
- fizemos AED;
- criamos gráficos;
- escolhemos definitivamente o recorte analítico.

Isso é proposital.

Estamos seguindo a lógica:

> **primeiro entender a fonte → depois decidir o modelo.**

---

## 9. DECISÃO DE MÉTODO

O primeiro movimento será investigativo.

Não queremos começar pelo gráfico.

Queremos descobrir:

- o que é uma linha;
- qual é a chave;
- qual é a granularidade;
- como as tabelas se relacionam;
- que recorte analítico essa base permite fazer.

Só depois disso vamos desenhar o DW.

---

# PRÓXIMA AÇÃO — MARCO DO DIÁRIO

## AÇÃO 01 — MAPEAR A ESTRUTURA DA BASE

**Objetivo:** fazer o inventário técnico das tabelas antes da modelagem.

Para cada aba, levantar:

1. nome da tabela;
2. número de linhas;
3. número de colunas;
4. nomes das colunas;
5. tipo aparente de cada campo;
6. possíveis chaves;
7. campos repetidos;
8. relacionamentos com outras tabelas;
9. granularidade aparente;
10. campos que podem funcionar como dimensões.

### Primeira prioridade

`INDICADORES`

↕  
`INDICADORES_VALOR`

Porque essa parece ser a relação central da base.

### Depois

- `TABELA_UF`
- `TABELA_UNIVERSIDADE`
- `TABELAS`
- `ESTUDO`

---

## Pergunta técnica que abre o próximo MK

> **Qual é a estrutura real de cada tabela e qual é a granularidade de cada registro?**

A partir dessa resposta:

**→ desenhar o Star Schema do SCOUT.**

---

## MARCADOR DE CONTINUIDADE

**STATUS ATUAL: 🟢 FONTE LOCALIZADA + DOCUMENTADA + PRIMEIRA LEITURA REALIZADA**

**PRÓXIMO MARCO: 🔴 INVENTÁRIO + GRANULARIDADE + RELACIONAMENTOS**

**Não avançar para tratamento/modelagem antes dessa etapa.**
