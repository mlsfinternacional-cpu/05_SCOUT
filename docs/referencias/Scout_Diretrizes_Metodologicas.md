# SCOUT — Diretrizes Metodológicas

### Como o SCOUT observa.

---

## 0. Ponto de partida

Este documento não redefine o que o SCOUT é.

Isso já está resolvido no **Documento 01 — Documento Conceitual**.

Aqui, a pergunta muda:

> **Dado que o SCOUT observa quem observa, com que critério ele decide que uma observação é válida, repetida ou convergente?**

O Documento 01 abriu o campo de pensamento.

Este documento fecha o **campo de decisão operacional** — sem ainda tocar em código, schema ou pipeline. Isso pertence ao Documento 03.

> **Primeiro o conceito → depois o método → depois a ferramenta.**

Este é o método.

---

## 1. Critérios para seleção de fontes

Nem toda fonte que menciona tecnologia serve ao SCOUT.

Uma fonte só entra no universo de observação se atender a pelo menos um destes critérios:

- **Curadoria declarada** — a fonte já exerce, publicamente, um papel de leitura do ecossistema (radar, observatório, relatório setorial).
- **Recorrência de publicação** — a fonte publica em ciclo (anual, trimestral, contínuo), permitindo comparação ao longo do tempo.
- **Rastreabilidade pública** — a fonte é acessível, citável e verificável por terceiros, sem depender de interpretação do SCOUT para existir.
- **Escopo relevante à camada** — a fonte se encaixa claramente em uma das quatro camadas definidas no Documento 01 (internacional, Brasil, capacidade, econômico).

> **Uma fonte que não pode ser rastreada não entra no SCOUT — por mais relevante que pareça.**

Fontes especulativas, anônimas ou sem histórico verificável ficam de fora, mesmo que sinalizem algo interessante. O SCOUT prefere perder um sinal a comprometer a rastreabilidade.

---

## 2. Classificação das fontes

Conforme a seção 10 do Documento 01, fontes diferentes observam coisas diferentes. Cada fonte cadastrada recebe uma ou mais classificações:

| Classificação | O que produz |
|---|---|
| **Radar de tendência** | Lista curada de temas emergentes, geralmente com metodologia própria declarada |
| **Observatório** | Leitura contínua e analítica de um ecossistema |
| **Fonte de repercussão brasileira** | Evidência de que um tema chegou, foi comentado ou adaptado no Brasil |
| **Sensor de capacidade** | Evidência de formação, pesquisa ou desenvolvimento institucional |
| **Sensor econômico** | Evidência de mercado, investimento, adoção empresarial |

Uma fonte pode acumular mais de uma classificação — a ACATE, por exemplo, pode funcionar simultaneamente como sensor econômico e fonte de repercussão brasileira, mas **nunca** é tratada como radar de tendência.

> **A classificação da fonte não muda para caber na conveniência da análise. A análise se adapta à natureza da fonte.**

---

## 3. Critérios de primeira ocorrência (🆕 Novo)

Um tema é classificado como **primeira ocorrência** quando:

- é a primeira vez que aparece em qualquer fonte cadastrada no histórico do SCOUT;
- não existe registro anterior do mesmo tema sob nomenclatura equivalente.

**Ponto de atenção metodológico:** um tema pode aparecer sob nomes diferentes em fontes diferentes (ex: "edge AI" vs "AI at the edge" vs "inferência distribuída"). A primeira ocorrência não é apenas lexical — exige leitura humana para confirmar equivalência semântica antes de ser registrada como recorrência de um tema já existente.

> **Nomear errado um tema como "novo" quando na verdade é recorrente sob outro nome é o erro mais silencioso que o SCOUT pode cometer.**

---

## 4. Critérios de recorrência (🔁 Recorrente)

Um tema é classificado como **recorrente** quando:

- já possui pelo menos um registro anterior no histórico do SCOUT;
- reaparece em uma nova edição, publicação ou ciclo de observação da **mesma fonte** ou de fonte diferente já cadastrada.

A recorrência não exige convergência simultânea — apenas exige **repetição ao longo do tempo**, mesmo que vinda de uma única fonte observada em ciclos diferentes.

> **Recorrência mede persistência. Convergência mede amplitude. São eixos diferentes e não devem ser fundidos.**

---

## 5. Critérios de convergência (🔗 Convergente)

Um tema é classificado como **convergente** quando:

- aparece em **duas ou mais fontes independentes** dentro de uma janela temporal a ser definida (sugestão inicial de trabalho: mesmo semestre de observação, ajustável conforme volume de dados coletado);
- as fontes envolvidas pertencem a organizações distintas, sem relação editorial direta entre si (evitar contar como convergência duas fontes que citam uma à outra).

