# SCOUT — Notas de evolução

## Nota 01 — Observatório ACATE: ampliar a classificação da fonte

**Data:** 17/08/2026

### O que aprendemos

Ao verificar o [Observatório ACATE](https://www.observatorioacate.com.br/), percebemos que a ACATE não deve ser tratada apenas como uma fonte de contexto econômico.

O próprio Observatório ACATE reúne dados e informações sobre o setor de tecnologia, com enfoque em Santa Catarina, e acompanha indicadores como **Faturamento, Empresas, Empregos e Ensino**.

Isso significa que uma mesma fonte pode produzir sinais de naturezas diferentes:

- **Econômico** → faturamento, participação no PIB, crescimento;
- **Empresarial/ecossistema** → número e evolução das empresas;
- **Capacidade profissional** → empregos e colaboradores;
- **Capacidade educacional** → matrículas e concluintes STEM/TIC;
- **Contexto brasileiro/regional** → posição de Santa Catarina e comparação com outros estados.

A página de Ensino do próprio Observatório apresenta indicadores de matrículas, concluintes STEM e instituições de ensino, reforçando que a dimensão de capacidade já está presente dentro da mesma fonte.

### Consequência conceitual

Não devemos classificar uma fonte de maneira rígida apenas por sua identidade institucional.

> **A fonte possui uma natureza; os sinais extraídos dela podem possuir naturezas diferentes.**

Portanto, o Observatório ACATE deve ser considerado uma **fonte observatória brasileira multidimensional**, capaz de produzir sinais para diferentes dimensões do SCOUT.

Isso preserva a regra já estabelecida de que:

> **Fontes diferentes podem observar coisas diferentes.**

E permite também que uma mesma fonte produza registros classificados em diferentes camadas.

---

## Onde isso entra na arquitetura dos documentos?

### Documento 01 — Documento Conceitual

**É aqui que a descoberta precisa ser incorporada primeiro.**

A seção sobre as camadas e a seção sobre a não equivalência das fontes devem, no futuro, refletir que uma fonte brasileira pode atravessar mais de uma dimensão.

**Não precisamos alterar agora.**

### Documento 02 — Diretrizes Metodológicas

**É aqui que a descoberta ganha regra operacional.**

A seção de classificação das fontes já estabelece que uma fonte pode acumular mais de uma classificação.

No futuro, devemos aprofundar:

- fonte pode ter múltiplas classificações;
- um mesmo observatório pode produzir sinais de diferentes naturezas;
- a classificação deve ocorrer também no nível do **sinal/registro**, e não apenas da fonte.

### Documento 03 — Especificação Técnica

**É aqui que a descoberta vira estrutura de dados.**

No futuro, verificar se `classificacao` e `camada` precisam suportar múltiplos valores de forma consistente.

A estrutura técnica deve permitir que uma observação proveniente do Observatório ACATE seja registrada conforme o conteúdo específico observado, por exemplo como:

- econômico;
- capacidade;
- empresarial/ecossistema.

---

## Estado da decisão

**Não alterar os três documentos agora.**

Esta é uma **nota de evolução do projeto**.

À medida que novas fontes forem investigadas, novas descobertas podem modificar ou refinar o modelo conceitual e metodológico.

Quando o mapeamento das fontes estiver mais maduro, revisar os Documentos 01, 02 e 03 em conjunto.

> **O conceito não precisa ser congelado antes da investigação das fontes.**

> **Primeiro observamos o campo. Depois consolidamos o modelo.**

---

## Fonte consultada

- Observatório ACATE — https://www.observatorioacate.com.br/
- Observatório ACATE — Ensino — https://www.observatorioacate.com.br/empresas-2-1
