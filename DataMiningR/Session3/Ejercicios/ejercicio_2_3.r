### Ejercicio #3: *tibbles*
#Recuerda que las funciones *read_csv()*, *read_tsv()*, *read_csv2* 
#almacenan los datos leidos desde un archivo de texto (comma-separated, tab-separated o ;-separated, respectivamente) 
#en R en un tipo de objeto mas eficiente que los data.frames: los tibbles. 

library(tidyr)
library(tidyverse)
library(readr)

#Utilizando la función *read_tsv()* lee el fichero "murders.world.txt"

#explora los parámetros que necesita la función "read_tsv"
# ? read_tsv
# lee por defecto la primera fila como los nombres de las columnas
world.murders=read_tsv("murders.world.txt")
world.murders
#nota que no necesitas usar header()porque un tibble 
#sólo muestra las primeras 10 filas del objeto

#En primer lugar, vamos a cambiarle el nombre a la primera y sexta columna del tibble:

names(world.murders)[1]="country"
names(world.murders)[6]="year"

#Ahora seleccionamos con dplyr::filter() y dplyr::select() los rates de asesinatos 
#en paises europeos solo y nos quedamos con las columnas country and rate:
eu.murders<-world.murders %>%
  dplyr::filter(Region=="Europe")%>%
  dplyr::select(country,Rate,year)
eu.murders

#Añadir la fila con la informacion de USA al tibble.

bind_rows(eu.murders,as.tibble(usa.murders))
#como no se llaman igual las columnas simplemente crea otras. 
#rbind no nos dejaría hacerlo
names(eu.murders)=names(usa.murders)
all.murders=bind_rows(eu.murders,as.tibble(usa.murders))
all.murders

#Que paises de la UE tiene una mayor tasa de asesinatos que USA?

all.murders[which(all.murders$rate>usa.murders$rate),]




