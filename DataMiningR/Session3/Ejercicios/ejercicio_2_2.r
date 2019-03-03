### Ejercicio #2: Repaso de *dplyr*
#Utilizando el data.frame *tab vamos a comparar as muertes violentas en europa 
#con las de USA contenidas en el data.frame murders

#Vuelve a cargar el data.frame murders del paquete *dslabs* y, 
#usando *mutate()*, añadele una columna rate que calcule para cada 
#estado el ratio de muertes por 100.000 habitantes
library(dslabs)
library(dplyr)

data(murders)
murders<-mutate(murders,rate=total/population*100000)

#Calcula la media del rate para todos los estados y genera un data.frame 
#que contenga solo una fila con el nombre del pais (USA), el año de la estadistica (2015) 
#y su rate de asesinatos por cada 100.000 habitantes

usa.murders<-data.frame(Country="USA",rate=mean(murders$rate),year=2015)

#Usando dplyr::filter() y dplyr::select() sobre el data.frame *tab* selecciona 
#los rates de asesinatos en paises europeos y quédate con las columnas country, rate y Yearlisted

#primero le cambiamos al data.frame tab el nombre de la primera columna para poderla manejar mejor
names(tab)
#names(tab) es un vector. Accedemos a su primer componente:
names(tab)[1]="country"
head(tab)

#cambiamos tambien "Yearlisted" by Year
names(tab)[6]="Year"

eu.murders<-tab %>%
  dplyr::filter(Region=="Europe")%>%
  dplyr::select(country,Rate,Year)
head(eu.murders)

#Usando las funciones *rbind()* and *cbind()* podemos unir rows (filas) o columnas de data.frames. 
#Para unir filas con rbind() tienen que tener el mismo nombre. MOdificamos los nombres de eu.murders 
#y unimos ambos data.frames

names(eu.murders)=names(usa.murders)

all.murders=rbind(eu.murders,usa.murders)

#Que paises de la UE tiene una mayor tasa de asesinatos que USA?

all.murders[which(all.murders$rate>usa.murders$rate),]
