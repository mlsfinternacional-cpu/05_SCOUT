# SCOUT — Garimpo e Base Pública MCTI

## 1. Garimpo da fonte

### Objetivo

Localizar, inspecionar e selecionar a base pública que será utilizada no Projeto Avaliativo M1.2 e que poderá constituir o primeiro laboratório de dados do SCOUT.

A seleção deve considerar as premissas informadas para a avaliação:

- base pública;
- Data Warehouse / estruturação para análise;
- AED;
- tratamento dos dados da fonte;
- visualizações;
- documentação;
- versionamento no GitHub.

                    SCOUT
                      │
          ┌───────────┴───────────┐
          │                       │
    PROJETO MAIOR            M1.2 — ENTREGA
                              │
                              ↓
                    BASE PÚBLICA MCTI
                              │
                              ↓
                     ENTENDER A FONTE
                              │
                              ↓
                       MODELAR / DW
                              │
                              ↓
                         AED
                              │
                              ↓
                   TRATAMENTO DOS DADOS
                              │
                              ↓
                       VISUALIZAÇÕES
                              │
                              ↓
                       DOCUMENTAÇÃO
                              │
                              ↓
                         GITHUB

### Fonte de busca

**Instituição:** Ministério da Ciência, Tecnologia e Inovação — MCTI

**Tema inicial:** Indicadores Nacionais de Ciência, Tecnologia e Inovação — CT&I

### Links consultados

