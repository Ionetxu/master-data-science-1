### Ejercicio #8: *dplyr()*
#Repite el ejercicio #4 usando *dplyr::mutate()*

murders<-murders %>% mutate(rate=total/population*100000)
# similarmente
murders<-mutate(murders,rate=total/population*100000)
#no olvideis asignarle a murders la nueva variable

murders[which.min(murders$rate),]
murders$state[which.min(murders$rate)]
