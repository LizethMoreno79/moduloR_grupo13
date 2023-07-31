#PROYECTO FINAL

#LIBRERIAS
library(readxl)
library(tidyr)
library(ggplot2)
library(tidyverse)
library(dplyr)

#CARGAR DATOS
balances_2014 <- read_excel("Data/balances_2014.xlsx")
cias_codebook <- read_excel("Data/cias_codebook.xlsx")
ciiu <- read_excel("Data/ciiu.xlsx")
Formulario_102 <- read_excel("Data/Formulario 102.xls")

#Parte 1 - Data: En esta sección deberás describir y mostrar cómo está conformado el dataset balance_2014.xlsx.
str(balances_2014)
head(balances_2014)
#1.1 Utilizando los datos en el archivo llamado balance_2014.xlsx genera un tibble que denomines empresas y contenga las siguientes variables:
empresas<-tibble::as_tibble(balances_2014) 
class(empresas)
#1.2 empresas deberá tener las siguientes variables:
empresas_1<-empresas %>%  mutate(LiquidezCorriente= (v312/5)) %>% 
                          mutate(EndeudamientoActivo= (v312/6))  %>%
                          mutate(EndeudamientoPatrimonial= (v312/6))  %>%
                          mutate(EndeudamientoActivoFijo= (v312/6))  %>%
                          mutate(Apalancamiento= (v312/6))  %>%
                          select(Empresas=nombre_cia, 
                                 Status=situacion,
                                 TipoEmpresa = tipo, 
                                 Pais=pais, 
                                 Provincia=provincia, 
                                 Canton=canton, 
                                 Ciudad=ciudad,
                                 Actividad_economica=ciiu4_nivel1,
                                 SubActividad=ciiu4_nivel6,
                                 LiquidezCorriente,
                                 EndeudamientoActivo,
                                 EndeudamientoPatrimonial,
                                 EndeudamientoActivoFijo,
                                 Apalancamiento)
















#Parte 2 - Preguntas de Investigación




