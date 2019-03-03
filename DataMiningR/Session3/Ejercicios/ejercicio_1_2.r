### Ejercicio #2: Accediendo a los elementos de un data.frame y de un vector
# Para cuantos tipos de vehiculos tenemos informacion en esta tabla?

#en primer lugar leemos el fichero utilizando la función read.delim 
#y asignamos a la variable transport el data.frame generado

getwd()
transport=read.delim(file = "EU.Stats.transport.txt"
                     ,header=T,sep="\t")
# revisamos la estructura de este data.frame para saber que variables contiene y de que tipo
str(transport)
#accedemos a los primeros valores de la variable vehicle
head(transport$vehicle)
#al ser una variable de tipo factor podemos ver sus niveles utilizando la función levels
levels(transport$vehicle)
length(levels(transport$vehicle))

#RECOMENDADO: Podríamos haber leído el archivo activando la función utilizando el parametro *stringsAsFactors=F*. En ese caso la forma de encontrar la solución sería:

#en primer lugar leemos el fichero utilizando la función read.delim 
#y asignamos a la variable transport el data.frame generado
transport=read.delim(file = paste(dir1,"EU.Stats.transport.txt",sep="/"),
                     header=T,
                     sep="\t",
                     stringsAsFactors = F)
# revisamos la estructura de este data.frame para saber que variables contiene 
#y de que tipo
str(transport)
#accedemos a los primeros valores de la variable vehicle
head(transport$vehicle)
#la función unique nos devuelve los elementos únicos de un vector 
#y length() nos da el tamaño de un vector
length(unique(transport$vehicle))

#Cuantos años tenemos reportados para cada pais?
length(unique(transport$time))

#Cual es el valor del uso del tren en Austria en 1990?
  
#generamos un vector lógico z que contiene TRUE si se cumplen las tres condiciones 
#y FALSE si no.
z<-transport$vehicle=="TRN" & transport$geo=="AT" & transport$time=="1990"
head(z)
#which nos devuelve los índices que son TRUE de un vector lógico
which(z)
#podemos utilizar este índice para acceder a los datos del data.frame 
#transport que cumplan esa condicion
transport[which(z),]
#como la variable values es un vector podemos acceder al valor que 
#queremos directamente usando el indice
transport$values[which(z)]

