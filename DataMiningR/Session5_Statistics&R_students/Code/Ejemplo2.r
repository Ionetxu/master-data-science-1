####################################################################################
#    Ejemplo 2: Simulando datos de funciones de probabilidad y de distribucion
####################################################################################
#rbinom(n, size, prob)

r.binom<-rbinom(1000,100,0.5)

#rmultinom(n, size, prob)
r.multi<-rmultinom(1000, 5, rep(0.2,5))

#rhyper(nn, m, n, k)
r.hyper<-rhyper(1000,2,3,2)

#rpois(n, lambda)
r.pois<-rpois(1000,1)

#### PINtar
par(mfrow=c(2,2))
hist(r.binom)
hist(r.multi)
hist(r.hyper)
hist(r.pois)


#Vamos a aumentar los tamaños muestrales. 

#rbinom(n, size, prob)

r.binom<-rbinom(100000,100,0.5)

#rmultinom(n, size, prob)
r.multi<-rmultinom(100000, 4, c(0.1,0.1,0.1,0.1))

#rhyper(nn, m, n, k)
r.hyper<-rhyper(100000,2,3,2)

#rpois(n, lambda)
r.pois<-rpois(100000,1)

par(mfrow=c(2,2))
hist(r.binom)
hist(r.multi)
hist(r.hyper)
hist(r.pois)

###################### vamos a pintar las funciones de distribución
library(ggplot2)
library(gridExtra)
bin<-data.frame(x=r.binom,y=pbinom(r.binom,100,0.5))
g1<-ggplot(bin, aes(x, y)) + geom_line()


hyper<-data.frame(x=r.hyper,y=phyper(r.hyper,2,3,2))
g2<-ggplot(hyper, aes(x, y)) + geom_line()


poisson<-data.frame(x=r.pois,y=ppois(r.pois,1))
g3<-ggplot(poisson, aes(x, y)) + geom_line()

grid.arrange(g1, g2, g3,nrow = 2)
