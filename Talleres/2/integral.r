f <- function(x){
  return(1+sin(3*x^3))
}
x <- seq(-2, 2, by=0.1)
y <- f(x)
plot(x,y)
curve(exp(1+sin(3*x^3)), -2, 2, xname = "x",col="blue")

trapezoid <- function(f, bot, top, n) {
  intval <- integrate(f,bot,top)
  val2 = intval$value
  h <- (top-bot)/n
  x <- seq(bot, top, by=h)
  y <- f(x)
  s <- h * (abs(y[1]/2) + abs(sum(y[2:n])) + abs(y[n+1]/2))
  suma <- h * (abs(y[1]/2) + abs(sum(y[2:n])) + abs(y[n+1]/2))
  cat("Integral trapecio: ",suma,"\n")
  error = abs(val2-suma)
  if (error == 0) {
    cat("Error trapecio: 0 ","\n")
  } else {
    cat("Error trapecio: ",error,"\n")
  }
  
}
#Parámetros

bot <--1          # Limite Inferior. 
top <- 1      # Limite Superior. 
tol <- 1e-8    # Error permitido 
n<- 5
trapezoid(f,-1,1,10)


simpsons.rule <- function(f, bot, top) {
  if (is.function(f) == FALSE) {
    stop('f must be a function with one parameter (variable)')
  }
  
  h <- (top - bot) / 2
  x0 <- bot
  x1 <- bot + h
  x2 <- top
  
  s <- (h / 3) * (f(x0) + 4 * f(x1) + f(x2))
  
  return(s)
}

simpsons.rule(f, -1, 1)