- **Portal principal:** [https://www.gov.br/mcti/pt-br/acesso-a-informacao/dados-abertos/dados-abertos/paginas/indicadores-nacionais-de-ciencia-tecnologia-e-inovacao?utm_source=chatgpt.com]
- **Página de Dados Abertos:** [https://www.gov.br/mcti/pt-br/acesso-a-informacao/dados-abertos/dados-abertos/arquivos/indicadores_cti/INDICADORES_CTI_PUB_2025.zip/view?utm_source=chatgpt.com]
- **Página da base:** [colar link]
- **Arquivo/download:** [colar link]
- **Documentação/metadados:** [colar link]
- **Publicação relacionada:** [colar link]

> Os links são registrados como parte da rastreabilidade da fonte e permitem recuperar posteriormente a origem dos dados, a documentação e os critérios utilizados na seleção da base.

### Caminho do garimpo

#### Etapa 1 — Localização

- [ ] Acessar o portal oficial
- [ ] Localizar a área de Dados Abertos
- [ ] Localizar os Indicadores Nacionais de CT&I
- [ ] Identificar arquivos e conjuntos de dados disponíveis

#### Etapa 2 — Inventário das fontes encontradas

| Arquivo / conjunto | Formato | Período | Conteúdo aparente | Observações |
|---|---|---|---|---|
| | | | | |

#### Etapa 3 — Inspeção

Para cada possibilidade encontrada, observar:

- período disponível;
- quantidade de registros;
- quantidade de colunas;
- dimensões disponíveis;
- indicadores;
- granularidade;
- existência de identificadores;
- tipos de dados;
- valores ausentes;
- duplicidades;
- possibilidade de relacionamento entre tabelas;
- possibilidade de construção de modelo dimensional;
- potencial para AED;
- potencial para visualizações.

### Critérios de escolha

A base deverá ser capaz de sustentar:

**Fonte pública → tratamento → modelagem → AED → pergunta → visualização → documentação**

A escolha definitiva não será feita apenas pelo tema da base, mas pela capacidade dos dados de sustentar uma pergunta analítica e uma visualização coerente.

### Registro das decisões

#### Data

[preencher]

#### Fonte consultada

[preencher]

#### O que encontrei

[preencher]

#### O que parece promissor

[preencher]

#### O que descartei e por quê

[preencher]

#### Próximo passo

[preencher]

---

## 2. Base escolhida

**Indicadores Nacionais de Ciência, Tecnologia e Inovação — MCTI**

A base do Ministério da Ciência, Tecnologia e Inovação reúne indicadores de diferentes fontes para representar a evolução do sistema brasileiro de Ciência, Tecnologia e Inovação (CT&I).

A escolha desta base para o SCOUT é estratégica porque permite trabalhar com **séries históricas, múltiplas dimensões e relações entre indicadores**, criando um primeiro laboratório para a proposta de observar mudanças ao longo do tempo.

## 3. Fontes oficiais

- [Indicadores Nacionais de CT&I — MCTI](https://www.gov.br/mcti/pt-br/acesso-a-informacao/dados-abertos/dados-abertos/paginas/indicadores-nacionais-de-ciencia-tecnologia-e-inovacao)
- [Dados da edição 2025 — MCTI](https://www.gov.br/mcti/pt-br/acesso-a-informacao/dados-abertos/dados-abertos/arquivos/indicadores_cti/INDICADORES_CTI_PUB_2025.zip/view)
- [Indicadores Nacionais de CT&I — publicação 2025](https://www.gov.br/mcti/pt-br/acompanhe-o-mcti/indicadores/paginas/publicacoes/arquivos/indicadores_cti_2025.pdf)
- [Página de Indicadores do MCTI](https://www.gov.br/mcti/pt-br/acompanhe-o-mcti/indicadores)

## 4. Formatos disponíveis

A página de dados abertos do MCTI disponibiliza os indicadores em diferentes formatos, incluindo:

- Excel
- RDATA
- JSON

Essa variedade permite experimentar diferentes caminhos de ingestão e tratamento de dados ao longo do desenvolvimento do SCOUT.

## 5. Por que esta base?

A base foi escolhida porque permite praticar, dentro do projeto avaliativo do curso:

- seleção e compreensão de uma fonte pública;
- exploração e análise exploratória dos dados (AED);
- tratamento e preparação da fonte;
- construção de visualizações;
- documentação e versionamento no GitHub;
- primeiros passos de uma estrutura histórica e analítica para o SCOUT.

O objetivo não é construir o SCOUT inteiro neste momento, mas fazer do projeto avaliativo um **primeiro laboratório verificável do projeto**.

## 6. Perguntas candidatas para o SCOUT

As perguntas abaixo são hipóteses de trabalho. A pergunta definitiva será escolhida depois da exploração da base.

### Recursos e evolução

- Como evoluíram os investimentos brasileiros em Ciência, Tecnologia e Inovação ao longo do tempo?
- Quais dimensões de CT&I apresentaram maior crescimento ou retração?

### Recursos humanos

- Como evoluiu a formação e disponibilidade de recursos humanos relacionados à ciência e tecnologia?
- Quais áreas apresentam mudanças mais significativas ao longo da série histórica?

### Produção científica

- O crescimento dos recursos destinados à CT&I acompanha o crescimento da produção científica brasileira?
- Existem períodos em que os indicadores se movimentam em direções diferentes?

### Inovação

- Como os indicadores de inovação evoluíram em relação aos investimentos em Pesquisa e Desenvolvimento?
- Quais indicadores apresentam mudanças mais persistentes?

### Comparação

- Como a trajetória brasileira se compara à de outros países ou grupos de países, quando a base permitir essa análise?

### Pergunta central em observação

> **Quando uma mudança aparece em um indicador, quanto tempo leva para essa mudança aparecer em outros indicadores relacionados?**

Essa pergunta é especialmente relevante para o SCOUT porque desloca o foco de uma fotografia isolada para a **observação de mudanças, relações e defasagens ao longo do tempo**.

## 7. Relação com o SCOUT

O primeiro ciclo pensado é:

**Fonte pública → coleta → tratamento → modelagem → análise → visualização → documentação → evidência**

A base do MCTI funciona, portanto, como o primeiro ambiente de experimentação da engrenagem do SCOUT.

A intenção é que o projeto avaliativo não seja um trabalho descartável: ele deve produzir uma primeira peça reutilizável e ampliar progressivamente a capacidade técnica necessária para o SCOUT.

## 8. Próximos passos

1. Baixar e inspecionar os arquivos da base.
2. Identificar tabelas, dimensões, períodos e indicadores disponíveis.
3. Escolher um recorte viável para o projeto avaliativo.
4. Formular a pergunta analítica a partir dos dados reais.
5. Fazer AED.
6. Definir o tratamento necessário.
7. Estruturar os dados para análise.
8. Criar visualizações.
9. Documentar decisões e limitações.
10. Versionar o projeto no GitHub.

> **Nota:** as perguntas são deliberadamente provisórias. O SCOUT não deve forçar os dados a responder uma pergunta escolhida previamente; a exploração da base deverá ajudar a refinar a pergunta.
