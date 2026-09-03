# SCOUT — M1.2

## Evolução do dispêndio estadual em Ciência, Tecnologia e Inovação em Santa Catarina

> Primeiro laboratório de dados do SCOUT a partir de uma base pública do Ministério da Ciência, Tecnologia e Inovação (MCTI).

**Status:** em desenvolvimento

![SCOUT — Radar Tecnológico](imagens/scout_capa.jpeg)

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

A combinação `ANO + INDICADOR` foi validada como granularidade da tabela fato utilizada no modelo.

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

O modelo adotado para este ciclo é um **Star Schema simplificado**, composto por uma tabela fato e duas dimensões principais:

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
```

A relação entre a fato e `DIM_INDICADOR` ocorre pelo campo:

`INDICADOR`

A relação com `DIM_ANO` ocorre pelo campo:

`ANO`

O modelo é propositalmente simples porque o objetivo do M1.2 é validar a engrenagem de investigação, e não construir uma arquitetura maior do que a pergunta exige.

---

## 9. Estruturas auxiliares

As demais estruturas da fonte foram analisadas, mas não serão incorporadas automaticamente ao DW analítico.

### `TABELA_UF`

Contém informações de localização e hierarquia geográfica, como:

- UF
- sigla da UF
- região
- sigla da região
- nomenclaturas geográficas

Sua utilização será considerada quando necessária ao tratamento e à interpretação do recorte geográfico.

### `TABELA_UNIVERSIDADE`

Contém informações relacionadas a universidades e sua localização.

Neste primeiro recorte, não foi estabelecida uma relação direta suficiente para justificar sua inclusão no DW analítico.

### `TABELAS`

Estrutura relacionada à organização e rastreabilidade das tabelas de origem.

### `ESTUDO`

Estrutura relacionada a estudos, indicadores, status e informações de acompanhamento.

Essas estruturas permanecem como elementos de apoio e rastreabilidade da fonte.

---

## 10. Metodologia

O projeto seguirá a cadeia:

**Fonte → Entendimento → Modelagem/DW → AED → Tratamento → Visualização → Documentação → GitHub**

A investigação será orientada pelo princípio:

> pergunta → dado → estrutura → consulta → análise → evidência → interpretação

A intenção é evitar a construção de gráficos sem uma pergunta analítica associada.

Cada etapa deverá registrar não apenas o procedimento realizado, mas também as decisões tomadas e os motivos que as sustentam.

---

## 11. Tecnologias

- Excel / LibreOffice Calc — inspeção inicial da fonte
- SQLite — estruturação e consulta dos dados
- Beekeeper Studio — exploração SQL
- SQL — consultas e análises
- Python — tratamento e análise
- Pandas — manipulação dos dados
- Seaborn — visualização
- Git / GitHub — versionamento e documentação

---

## 12. Consultas SQL

A etapa de SQL será utilizada para explorar e organizar os dados do modelo dimensional.

Entre as operações previstas estão:

- seleção e filtragem;
- junção entre fato e dimensões;
- agregações;
- ordenação;
- comparação temporal;
- consultas analíticas.

Quando houver pertinência analítica, serão utilizadas funcionalidades de SQL mais avançadas, como CTEs e funções de janela.

A complexidade não será adicionada apenas para demonstrar recurso técnico: cada consulta deverá estar relacionada a uma necessidade da investigação.

---

## 13. Análise Exploratória de Dados — AED

A AED será realizada sobre o recorte definido para Santa Catarina.

Serão observados, entre outros aspectos:

- período disponível;
- quantidade de registros;
- quantidade de indicadores;
- valores ausentes;
- estatísticas descritivas;
- evolução temporal;
- variações relevantes;
- possíveis comportamentos atípicos.

Eventuais valores extremos ou comportamentos incomuns serão investigados antes de qualquer decisão de tratamento.

---

## 14. Visualização

A visualização será orientada pela pergunta de investigação.

A primeira visualização prevista é uma série temporal do dispêndio estadual em Ciência, Tecnologia e Inovação em Santa Catarina.

Outras visualizações poderão ser incorporadas caso contribuam efetivamente para responder à pergunta ou aprofundar a interpretação dos dados.

A intenção não é produzir um grande volume de gráficos, mas construir visualizações que funcionem como evidências da análise.

---

## 15. Tratamento dos dados

O tratamento será realizado após o entendimento da estrutura e a exploração inicial dos dados.

Serão considerados, conforme a necessidade identificada:

- tipos de dados;
- valores ausentes;
- padronização;
- recorte geográfico;
- interpretação dos indicadores;
- consistência dos valores;
- preparação para análise e visualização.

Nenhuma informação será alterada sem que exista uma justificativa metodológica documentada.

---

## 16. Resultados

Esta seção será preenchida após a execução das análises.

Os resultados deverão apresentar:

- evolução temporal observada;
- principais variações;
- estatísticas relevantes;
- comportamentos atípicos eventualmente identificados;
- evidências obtidas por SQL e Python;
- interpretação dos achados.

O objetivo é diferenciar **o que os dados mostram** da **interpretação construída a partir deles**.

---

## 17. Etapas do projeto

- [x] Localização da base pública
- [x] Inspeção da estrutura da fonte
- [x] Identificação das abas
- [x] Investigação da relação entre indicadores e valores
- [x] Validação da granularidade `ANO + INDICADOR`
- [x] Definição do recorte em Santa Catarina
- [x] Definição do modelo dimensional
- [ ] Criação do banco SQLite
- [ ] Carga dos dados
- [ ] Consultas SQL
- [ ] SQL avançado quando pertinente
- [ ] AED
- [ ] Tratamento dos dados
- [ ] Visualizações
- [ ] Interpretação dos resultados
- [ ] Consolidação da documentação
- [ ] Finalização do repositório

---

## 18. Estrutura prevista do projeto

```text
05_SCOUT/
│
├── README.md
│
├── imagens/
│   ├── scout_capa.jpeg
│   └── Modelo_conceitual_010826.jpeg
│
├── dados/
│   └── ...
│
├── sql/
│   └── ...
│
├── notebooks/
│   └── ...
│
└── docs/
    └── ...
```

A estrutura poderá evoluir conforme as etapas técnicas forem desenvolvidas.

---

## 19. SCOUT além do M1.2

O M1.2 constitui um primeiro laboratório do SCOUT.

A partir deste ciclo, a metodologia poderá ser ampliada para outros estados, regiões, indicadores e relações temporais.

O objetivo de longo prazo do SCOUT é construir uma estrutura reutilizável para investigar mudanças, relações e possíveis defasagens entre fenômenos a partir de diferentes fontes e indicadores.

Neste primeiro laboratório, entretanto, a prioridade é:

**fazer a engrenagem funcionar, documentá-la e validar o caminho.**

---

## 20. Autoria

**Maria Laura Corrêa da Silva**

Projeto Avaliativo — M1.2

**SCOUT — Projeto de investigação orientado por dados.**