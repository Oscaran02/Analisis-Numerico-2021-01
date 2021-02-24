library("Rmpfr")
#variables y valores
p0=2; p1; tol=10E-57; n=100; bits=180;

#funcion f(x) 
f=function(x) (673.5542865/x)*(1-exp(-0.146843*x))-40
#funcion f'(x)
df= function(x) ((exp(-0.146843*x))*((98.9067*x)-673.5542865*(exp(0.146843*x))+673.5542865))/(x*x)


#ciclo for
for(i in 1: n){
  p1 <- mpfr(p0, bits)-mpfr(f(mpfr(p0, bits)), bits)/mpfr(df(mpfr(p0, bits)), bits)
  error<-mpfr(abs(mpfr(p1, bits)-mpfr(p0, bits)), bits)
  #print(c(i, p0, p1, error)); 
  cat ("\nIteracion", i,"\n")
  print (error)
  
  if(error<tol){
    cat("\nSolucion converge en ", i, " iteraciones. \nRaiz ")
    print (p1)
    cat("\n\n")
    
    stop()
  }

  p0 <- p1
}

cat("Maximo numero de iteraciones alcanzadas!!!")

