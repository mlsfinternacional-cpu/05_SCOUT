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
---

# MARCO DE CONTINUIDADE — 01/09/2026

## 13. CONTEXTO DE RETOMADA

O trabalho de hoje foi retomado a partir do diário de 31/08/2026 e dos documentos de enquadramento da avaliação M1.2, do mapa operacional do Scout e do Documento Conceitual do SCOUT.

O enquadramento permanece:

> **M1.2 = primeira peça real, verificável e reutilizável do SCOUT.**

O fluxo do projeto continua:

> **FONTE → ENTENDIMENTO → MODELAGEM/DW → AED → TRATAMENTO → VISUALIZAÇÃO → DOCUMENTAÇÃO → GITHUB**

A avaliação exige a integração de base pública, tratamento, Data Warehouse/modelagem dimensional, SQL, AED, visualização, documentação e GitHub. O entendimento da fonte, da granularidade, das chaves e das relações deve preceder a modelagem.

---

## 14. INVESTIGAÇÃO REALIZADA EM 01/09/2026

### 14.1 Validação da granularidade de `INDICADORES_VALOR`

Foi criada uma Tabela Dinâmica no LibreOffice Calc a partir da aba `INDICADORES_VALOR`.

Configuração:
- Linhas: `INDICADOR` + `ANO`
- Dados: contagem de `INDICADOR`

Resultado da checagem:
> **Duplicidades de `ANO + INDICADOR`: 0**

Conclusão operacional:
> `ANO + INDICADOR` permanece como **candidata validada à granularidade da fato**, sujeita ainda às verificações semânticas restantes.

Observação: o valor `72.059` observado numa primeira tentativa foi identificado como o total geral da Tabela Dinâmica, e não como a maior contagem de uma combinação.

### 14.2 Investigação da aba `INDICADORES`

Foram observadas as colunas:
- `INDICADOR`
- `DESCRICAO_INDICADOR`
- `TIPO_INDICADOR`
- `GRUPO_INDICADOR`
- `FONTE_INDICADOR`
- `ELABORACAO_INDICADOR`
- `NOTAS_ESPECIFICAS`
- `LINK_NOTAS_METODOLOGICAS`

Confirmação:
> `INDICADORES` funciona como estrutura de descrição/metadados dos indicadores.

Também foram observados códigos com recortes geográficos embutidos, como:
- `DISP_EST_CT_REG_N`
- `DISP_EST_CT_REG_NE`
- `DISP_EST_CT_REG_SE`
- `DISP_EST_CT_REG_S`
- `DISP_EST_CT_REG_CO`

Também aparecem códigos específicos por UF.

### 14.3 Tipos de indicador

`TIPO_INDICADOR` apresentou:
- `Numero`
- `Percentual`
- `Valor_Corrente_BRL`
- `Valor_Corrente_USD`
- `Valor_Deflacionada_BRL`

Conclusão:
> `VALOR` é uma medida numérica cujo significado depende do `TIPO_INDICADOR`.

### 14.4 Grupos de indicador

`GRUPO_INDICADOR` apresentou, entre outros:
- `Bolsas`
- `Estadual`
- `Federal`
- `Patentes`
- `Recursos Humanos - Escolaridade`
- `Recursos Humanos - Graduação`
- `Recursos Humanos - Mercado Trabalho`
- `Recursos Humanos - Pós-Graduação`
- `SocioEconomico`

Conclusão:
> `GRUPO_INDICADOR` funciona como classificação temática/contextual do indicador.

---

## 15. INVESTIGAÇÃO DAS RELAÇÕES ENTRE AS ABAS

### 15.1 `INDICADORES` ↔ `INDICADORES_VALOR`

Relação central identificada:

```text
INDICADORES
     │
     │ INDICADOR
     ▼
INDICADORES_VALOR
```

Interpretação:
- `INDICADORES` explica o indicador;
- `INDICADORES_VALOR` registra o valor do indicador por ano.

### 15.2 `TABELAS`

A aba `TABELAS` associa `TABELA` e `INDICADOR`.

Foram observados campos como:
- `ID`
- `TABELA`
- `INDICADOR`
- `CONVERS...`
- `STATUS_TABEL`
- `ULTIMO`
- `DESCRICAO_INDICADOR`
- `TIPO_INDICADOR`
- `CRONOGRAMA`

Foi observada fórmula `PROCV` para recuperar descrição do indicador.

Interpretação provisória:
> `TABELAS` é uma estrutura de organização/associação e rastreabilidade dos indicadores, não uma fato de valores.

### 15.3 `TABELA_UF`

Campos observados:
- `UF`
- `UF_SIGLA`
- `REGIAO`
- `REGIAO_SIGLA`
- `REGIAO_NOMENCLATURA`
- `REGIAO_UF_NOMENCLATURA`

Interpretação:
> `TABELA_UF` funciona como estrutura de contexto geográfico, relacionando UF e região.

Exemplo observado:
```text
SC → Sul → S → REG_S → REG_S_SC
```

### 15.4 `TABELA_UNIVERSIDADE`

