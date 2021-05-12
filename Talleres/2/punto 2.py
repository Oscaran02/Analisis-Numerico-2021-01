import numpy as np
from scipy.interpolate import lagrange
import matplotlib.pyplot as plt
from scipy import integrate

#Integral por el metodo de simpson
def simpson(pol,a,b,m):
    h = (b-a)/m
    s = 0
    x = a
    for i in  range(1, m):      
        s = s+2*(i%2+1)* pol(x+i*h)
    s = h/3 * (pol(a)+s+pol(b))
    return s

#Integral por el metodo de trapecios
def trapecios(pol,a,b,m):
    h = (b-a)/m
    s = 0
    for i in range(1,m):
        s = s+pol(a+i*h)
    r = h/2*(pol(a)+2*s+pol(b))

    return r
        
#Llenar los arreglos y definir datos
x=np.array([0 , 0.2, 0.4, 0.6, 0.8])
y=np.array([3.592, 3.110, 3.017, 2.865, 2.658])
bot = 0
top = 0.8
n = 20
rombergEx = 2

#Interpolacion para hallar polinomio
pol=lagrange(x,y)
print('x:',x)
print('y:',y)
print('El polinomio es: ')
print(pol)

xs=np.linspace(x.min(),x.max())
ys=pol(xs)

#Grafica de la funcion
plt.plot(x,y,'o')
plt.ylabel('y')
plt.xlabel('x')
plt.axis([0,1,0,4])
plt.plot(xs,ys,':')
plt.grid(True)
plt.text(0.3, 0.5, pol)
plt.show()

#Llamado a funciones de integrales 
print('\n Trapecios \n')
for i in range(1, n+1):
    print( i,'  ', trapecios(pol,bot, top,i))
print('\n \n Simpson \n ')
for j in range(1, n+1):
    print( j,'  ', simpson(pol, bot, top, j))
#Llamado a la integral de romberg para evaluar hasta con grado 2
print('\n \n Romberg \n \n', integrate.romberg(pol, bot, top, divmax=rombergEx), '\n \n')