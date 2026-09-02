# Diário — Ambiente Python, Git e VS Code

## 08/08/2026 — Criar e ativar ambiente da análise

### Fluxo

**ENTRAR NO PROJETO**
↓
`pwd`
↓
**CONFIRMAR PYTHON**
↓
`py --version`
↓
**CRIAR AMBIENTE**
↓
`py -m venv .venv`
↓
**PERMITIR SCRIPT NA SESSÃO**
↓
`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`
↓
**ATIVAR**
↓
`.\.venv\Scripts\Activate.ps1`
↓
`(.venv)`
↓
🎉 ambiente virtual ativo

---

## 09/08/2026 — Kernel do Jupyter no VS Code

Ao abrir um arquivo `.ipynb`, o VS Code solicita a seleção do **Kernel**.

### Para usar o ambiente virtual do projeto

1. Abrir o notebook `.ipynb`.
2. Clicar em **Select Kernel**, no canto superior direito.
3. Selecionar **Python Environments**.
4. Escolher o Python do `.venv` do projeto.

O Kernel é o ambiente Python utilizado para executar as células do notebook.

### Regra prática

> Cada projeto com `.venv` deve ter seu notebook executado pelo Kernel correspondente ao `.venv` daquele projeto.

Antes de executar o notebook, conferir se o Kernel selecionado é o ambiente correto.

---

## 11/08/2026 — Instalação das bibliotecas

### Pandas e NumPy

Com o `.venv` ativado no terminal do VS Code:

```powershell
python -m pip install pandas numpy
```

### Matplotlib

No terminal:

```powershell
python -m pip install matplotlib
```

### Regra prática

> Kernel correto + `.venv` ativo + biblioteca instalada no `.venv` = ambiente pronto para executar o notebook.

A instalação é feita uma vez por ambiente virtual. Ao criar um novo `.venv` para outro projeto, as bibliotecas precisam ser instaladas novamente nesse novo ambiente.

---

## 19/08/2026 — Descoberta: nova sessão do terminal

A `.venv` permanece criada dentro do projeto, mas sua ativação é válida apenas para a sessão atual do terminal.

Ao abrir um novo terminal, o ambiente virtual não aparece automaticamente como ativo.

### Para reativação

1. Permitir o script na sessão:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

2. Ativar o ambiente:

```powershell
.\.venv\Scripts\Activate.ps1
```

Resultado esperado:

```text
(.venv) PS ...\04_E_Waste>
```

---

# Git

## Inicialização e branches

O projeto utiliza duas branches:

- `main`: versão estável do projeto e branch destinada à entrega.
- `develop`: branch de desenvolvimento, utilizada durante a construção e evolução do projeto.

### Inicialização

Após `git init`, a branch inicial pode ser criada como `master`.

Para estabelecer `main` como branch principal:

```powershell
git branch -M main
```

### Criar a branch `develop`

```powershell
git checkout -b develop
```

### Conferir a branch atual

```powershell
git branch
```

---

## Git — criar o `.gitignore`

### Para que serve

O `.gitignore` informa ao Git quais arquivos e pastas **não devem ser versionados**.

No projeto Python, ele é especialmente importante para não subir o ambiente virtual `.venv`, arquivos temporários, caches e informações locais.

### Criar o arquivo pelo terminal

Na pasta raiz do projeto:

```powershell
New-Item .gitignore -ItemType File
```

Ou, de forma simples no VS Code:

1. Clique com o botão direito na raiz do projeto.
2. Escolha **New File**.
3. Digite exatamente:

```text
.gitignore
```

### Conteúdo básico para um projeto Python + VS Code

```gitignore
# Ambiente virtual
.venv/

# Cache do Python
__pycache__/
*.py[cod]

# Jupyter
.ipynb_checkpoints/

# Arquivos locais de ambiente
.env

# Configurações locais do VS Code
.vscode/

# Arquivos do sistema
.DS_Store
Thumbs.db
```

### Regra importante

> O `.gitignore` deve ser criado **antes do primeiro `git add .`**, sempre que possível.

Assim, arquivos que não devem entrar no repositório já ficam fora do versionamento.

### Conferir o que o Git está enxergando

```powershell
git status
```

Se quiser verificar arquivos ignorados:

```powershell
git status --ignored
```

### Depois do `.gitignore`

Adicionar os arquivos que devem ser versionados:

```powershell
git add .
```

Conferir:

```powershell
git status
```

E então criar o primeiro commit:

```powershell
git commit -m "chore: estrutura inicial do projeto"
```

> **Atenção:** o `.gitignore` não apaga arquivos do computador. Ele apenas orienta o Git a não rastreá-los.

---

## 19/08/2026 — Estado do projeto após preparação do ambiente

O SCOUT já tem:

- `.venv` criado e ativado;
- Python confirmado;
- política de execução ajustada para a sessão;
- Git inicializado;
- `main` estabelecida;
- `develop` criada e ativa.

---

## Pausa estratégica — aguardando o edital

O ambiente do projeto foi preparado e a estrutura inicial foi organizada para que o desenvolvimento possa avançar rapidamente quando a proposta for definida.

Neste momento, nenhum commit será realizado.

A decisão de aguardar está relacionada ao edital da avaliação, que ainda será disponibilizado. É necessário confirmar se o dataset escolhido atende aos critérios e restrições definidos para o projeto.

Caso o dataset seja aprovado, a estrutura já preparada poderá ser utilizada como ponto de partida para o desenvolvimento.

Caso não seja aprovado, o projeto poderá ser adaptado ou redirecionado para outro dataset, sem comprometer a organização já realizada.

**Objetivo desta etapa:** deixar o ambiente, a estrutura e a compreensão do fluxo prontas, sem antecipar uma decisão que depende das regras da avaliação.

> Preparar primeiro. Decidir com o edital em mãos. Depois, bater o martelo e executar.

---

# Sequência de aprendizagem

Este diário registra não apenas os comandos, mas as descobertas feitas durante a preparação do ambiente, para que o procedimento possa ser consultado e reutilizado em outros projetos.

## Checklist rápido — novo projeto Python

```text
ENTRAR NO PROJETO
        ↓
pwd
        ↓
py --version
        ↓
py -m venv .venv
        ↓
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
        ↓
.\.venv\Scripts\Activate.ps1
        ↓
CRIAR .gitignore
        ↓
INSTALAR BIBLIOTECAS
        ↓
CONFIGURAR KERNEL DO JUPYTER
        ↓
git init
        ↓
git branch -M main
        ↓
git checkout -b develop
        ↓
git status
```

> **Nota:** a ordem entre `git init`/branches e a criação do `.gitignore` pode variar, mas o ponto essencial é ter o `.gitignore` configurado antes de executar o primeiro `git add .`.