> **Convergência não é volume. Duas fontes que apenas repetem a mesma fonte primária não são convergência — são eco.**

Esse critério é o que protege a hipótese central do Documento 01: a convergência só tem valor porque as fontes são **observadores independentes**.

---

## 6. Definição de chegada ao Brasil (🇧🇷)

Um tema é classificado como **presente no Brasil** quando:

- aparece em pelo menos uma fonte da Camada 2 (Visão Brasil, ACATE, ACIF, ACIS, IFSC, SCTI ou outra fonte brasileira cadastrada);
- essa aparição é posterior ao primeiro registro internacional do mesmo tema no SCOUT.

Se o tema surgir primeiro em fonte brasileira — sem registro internacional anterior no SCOUT — ele é registrado como **origem brasileira**, uma categoria à parte, sem intervalo calculado (não há o que medir).

> **O SCOUT não presume que todo sinal relevante nasce fora do Brasil. Ele apenas registra a ordem em que os sinais foram observados.**

---

## 7. Cálculo do intervalo temporal

Quando um tema possui registro internacional **e** registro brasileiro, o SCOUT calcula:

```
intervalo = data do primeiro sinal brasileiro − data do primeiro sinal internacional
```

Regras de tratamento:

- a data considerada é a **data de publicação da fonte**, não a data em que o SCOUT coletou o dado;
- o intervalo é sempre uma **medida descritiva**, nunca uma métrica preditiva;
- o intervalo não é interpretado como velocidade de adoção, apenas como **distância temporal observada entre dois registros**.

> **O intervalo responde "quanto tempo passou entre um sinal e outro". Ele não responde "por quê".**

Essa distinção protege diretamente o princípio epistemológico da seção 18 do Documento 01: correlação temporal não é explicação causal.

---

## 8. Critérios de evidência

Toda afirmação do SCOUT precisa estar ancorada em evidência rastreável. Uma observação só é registrada como válida quando possui, no mínimo:

- fonte identificada;
- data de publicação ou coleta;
- link ou referência acessível;
- classificação da fonte (conforme seção 2);
- camada à qual pertence (conforme Documento 01).

Observações sem esses cinco elementos ficam retidas como **candidatas**, não publicadas como sinal confirmado.

> **SCOUT não afirma o que não consegue rastrear até a origem.**

---

## 9. Tratamento de duplicidades

Duas situações distintas de duplicidade precisam de tratamento diferente:

**Duplicidade de fonte:** a mesma fonte menciona o mesmo tema em publicações diferentes dentro do mesmo ciclo. Tratamento: conta como **um único registro de recorrência**, não como convergência nem como múltiplas ocorrências.

**Duplicidade de conteúdo entre fontes:** duas fontes publicam texto ou dado claramente derivado uma da outra (ex: fonte B cita fonte A como origem). Tratamento: registra-se a origem (fonte A) como o sinal, e a fonte B como **repercussão**, não como segunda fonte independente para fins de convergência (ver seção 5).

> **Contar eco como convergência infla artificialmente o sinal e quebra a credibilidade do método.**

---

## 10. Regras de interpretação

A leitura humana (Documento 01, seção 17) precisa seguir alguns limites para não recair em previsão disfarçada de observação:

1. **Nunca declarar tendência.** O SCOUT descreve o que foi observado, não o que vai acontecer.
2. **Nunca atribuir causalidade ao intervalo temporal.** Intervalo é distância, não explicação.
3. **Nunca tratar ausência de sinal como ausência de movimento.** Um tema pode estar acontecendo sem que as fontes cadastradas o capturem ainda — isso é uma limitação do universo observado, não uma conclusão sobre a realidade.
4. **Sempre citar a fonte na afirmação**, mesmo em leituras qualitativas.
5. **Distinguir sinal de opinião.** Uma fonte que especula sobre o futuro não produz o mesmo tipo de evidência que uma fonte que registra um fato observável (lançamento, investimento, publicação, curso).

> **A leitura humana existe para adicionar critério, não para adicionar certeza que os dados não têm.**

---

## 11. O que este documento não resolve

Assim como o Documento 01 delimitou o que não precisava resolver ainda, este documento também não fecha:

- a estrutura de dados que armazenará essas classificações;
- o pipeline de coleta (RSS, APIs, scraping);
- os algoritmos de NLP para detecção de equivalência semântica entre temas;
- a frequência operacional de coleta;
- a interface de visualização.

Esses elementos pertencem ao **Documento 03 — Especificação Técnica**.

---

## 12. Em uma frase

> **O Documento 01 disse o que o SCOUT observa. Este documento diz com que critério ele decide que observou algo que merece confiança.**
