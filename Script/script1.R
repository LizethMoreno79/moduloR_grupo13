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


<<<<<<< HEAD
#Parte 2 - Preguntas de Investigación

## Crea una tabla resumiendo el número total de empresas por actividad económica y
## por actividad económica por cada cantón. La tabla simplemente debe aparecer
## Como un data frame o tibble en tu script.
   
empresas_1 %>% 
arrange(actividad_economica,canton) %>% 
count()


total_empresas<-select(all_of(total_empresas)) %>% 
  group_by(Actividad_economica, Canton) %>% 
  pivot_wider(names_from = Actividad_economica ,values_from = total_empresas)

# 3. Gráficamente muestra el comparativo de los indicadores financieros de liquidez y
# solvencia por Status y provincia.

ggplot(balances_2014,aes(x = IndicadorFinanciero,y = Provincia)) +
  geom_point(aes(color = status )) +
  facet_wrap(("status"))

ggplot(balances_2014, aes(x = Provincia, y = IndicadorLiquidez, fill = Status)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparativo de Indicadores Financieros de Liquidez por Status y Provincia",
       x = "Provincia", y = "Indicador de Liquidez")

ggplot(balances_2014,aes(x=Liquidez, y = solvencia, fill=status)) +
  geom_histogram() +
  labs(title ="Comparativo de Indicadores Financieros de Liquidez por Status y Provincia", 
       y ="solvencia", x ="liquidez")

ggplot(datos, aes(x = Provincia, y = IndicadorLiquidez, fill = Status)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Comparativo de Indicadores Financieros por Status y Provincia",
       x = "Provincia", y = "Indicador") +
  facet_wrap(~ Indicador, scales = "free_y", nrow = 2) +
  theme_minimal()

-----------------------------------------
empresas_1 %>% mutate(apalancamiento = Activo/Patrimonio) %>% view("mutate1")


=======



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
  
  

                            
  
  
>>>>>>> bbf18ef33757744054ead728db38258b454bf018



