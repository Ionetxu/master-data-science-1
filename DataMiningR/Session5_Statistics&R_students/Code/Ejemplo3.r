#######################################################################
#           Ejemplo 3: El cumpleaños
#######################################################################
set.seed(1)
n <- 15
bdays <- sample(1:365, n, replace = TRUE)

any(duplicated(bdays))


#Vamos a estimar esta probabilidad repitiendo lo mismo muchas veces:
  

same_birthday <- function(n){
  bdays <- sample(1:365, n, replace=TRUE)
  any(duplicated(bdays))
}
B <- 10000
results <- replicate(B, same_birthday(15))
mean(results)


#Que pasaría si lo estuviéramos haciendo para un grupo de 50 personas?

B <- 10000
results <- replicate(B, same_birthday(50))
mean(results)

#Tendemos a subestimar la probabilidad. Pero claro, si tuvieramos un grupo de casi 365 individuos si que esperariamos esta probabilidad ser tan alta: 
  

compute_prob <- function(n, B=10000){
  results <- replicate(B, same_birthday(n))
  mean(results)
}

n <- seq(1,60)
prob <- sapply(n, compute_prob)


#Y podemos plotear la probabilidad de que dos personas tengan el mismo cumpleaños en un grupo de tamaño $n$:
  

prob <- sapply(n, compute_prob)
qplot(n, prob)
