library(tidyverse)
library(dslabs)
data(heights)

#Usando dplyr producimos una nueva variable que contiene las alturas de los chicos
x <- heights %>% filter(sex=="Male") %>% .$height

#Para cualquier valor, podemos encontrar la proporción de individuos de nuestra #muestra que tienen una altura por debajo de un cierto valor.

# Definimos una función empírica de distribución SÓLO UTILIZANDO NUESTRA MUESTRA
# Es la función de distribución empírica

F <- function(a) mean(x<=a)

# Cuál es la probabilidad de que uno de los chicos de nuestra muestra
# mida menos de 70 inches?
F(70)

# Cuál es la probabilidad de que uno de los chicos de nuestra muestra
# mida más de 70 inches? (Sabemos que una función de distribución suma a 1)
1 - F(70)

# Cuál es la probabilidad de que uno de los chicos de nuestra muestra
# mida entre 80 y 70 inches? (Sabemos que una función de distribución suma a 1)
F(80)-F(70)

