library(dslabs)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(readr)

######################### plots básicos ############################

####### scatterplot
data(murders)
?plot
plot(murders$total,murders$population/10^5)

#cambio de símbolos
plot(murders$total,murders$population/10^5,pch="*")

#cambio de color
plot(murders$total,murders$population/10^5,pch="*",col="red")

#si queremos añadir un plot a otro
plot(murders$total,murders$population/10^5,pch="*",col="red")
par(new=T)
plot(murders$total,murders$population/10^5,pch="o")

#o usando points/lines
plot(murders$total,murders$population/10^5,pch="*",col="red")
points(murders$total,murders$population/10^5,lty=2)
abline(a=0,b=1,lty=2)
lm(murders$population/10^5~murders$total)
abline(a=9.138, b=0.28, col="red")

### Histograms
hist(murders$total)
murders$total.bin[which(murders$total>400 & murders$total<=600)]=600

#binarizamos para comprobar la interpretación del plot
murders$total.bin=murders$total
murders$total.bin[which(murders$total<=200)]=200
murders$total.bin[which(murders$total>200 & murders$total<=400)]=400
murders$total.bin[which(murders$total>600 & murders$total<=800)]=800
murders$total.bin[which(murders$total>800 & murders$total<=1000)]=1000
murders$total.bin[which(murders$total>1000 & murders$total<=1200)]=1200
murders$total.bin[which(murders$total>1200 & murders$total<=1400)]=1400
table(murders$total.bin)

#usando un loop
murders$total.bin=murders$total
for (i in 1:7){
  murders$total.bin[which(murders$total>200*(i-1) & murders$total<=200*i)]=200*i
}
table(murders$total.bin)

# visualizar probabilidades en lugar de frecuencias
hist(murders$total,freq = F)

### Boxplot
boxplot(murders$total)

summary(murders$total)

boxplot(murders$total~murders$region)

murders.west<-filter(murders,region=="West")
murders.west[which.max(murders.west$total),]
