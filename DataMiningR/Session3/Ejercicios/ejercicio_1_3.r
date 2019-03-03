### Ejercicio #3: Ordenando vectores numéricos. which & which.min
#Copia el dataset "babies.txt" en tu directorio de trabajo.

#Calcula el menor peso de un bebé recien nacido

#en primer lugar leemos el dataset babies utilizando la función read.delim()
# y la opcion stringsAsFactors=F
print(paste(dir1,"babies.txt",sep="/"))
babies=read.delim(paste(dir1,"babies.txt",sep="/")
                  ,header=T,sep="\t",stringsAsFactors = F)
#Opción 1: podemos obtener el menor peso de un bebe ordenando el vector babies$bwt 
head(sort(babies$bwt))
#y leyendo el primer elemento de ese nuevo vector ordenado 
sort(babies$bwt)[1]
#Opción 2: podemos obtener el index del menor elemento del vector ordenado
#de menor a mayor
order(babies$bwt)[1]
#Opción 3: podemos utilizar la función min y which.min
min(babies$bwt)
which.min(babies$bwt)

#En qué semana de gestación nació el bebé de menor peso?

#tenemos la edad gestacional medida en dias. 
#añadimos una columna al data.frame que sea la edad gestacional en semanas
babies=data.frame(babies,gestation.w=babies$gestation/7)
#ahora utilizamos el anterior indice para ver la edad gestacional de la madre
babies$gestation.w[which.min(babies$bwt)]

#Era la madre fumadora?
babies$smoke[which.min(babies$bwt)]

#Encuentra todos esos datos para el bebé de mayor peso
babies[which.max(babies$bwt),]


