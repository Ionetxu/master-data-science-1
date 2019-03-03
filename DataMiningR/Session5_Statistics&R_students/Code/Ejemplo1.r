################################################################################
#                   ejemplo 1: simulando las probabilidades de una urna
#             Incertidumbre del sampleado. La muestra frente a la población
################################################################################

beads <- rep( c("red", "blue"), times = c(2,3))
beads

B<-1000
realizaciones<-replicate(B,sample(beads,1,replace=T))
table(realizaciones)
prop.table(table(realizaciones))

#Habriamos acertado tanto con solo 10 realizaciones?
B<-10
realizaciones<-replicate(B,sample(beads,1,replace=T))
table(realizaciones)
prop.table(table(realizaciones))

#Generamos 100 muestras de tamaño 10 a ver cómo de consistentes son los resultados

B<-10
x10<-numeric()
for (i in 1:100){
  realizaciones<-replicate(B,sample(beads,1,replace=T))
  x10<-rbind(x10,prop.table(table(realizaciones)))
}

#Hacemos lo mismo con muestras de 100 y de 1000 elementos

B<-100
x100<-numeric()
for (i in 1:100){
  realizaciones<-replicate(B,sample(beads,1))
  x100<-rbind(x100,prop.table(table(realizaciones)))
}

B<-1000
x1000<-numeric()
for (i in 1:1000){
  realizaciones<-replicate(B,sample(beads,1))
  x1000<-rbind(x1000,prop.table(table(realizaciones)))
}

#Representamos las tres muestras de tamaños 10,100 y 1000 con un boxplot

boxplot(data.frame(x10,x100,x1000))
