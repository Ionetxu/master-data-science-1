### Ejercicio #4: Ordenando vectores numéricos. which & which.min
#Accede al dataset "murders" del paquete *dslabs*
library(dslabs)

#cuando accedemos a un dataset contenido en un paquete de R 
#los datos se cargan en R en un data.frame de nombre el del dataset
#mediante la funcion data()
data(murders)
str(murders)

#Cual es el estado con el menor número de asesinatos? 

#Buscamos el estado con el menor número de asesinatos (variable total)
which.min(murders$total)
#accedemos al elemento del vector $state que contiene el menor valor de murders
murders$state[which.min(murders$total)]

#Es el más seguro?
  
#Para responder a esta pregunta tenemos que calcular el ratio de asesinatos por cada 100.000 habitantes 
#y buscar el estado con el minimo ratio.

murders=data.frame(murders,rate=murders$total/murders$population*100000)
murders[which.min(murders$rate),]
murders$state[which.min(murders$rate)]
