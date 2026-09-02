# SCOUT — Especificação Técnica

### Como o SCOUT será construído.

---

## 0. Ponto de partida

O Documento 01 disse **o que** o SCOUT é.

O Documento 02 disse **com que critério** ele decide o que observou.

Este documento diz **com que ferramenta** isso vira realidade — sem alterar nem o conceito, nem o método definidos anteriormente.

> **A tecnologia não define o projeto. O projeto define a tecnologia que precisa.**

Se algum critério técnico aqui parecer forçar uma mudança na metodologia do Documento 02, o erro está na especificação técnica — não no método.

---

## 1. Estrutura dos dados

Cada observação registrada pelo SCOUT precisa carregar, no mínimo, os campos definidos como critério de evidência no Documento 02 (seção 8). Estrutura de trabalho sugerida:

**Tabela `fontes`**

| campo | tipo | descrição |
|---|---|---|
| `id_fonte` | string | identificador único |
| `nome` | string | nome da fonte |
| `classificacao` | lista | radar / observatório / repercussão BR / sensor capacidade / sensor econômico (pode ter mais de um valor — Doc. 02, seção 2) |
| `camada` | string | internacional / Brasil / capacidade / econômico (Doc. 01) |
| `url_base` | string | referência pública da fonte |
| `ciclo_publicacao` | string | anual / trimestral / contínuo / irregular |

**Tabela `sinais`**

| campo | tipo | descrição |
|---|---|---|
| `id_sinal` | string | identificador único |
| `tema` | string | nome do tema conforme registrado na fonte |
| `tema_normalizado` | string | nome canônico após checagem de equivalência semântica (Doc. 02, seção 3) |
| `id_fonte` | string | referência à tabela `fontes` |
| `data_publicacao` | date | data declarada pela fonte |
| `data_coleta` | date | data em que o SCOUT registrou o dado |
| `url_evidencia` | string | link direto à evidência |
| `classificacao_sinal` | lista | 🆕 / 🔁 / 🔗 / 📈 / 🇧🇷 / 🎓 / 💼 (Doc. 01, seção 12) |
| `origem_brasileira` | booleano | true quando não há sinal internacional anterior (Doc. 02, seção 6) |

**Tabela `temas_historico`**

Consolida, por `tema_normalizado`, o histórico de aparições — é essa tabela que permite calcular recorrência, convergência e intervalo temporal sem reprocessar tudo a cada nova coleta.

> **A tabela de sinais brutos nunca é apagada ou sobrescrita. Ela é a fonte de rastreabilidade (Doc. 01, seção 16) — o histórico consolidado é derivado dela, não o contrário.**

---

## 2. Normalização e equivalência semântica

Este é o ponto que o Documento 02 já sinalizou como fricção (seção 3): temas com nomes diferentes que são, na prática, o mesmo sinal.

Abordagem em etapas, da mais simples para a mais sofisticada — sem pular etapa:

1. **Dicionário manual de sinônimos**, mantido por você. Início mais simples, mais controlável, mais alinhado ao princípio de rastreabilidade: toda equivalência é uma decisão humana registrada, não uma inferência de modelo.
2. **Similaridade textual leve** (ex: comparação de embeddings simples ou distância de string) como *sugestão* de possível equivalência — nunca como decisão automática. O sistema propõe, a leitura humana confirma.
3. **NLP mais robusto** (embeddings semânticos, clustering de temas) apenas se o volume de dados justificar — e mesmo assim, mantendo a etapa de confirmação humana como obrigatória.

> **Automatizar demais a normalização de temas contraria diretamente a seção 17 do Documento 01: a leitura humana não pode ser eliminada da engrenagem.**

---

## 3. Coleta

Cada camada de fonte (Doc. 01, seções 6–9) provavelmente exige uma estratégia de coleta diferente:

- **RSS** — para fontes que publicam feed estruturado (blogs, alguns radares).
- **APIs públicas** — quando disponíveis (ex: GitHub Trending via OSS Insight, Hacker News via Algolia, já em uso no projeto).
- **Scraping de páginas públicas** — para radares e observatórios sem feed ou API (ex: Thoughtworks, CNCF, Nitor), respeitando robots.txt e termos de uso de cada fonte.
- **Coleta manual pontual** — aceitável e honesta para fontes de baixo volume ou publicação irregular (ex: relatórios anuais de ACATE), sem necessidade de forçar automação onde não compensa.

