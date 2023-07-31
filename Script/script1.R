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
#1.1
empresas<-tibble::as_tibble(balances_2014) 
empresas_1<-balances_2014 %>% select(Empresas=nombre_cia, Status=situacion, TipoEmpresa = tipo, Pais=pais, 
                                     Provincia=provincia, Cantón=canton, Ciudad=ciudad,Actividad_economica=ciiu4_nivel1,
                                     Subactividad=ciiu4_nivel6)
empresas_2<-empresas %>%  mutate(LiquidezCorriente= (v312/v313)) %>% select(Empresas=nombre_cia, Status=situacion, TipoEmpresa = tipo, Pais=pais, 
                                     Provincia=provincia, Cantón=canton, Ciudad=ciudad,Actividad_economica=ciiu4_nivel1,
                                     Subactividad=ciiu4_nivel6) %>% View('prueba2')


                                     
                                     






#Parte 2 - Preguntas de Investigación




