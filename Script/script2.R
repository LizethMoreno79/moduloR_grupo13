#PROYECTO FINAL
install.packages("readxl")
install.packages("tidyr")
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("dplyr")


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
Formulario_102 <- read_excel("Data/Formulario_102.xls")

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

# En esta sección deberás contestar las preguntas planteadas y éstas te ayudarán a darle 
#forma a la redacción de tu informe a entregar.
#¿El endeudamiento del activo fue mayor en empresas micro + pequeñas vs. grandes?


#¿La liquidez por tipo de compañía es diferente entre aquellas empresas que tienen más de 
#60 trabajadores directos y que cuenta con 100 a 800 trabajadores administrativos?


#Describe el top 10 de empresas con mayor apalancamiento.
balances_2014 %>% mutate(apalancamiento = v312/6) %>% view("mutate1")
balances_2014 %>% transmute(Apalancamiento = v312/6) %>% view("transmute1")
balances_2014 %>% arrange(desc(apalancamiento=v312/6))%>%  view("top10_empresas")

## Crea una tabla resumiendo el número total de empresas por actividad económica y
## por actividad económica por cada cantón. La tabla simplemente debe aparecer
## Como un data frame o tibble en tu script.
#1  
empresas_1 %>% 
arrange(actividad_economica,canton) %>% 
count()
#2
total_empresas<-select(all_of(total_empresas)) %>% 
  group_by(Actividad_economica, Canton) %>% 
  pivot_wider(names_from = Actividad_economica ,values_from = total_empresas)

# 3. Gráficamente muestra el comparativo de los indicadores financieros de liquidez y
# solvencia por Status y provincia.


ggplot(balances_2014,aes(x= v312/5, y = v312/6))+
  geom_line()+
labs(title = "Comparativo de indicadores financieros de liquidez por Status y provincia",
     x= "v312/6", y ="v312/6")

ggplot(balances_2014,aes(x= v312/5, y = v312/6))+
  geom_point()



