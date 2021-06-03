library(deSolve)

LotVmod <- function (Tiempos, estado, Parm) {
  with(as.list(c(estado, Parm)), {
    dx = x*(alpha - beta*y)#ecuacion 1
    dy = -y*(gamma - delta*x)#ecuacion 2
    return(list(c(dx, dy)))#sistema
  })
}
mod <- function (Tiempos, estado, Parm) {
  with(as.list(c(estado, Parm)), {
    dx = x*(alpha - beta*y)#ecuacion 1
    dy = -y*(gamma - delta*x)#ecuacion 2
    return(list(c(dx, dy)))#sistema
  })
}

#Ejemplo
Parm <- c(alpha = 2, beta = .5, gamma = .2, delta = .6)
estado <- c(x = 10, y = 10)
Tiempos <- seq(0, 100, by = 1)

out <- as.data.frame(ode(func = LotVmod,
                         y = estado, 
                         parms = Parm, 
                         times = Tiempos))

matplot(out[,-1], type = "l",
        xlab = "time", ylab = "population")
legend("topright", c("Conejitos:presa", "Zorros:depredador"),
       lty = c(1,2), col = c(1,2), box.lwd = 0)

#####################
library(phaseR)
lotkaVolterra <- function(t, y, parameters) {
  x <- y[1]
  y <- y[2]
  lambda <- parameters[1]
  epsilon <- parameters[2]
  eta <- parameters[3]
  delta <- parameters[4]
  dy <- numeric(2)
  dy[1] <- lambda*x - epsilon*x*y
  dy[2] <- eta*x*y - delta*y
  list(dy)
}

lotkaVolterra.flowField <- flowField(lotkaVolterra,
                                     xlim = c(0, 5),
              ylim = c(0, 10),
               parameters = c(2, 1, 3, 2), 
              points = 19, add = FALSE)
grid()
lotkaVolterra.nullclines <- nullclines(lotkaVolterra, 
               xlim = c(-1, 5), ylim = c(-1, 10),
               parameters = c(2, 1, 3, 2),
               points = 500)
y0 <- matrix(c(1, 2, 2, 2, 3, 4), ncol = 2, nrow = 3,
             byrow = TRUE)
lotkaVolterra.trajectory <- trajectory(lotkaVolterra, 
                                       y0 = y0, 
                                       tlim = c(0,10),
               parameters = c(2, 1, 3, 2),
             col = rep("black", 3))


