### Ejercicio #5: Vectores lógicos y el comando *table*

#Usando el dataset "babies"


#Cuantas madres eran smokers? cuantos bebes con peso por debajo de 120 nacieron de madres fumadoras?
#Sumando un vector lógico obtenemos el número de elementos del vector que cumplen una condicion. 
#Los TRUES se transforman en 1s y los FALSE en 0s.

sum(babies$smoke==0)
sum(babies$smoke==0 & babies$bwt< 120)

#Y de no fumadoras?

sum(babies$smoke==1)
sum(babies$smoke==1 & babies$bwt< 120)


#Responde a las mismas preguntas generando un vector con entradas UW para bebes con peso por debajo de 120 y NW para bebes mayores de 120. Después utilizando la función *table()* construye una tabla de contingencia con el numero de fumadores/no y de bebes UW/NW

bwt.cat=vector(length=length(babies$bwt))
bwt.cat[which(babies$bwt<120)]<-"UW"
bwt.cat[which(babies$bwt>=120)]<-"NW"

table(bwt.cat,babies$smoke)

#Identifica los valores "9" de la columna "smoke" y asígnales el valor *NA*. 
#Este valor significa que el data no se recogió y R es capaz de trabajar con él sabiéndolo. 

babies$smoke[which(babies$smoke==9)]=NA
# la función is.na() nos devuelve TRUE si la entrada de un vector 
# contiene un valor perdido
which(is.na(babies$smoke))

#Vuelve a calcular la tabla de contingencia

table(bwt.cat,babies$smoke)