### Ejercicio #7: *dplyr()*, *aggregate()* y primer plot

#Usando el data.frame *transport* selecciona los datos correspondientes a la serie temporal 
#(ie años y valores) de uso del coche en UK y en TR.

uk.ts.data=transport %>% select(vehicle,geo,time,values) %>% filter(vehicle=="CAR") %>% filter(geo=="UK") %>% select(time,values)
tr.ts.data=transport %>% select(vehicle,geo,time,values) %>% filter(vehicle=="CAR") %>% filter(geo=="TR") %>% select(time,values)


#Dibuja sus tendencias

plot(uk.ts.data,pch=".",ylim=c(25,90))
lines(uk.ts.data)
lines(tr.ts.data,lty=2)

#Utiliza la función *aggregate* para obtener la media del uso del coche a traves delos distintos paises de la UE entre 1990 y 2016 y pintalo.

#nos centramos en los datos de uso de coche
ue.car=transport[which(transport$vehicle=="CAR"),]
#explora la sintaxis de la función aggregate()
? aggregate
#esta función pide como primer argumento el vector de datos que queremos sumarizar (i.e. values)
#como segundo el vector por el que queremos agregar (i.e. time). Se lo tenemos que proporcionar como una lista:list(transport$time)
#finalmente le damos la funcion que queremos usar para agregar, en este caso mean.
#adicionalmente le pasaríamos, separados por comas, parametros de dicha función de agregación
ue.car.ts=aggregate(ue.car$values,by=list(ue.car$time),mean)
head(ue.car.ts)

#Pinta las tendencias de los dos paises y la media de la UE (en rojo)

plot(uk.ts.data,pch=".",ylim=c(25,90))
lines(uk.ts.data)
lines(tr.ts.data,lty=2)
lines(ue.car.ts,col="red")