Campos observados:
- `UNIV_SIGL`
- `UNIV_NOME`
- `UNIV_TIPO`
- `UF`
- `UF_SIGLA`
- `REGIAO`
- `REGIAO_SIGLA`

Interpretação:
> `TABELA_UNIVERSIDADE` representa uma entidade institucional própria e contém também atributos de localização.

Hierarquia contextual:
```text
UNIVERSIDADE → UF → REGIÃO
```

Ainda não foi comprovada uma ligação direta dessa estrutura com `INDICADORES_VALOR`.

### 15.5 `ESTUDO`

A aba apresenta novamente a lógica de `TABELA + INDICADOR + metadados`, incluindo descrição, tipo, status e cronograma.

Interpretação provisória:
> `ESTUDO` funciona como catálogo/estrutura de estudos e metadados, não como fato de valores.

---

## 16. MODELO CONCEITUAL PROVISÓRIO

Foi desenhado um primeiro modelo conceitual:

```text
                 DIM_INDICADOR
                      │
                      │ INDICADOR
                      ▼
               FATO_INDICADORES_VALOR
                 ANO | INDICADOR | VALOR

                   DIM_UF
              UF | REGIÃO | ...

             DIM_UNIVERSIDADE
         UNIVERSIDADE | UF | REGIÃO

          TABELAS / ESTUDO
        estruturas auxiliares
```

### Interpretação atual

**Candidata a fato:** `INDICADORES_VALOR`
- granularidade candidata: `ANO + INDICADOR`
- medida: `VALOR`

**Candidata a dimensão principal:** `INDICADORES`
- descrição
- tipo
- grupo
- fonte
- demais metadados

**Candidata a dimensão geográfica:** `TABELA_UF`

**Candidata a dimensão institucional:** `TABELA_UNIVERSIDADE`

**Estruturas auxiliares:** `TABELAS` e `ESTUDO`

### Atenção

O desenho é **conceitual e provisório**.

Ainda não foram definidos:
- PKs definitivas;
- FKs definitivas;
- tratamento da geografia embutida nos códigos de `INDICADOR`;
- necessidade real de `DIM_UF` e `DIM_UNIVERSIDADE` na análise final;
- escolha entre Star Schema e Snowflake;
- estrutura lógica do SQLite.

---

## 17. MUDANÇA DE ENTENDIMENTO

O projeto deixou de ser pensado como:

> `dataset → dataframe`

e passou a ser entendido como:

> `fonte relacional → entendimento das estruturas → relações → granularidade → modelo → dataframe analítico`

Em um dataset de uma única aba, a própria tabela costuma representar diretamente o recorte de análise.

Na base MCTI, o DataFrame analítico será uma **visão construída a partir das estruturas necessárias à pergunta analítica**.

Portanto:

> **não se escolhe o DataFrame antes de entender o modelo dos dados.**

---

## 18. STATUS APÓS 01/09/2026

### 🟢 CONCLUÍDO
- Fonte pública MCTI selecionada.
- Arquivo Excel identificado.
- 7 abas identificadas.
- `INDICADORES` inspecionada.
- `INDICADORES_VALOR` inspecionada.
- `TABELAS` inspecionada.
- `TABELA_UF` inspecionada.
- `TABELA_UNIVERSIDADE` inspecionada.
- `ESTUDO` inspecionada.
- Relação central `INDICADORES → INDICADORES_VALOR` identificada.
- `ANO + INDICADOR` testado quanto à duplicidade.
- **Duplicidades encontradas: 0.**
- `TIPO_INDICADOR` identificado.
- `GRUPO_INDICADOR` identificado.
- Recortes geográficos embutidos em códigos observados.
- Primeiro modelo conceitual desenhado.

### 🟡 EM INVESTIGAÇÃO
- Semântica completa de `VALOR`.
- Tratamento da geografia embutida nos códigos de `INDICADOR`.
- Relações formais entre estruturas auxiliares e a futura fato.
- Necessidade de incluir `TABELA_UF` e `TABELA_UNIVERSIDADE` no modelo analítico.
- Recorte analítico/pergunta do M1.2.
- Definição final de fato e dimensões.

### 🔴 AINDA NÃO INICIADO
- Modelo dimensional definitivo.
- Escolha Star Schema × Snowflake.
- Criação do SQLite.
- Beekeeper Studio.
- Queries SQL.
- Tratamento.
- AED.
- Visualizações.
- Documentação final.
- GitHub/finalização.

---

## 19. MARCADOR PARA RETOMADA

### PRÓXIMA AÇÃO

**Validar a semântica da medida `VALOR` antes de fechar a fato.**

Pergunta:
> **O `TIPO_INDICADOR` é suficiente para interpretar `VALOR` corretamente ou existem outras informações da base/metodologia que precisam entrar nessa interpretação?**

Depois:

> **→ fechar fato e dimensões → escolher Star/Snowflake → estruturar SQLite.**

### REGRA DE CONTINUIDADE

Não voltar a explorar abas sem uma pergunta definida.

Não alterar a fonte original durante a investigação.

Não antecipar o modelo final antes de validar as relações necessárias.

> **Primeiro investigamos. Depois modelamos. Depois construímos.**