> **Nem toda fonte precisa de pipeline automatizado. Uma fonte que publica uma vez por ano pode, sem prejuízo, ser lida manualmente uma vez por ano.**

Isso está alinhado ao Documento 01 (seção 25): a ferramenta é consequência da necessidade, não o contrário.

---

## 4. Processamento

Camada de trabalho sugerida (Python + Pandas, conforme já é sua stack):

1. **Ingestão** — dados brutos de cada fonte entram na tabela `sinais`, sem alteração.
2. **Normalização** — aplica-se a etapa da seção 2 acima, gerando `tema_normalizado`.
3. **Classificação** — aplicam-se os critérios do Documento 02 (seções 3–6) para marcar 🆕 / 🔁 / 🔗 / 🇧🇷, etc.
4. **Cálculo de intervalo** — para temas com sinal internacional e brasileiro confirmados (Doc. 02, seção 7).
5. **Consolidação** — atualização da tabela `temas_historico`.

Cada etapa deve poder rodar de forma independente e re-executável — isso facilita auditoria (consistente com o seu padrão de documentos de auditoria NB01–NB04 nos outros projetos).

---

## 5. Armazenamento

Para a fase inicial, um formato leve é suficiente e evita complexidade prematura:

- **CSV ou Parquet** versionado por data de coleta, ou
- **SQLite**, se o volume de dados começar a justificar consultas relacionais mais complexas.

Migração para banco mais robusto (Postgres, por exemplo) só se justifica quando o volume ou a necessidade de consulta concorrente exigir — não antes.

> **Escolher a ferramenta mais simples que resolve o problema de hoje é coerente com "o produto é a leitura, não o dashboard" (Doc. 01, seção 26).**

---

## 6. Visualização

Consistente com sua prática nos outros projetos (Atlas Energético, Mercado Energia SC): notebooks estruturados, com documentação em inglês para alcance de portfólio, e identidade visual já definida (dark teal, coral, sage green, cream).

Elementos mínimos de visualização:

- linha do tempo de aparição de um tema (internacional × Brasil);
- matriz de convergência (quais fontes mencionaram quais temas, no período);
- indicador de intervalo temporal por tema;
- painel de camadas (quantos sinais em cada camada: internacional, Brasil, capacidade, econômico).

> **A visualização organiza a leitura. Ela não substitui a leitura humana definida no Documento 01, seção 17.**

---

## 7. Automação e frequência de coleta

Sugestão de cadência inicial, ajustável conforme a realidade de publicação de cada fonte:

- **Radares internacionais** (Camada 1): checagem por ciclo de publicação de cada um (a maioria é anual ou semestral) — não faz sentido automação diária para fontes que publicam uma vez por ano.
- **Fontes de sinal contínuo** (Hacker News, GitHub Trending): coleta periódica mais frequente (ex: semanal), já que são fontes de fluxo constante.
- **Camada Brasil e camadas de capacidade/econômica**: coleta manual ou semi-automatizada, dado o volume geralmente menor e a natureza mais institucional das fontes.

> **A automação completa não é meta em si — é consequência, se e quando o volume exigir (Doc. 01, seção 23).**

---

## 8. O que este documento não fecha

Mesmo sendo o terceiro documento da trilogia, alguns pontos permanecem deliberadamente abertos, para não travar o projeto em decisões prematuras:

- escolha definitiva entre CSV/Parquet/SQLite (decidir na prática, com dados reais);
- o ponto exato em que o dicionário manual de sinônimos passa a precisar de apoio de NLP;
- interface final de visualização (notebook vs. dashboard interativo);
- eventual publicação pública do SCOUT (Kaggle, GitHub, ou uso interno).

Esses pontos se resolvem construindo, não discutindo antecipadamente.

---

## 9. Em uma frase

> **O Documento 01 disse o que observar. O Documento 02 disse com que critério confiar no que foi observado. Este documento diz, com a menor complexidade possível, como transformar isso em dado, histórico e leitura.**
