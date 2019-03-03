dir1="C:/Users/Aturt/Desktop/Session3/Ejercicios"
dir.create(dir1)
setwd(dir1)

### Ejercicio #1: Construyendo nuestras propias funciones
#La suma de N enteros consecutivos a partir de 55 (excluyéndolo) es 738. Calcula N. 
#Pista: 1+...+n=sum_n=(a1+an)n/2
  
sum_n=function(a_1,a_n){
  n=a_n-a_1
  return(n*(a_1+a_n)/2)
}
sum_n(56,60)
sum_n(56,70)

#Anteriormente en el curso hemos creado una funcion para calcular las soluciones de una ecuación de segundo grado:
  
sol.quad=function(a,b,c){
  sol_1=(-b + sqrt(b^2 - 4*a*c) ) / ( 2*a )
  sol_2=(-b - sqrt(b^2 - 4*a*c) ) / ( 2*a )  
  return(c(sol_1,sol_2))
}

M=sol.quad(1,111,-1476)
M

M[1]
M[2]
#Como el enunciado preguntaba por un número natural la solución tiene que ser:
N=55+M[1]
N
