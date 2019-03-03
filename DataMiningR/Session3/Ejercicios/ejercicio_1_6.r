### Ejercicio #6: *which(),match(),%in%* y operaciones con vectores numéricos. 
#Usando el data.frame transport que ya tienes en tu entorno de trabajo:
  
#Qué años cubrió la estadística?

min(transport$time)
max(transport$time)


#En que pais se produjo un mayor incremento del uso del coche en este período? 

#definimos un mini data.frame que contenga solo los datos de uso de coche en 1990 
#y otro para 2016
car.1990=transport[transport$time==1990 &transport$vehicle=="CAR",]
car.2016=transport[transport$time==2016 &transport$vehicle=="CAR",]

# con la función %in% comprobamos si todos los paises
# para los que hay dato en 1990 tienen datos en 2016
car.1990$geo %in% car.2016$geo 

#ahora tenemos que ordenar los dos data.frames de la misma forma
# buscamos, para los paises ordenados como en car.1990,
# cuales son sus posiciones en car.2016
ix=match(car.1990$geo,car.2016$geo)

#Ahora ya podemos restar los dos vectores 
#porque los paises estan en el mismo orden
diff.rates=car.2016$values[ix]-car.1990$values

#podemos calcular el índice del de mayor diferencia
max(diff.rates)
which.max(diff.rates)

#y podemos ver a que pais corresponde
car.1990$geo[which.max(diff.rates)]


#En que paises ha descendido el uso del coche?
  
which(diff.rates<0)

neg.count=car.1990$geo[which(diff.rates<0)]

neg.count

car.tr <- transport[transport$geo == "TR" & transport$vehicle == "CAR",]
car.uk <- transport[transport$geo == "UK" & transport$vehicle == "CAR",]

plot(car.tr$time, car.tr$values, ylim=c(0,100))
lines(car.tr$time, car.tr$values)
lines(car.uk$time, car.uk$values, col="red")

eu.car <- transport[transport$vehicle == "CAR",]
dummy <- aggregate(eu.car$values, by=list(eu.car$time), mean)
lines(dummy, lty=2)
