?logLik
a<-3
a<-1
b<-1
c<--1
(-b+sqrt(b^2-4*a*c))/2
sol1<-(-b+sqrt(b^2-4*a*c))/2
sol2<-(-b-sqrt(b^2-4*a*c))/2
sol.quad=function(a,b,c){}
sol.quad=function(a,b,c){}
sol.quad=function(a,b,c){
sol1<-(-b+sqrt(b^2-4*a*c))/2
sol2<-(-b-sqrt(b^2-4*a*c))/2
return(c(sol1,sol2))
}
sol.quad(1,1,-1)
sol.quad(1,1,-1)[1]
ls()
getwd()
dir.create("C:/Users/Aturt/Documents/test")
warnings()
dir.create("C:/Users/Aturt/Desktop/test")
getwd()
setwd("C:/Users/Aturt/Desktop/test")
getwd)
getwd()
dir1<-getwd()
class(dir1)
class(sol1)
remove(a)
x<-c(3,2)
data("iris")
head(iris)
dim(iris)
levels(iris$Species)
sol.quad(1,1,-(2*683/55))
sol.quad(1,1,-(2*683))
install.packages("https://github.com/rafalab/dslabs")
install.packages("dslabs")
install.packages("eurostat")

library(eurostat)

transport=read.delim("datasets_R_basics/EU.stats.transport.txt", header = T, sep="\t")

class(transport)

class(transport$vehicle)

as.matrix(transport$vehicle)

b<-as.factor(c(1,2,3))

str(transport)

transport=read.delim("datasets_R_basics/EU.stats.transport.txt", header = T, sep="\t", stringsAsFactors = F)

view(transport)

geo.v<-transport$geo

z<-geo.v == "AT"

which(z)

identical(transport[["geo"]],geo.v)

table(geo.v)

table(transport$geo, transport$time, transport$vehicle)

sum(transport$geo == "AT" & transport$vehicle == "TRN" & transport$time == 1990)

i<-which(transport$geo == "AT" & transport$vehicle == "TRN" & transport$time == 1990)

transport[i,]

a<-c(3,2)
b<-c(1,1)
c(a,b)
cbind(a,b)

dummy<-data.frame(names=c("a","b","c"),age=c(23,1,3))

dummy

values<-transport$values

sort(values)[1:10]

order(values)[1:10] #indices

sort(values, decreasing = T)[1:10]

rank(values)[1:10] #posicion en el ranking

data.babies<-read.delim("datasets_R_Basics/babies.txt", header=T, sep="\t", stringsAsFactors = F)

head(data.babies)

view(data.babies)

sort(data.babies$bwt)[1]

sort(data.babies$bwt, decreasing=T)[1]

order(data.babies$bwt)[1]

data.babies[979,]

max(data.babies$bwt)
min(data.babies$bwt)
which.max(data.babies$bwt)
which.min(data.babies$bwt)

which(data.babies$bwt>100)
data.babies[which.min(data.babies$bwt),]
data.babies[which.max(data.babies$bwt),]

table(data.babies$smoke==0)

uw <- which(data.babies$bwt < 120)
nw <- which(data.babies$bwt >= 120)

bwt.cat = vector(length=length(data.babies$bwt))
bwt.cat[uw]<-"Underweight"
bwt.cat[nw]<-"Normal weight"
data.babies$bwt.cat=bwt.cat

sum(data.babies$bwt.cat == "Underweight" & data.babies$smoke == 0)

table(data.babies$bwt.cat, data.babies$smoke)

data.babies$gestation[which(data.babies$gestation == 999)] <- NA

which(is.na(data.babies$gestation))

data.babies <- mutate(data.babies,gest.wk=gestation/7)

filter(data.babies,gest.wk<30)

small.babies = select(data.babies,bwt, smoke, age, gest.wk)

data.babies %>% select(bwt, age, smoke, gest.wk) %>% filter(gest.wk<34)

tr <- transport %>% select(time,geo,vehicle,values) %>% filter(geo=="TR", vehicle=="CAR") %>% select(time,values)
uk <- transport %>% select(time,geo,vehicle,values) %>% filter(geo=="UK", vehicle=="CAR") %>% select(time,values)
plot(uk,pch=".",ylim=c(0,100))
lines(uk)
lines(tr,lty=2)
mean.eu.car <- aggregate(transport$values,by=list(transport$time),mean,na.rm=T)
lines(mean.eu.car,col="red")

murders$state[order(murders$total)][1]

murders <- mutate(murders, per100 = total/population * 100)

murders$state[order(murders$per100)][1]

aggregate(murders$total,by=list(murders$region),sum)
