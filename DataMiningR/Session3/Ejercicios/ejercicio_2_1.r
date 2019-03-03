## Sesión 2: Importación de datos, *tibbles()* y objetos *tidy*
### Ejercicio #1: Importar datos de la web y escribirlos en un fichero de texto
library(dslabs)
library(dplyr)
library(tidyr)
library(tidyverse)
library(rvest)

#Utilizando la función *read_html* del paquete *rvest* nos bajamos de internet 
#la tabla de asesinatos en todo el mundo que aparece en wikipedia

url="https://en.wikipedia.org/wiki/List_of_countries_by_intentional_homicide_rate"
h <- read_html(url)
class(h)
h


#Hay una seccion del codigo html que comienza con <table class="wikitable sortable">. 
#Ahi estan los datos de la tabla que queremos leer en R. Por exploración del código 
#html vemos que es la cuarta de las "wikitable sortable"

tab <- h %>% html_nodes("table")
tab <- tab[[4]] %>% html_table
head(tab)
class(tab)

#Los datos de la tabla están almacenados en la variable tab, que es un data frame

head(tab)
class(tab)

#Escribe el data.frame tab en un fichero de texto llamado "murders.world.txt" 
#separado por "\t", sin quotation y sin nombres de filas en tu directorio de trabajo:

write.table(tab,"murders.world.txt",quote=F,sep="\t",row.names=F)

