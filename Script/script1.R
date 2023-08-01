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
empresas_1<- empresas %>%  mutate(LiquidezCorriente= (v345/v539)) %>% 
                            mutate(EndeudamientoActivo= (v599/v499),
                                   EndeudamientoPatrimonial= (v599/v698),
                                   EndeudamientoActivoFijo= (v698/v498),
                                   Apalancamiento= (v499/v698))  %>%
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





#ANÁLISIS EXPLORATORIO DE DATOS
glimpse(empresas_1)
empresas_1$Status<- as.factor(empresas_1$Status) 
empresas_1$TipoEmpresa<- as.factor(empresas_1$TipoEmpresa)
empresas_1$Actividad_economica<- as.factor(empresas_1$Actividad_economica)
empresas_1$SubActividad<- as.factor(empresas_1$SubActividad)#convertir a factor
glimpse(empresas_1)
proporcion<- empresas_1 %>% prop.table(table(empresas_1$Empresas,empresas_1$Canton))
summary(empresas_1)



total_empresas<- empresas_1 %>% group_by(Actividad_economica, Canton) %>% pivot_wider(names_from = Actividad_economica ,values_from = total_empresas)
  
  

                            
  
  



