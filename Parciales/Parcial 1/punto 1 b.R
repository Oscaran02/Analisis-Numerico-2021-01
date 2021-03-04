#variables y valores
n <- 4
suma <- 0
error <- 0
Matriz <- matrix(1:100, nrow = n, ncol = n)


#ciclo for
for(i in 1: n){
  for (j in 1: n){
    suma = suma + Matriz[i,j]
    error = error+0.1
  }
}
  cat("Suma ",suma," Error ",error)


 

