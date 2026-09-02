###############################################################################################################
# Objetivo: Ler o arquivo INDICADORES_CTI_PUB_2025.xlsx que contém o conjunto de indicadores nacionais de C&T.
#           Fornecer exemplos para manipular os dados. 
# Atenção:  Certifique-se que o arquivo INDICADORES_CTI_PUB_2024.xlsx esteja no mesmo diretório deste arquivo.
###############################################################################################################
# limpar o console
cat("\014")

# Instalar a biblioteca readxl (caso ainda não esteja instalada)
install.packages("readxl", quiet = TRUE)

# Carregar a biblioteca readxl
library(readxl)

# Ler o arquivo Excel com várias abas
arquivo_excel_indicadores_CeT <- "INDICADORES_CTI_PUB_2024.xlsx"

# Verificar se o arquivo existe
if (file.exists(arquivo_excel_indicadores_CeT)) {
  cat("O arquivo", arquivo_excel_indicadores_CeT, "foi encontrado.\n")
} else {
  cat("O arquivo", arquivo_excel_indicadores_CeT, "não foi encontrado. Certifique-se que o arquivo INDICADORES_CeT.xlsx esteja no mesmo diretório deste arquivo.\n")
}

# Definir as abas de interesse
abas_interesse <- c("INDICADORES", "INDICADORES_VALOR", "TABELAS", "TABELA_UF")

# Criar uma lista para armazenar os dados das abas
dados_abas <- list()

# Loop para ler cada aba de interesse e armazenar os dados
for (aba in abas_interesse) {
  dados_aba <- tryCatch(read_excel(arquivo_excel_indicadores_CeT, sheet = aba),
                        error = function(e) NULL, finally = NULL, warning = NULL)
  
  if (!is.null(dados_aba)) {
    assign(aba, dados_aba, envir = .GlobalEnv) # Definir o ambiente para o ambiente global
    dados_abas[[aba]] <- dados_aba
  } else {
    warning(paste("Aviso: Não foi possível ler os dados da aba", aba))
  }
}

# Salvar os dados em formato RData
if (length(dados_abas) > 0) {
  save(list = abas_interesse, file = "INDICADORES_CeT.RData")
  cat("Arquivo RData salvo com sucesso.")
} else {
  cat("Nenhum dado foi lido. O arquivo RData não será salvo.")
}

# Carregar o arquivo RData
load("INDICADORES_CeT.RData")

# Verificar os objetos presentes no ambiente de trabalho
ls()

#-------------------------------------------------------------------------------
# Exemplo 1:
# Usar a função subset() para fazer a consulta na tabela INDICADORES_VALOR
# Obter os dados (série histórica) do indicador 'DISP_NAC_CT_TOT'
dados_Indicadores_Valor <- subset(INDICADORES_VALOR, INDICADOR == 'DISP_NAC_CT_TOT')
dados_Indicadores_Valor$VALOR_em_milhoes <- dados_Indicadores_Valor$VALOR / 1000000

# Mostrar os dados (série histórica) do indicador 'DISP_NAC_CT_TOT'
print(dados_Indicadores_Valor)

# Instalar a biblioteca ggplot2 para os gráficos
install.packages("ggplot2")

# Carregar a biblioteca ggplot2
library(ggplot2)

# Criar o gráfico de barras usando ggplot2
ggplot(dados_Indicadores_Valor, aes(x = ANO, y = VALOR_em_milhoes, fill = INDICADOR)) +
       geom_bar(stat = "identity", position = "dodge") +
       labs(title = "Gráfico de Barras - Valores (em milhões) por Ano",
       x = "Ano", y = "Valor (em milhões)", fill = "Indicador") +
       theme_minimal() +
       theme(legend.position = "bottom")

#-------------------------------------------------------------------------------
# Exemplo 2:
# Obter os valores da TABELA cujo campo tabela é igual a Tab020101 (Esta tabela esta disponível no site do MCTI)
# https://www.gov.br/mcti/pt-br/acompanhe-o-mcti/indicadores/paginas/recursos-aplicados/indicadores-consolidados/2-1-1-brasil-dispendio-nacional-em-pesquisa-e-desenvolvimento-por-atividade
dados_Tabela <- subset(TABELAS, TABELA == 'Tab020101')
print(dados_Tabela)

# Obter todos os campos únicos da coluna "INDICADOR" dos dados_indicadores
campos_Tabela <- unique(dados_Tabela$INDICADOR)
print(campos_Tabela)

# Obter todos os campos da tabela INDICADORES_VALOR
resultado_consulta <- INDICADORES_VALOR[INDICADORES_VALOR$INDICADOR %in% campos_Tabela, ]

# Resultado da consulta filtrado pelos campos obtidos
print(resultado_consulta)

# Carregar a biblioteca tidyr
install.packages("tidyr")

# Carregar a biblioteca tidyr
library(tidyr)

# Transformar os dados, usando a função pivot_wider()
dados_Indicadores_Valor_Pivot <- pivot_wider(resultado_consulta, 
                                 names_from = INDICADOR,
                                 values_from = VALOR)

# Resultado: uma nova tabela onde os valores do campo INDICADOR se tornaram colunas
print(dados_Indicadores_Valor_Pivot)

# Criar o gráfico de barras usando ggplot2
nome_variavel_y <- colnames(dados_Indicadores_Valor_Pivot)[2]

ggplot(dados_Indicadores_Valor_Pivot, aes(x = ANO, y = !!as.name(nome_variavel_y))) +
       geom_bar(stat = "identity", position = "dodge") +
       labs(title = paste("Gráfico de Barras - Valores", nome_variavel_y, "por Ano"),
       x = "Ano", y = nome_variavel_y) +
       theme_minimal() +
       theme(legend.position = "bottom")


#-------------------------------------------------------------------------------
print("MCTI agradece!")

