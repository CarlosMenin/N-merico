// Vamos trabalhar com um conjunto aleatório de dados

n = 30

//xi = linspace(0,1,n)
//yi = rand(xi)

yi($) = yi(1) // força a periodicidade

clf()
plot(xi,yi,'k.') 


// not a knot
d1 = splin(xi,yi)

// natural
d2 = splin(xi,yi,'natural')

// completo
dy1 = (yi(2)- yi(1))/(xi(2)- xi(1))     // Aproximação para y'(x1)
dyn = (yi(n)- yi(n-1))/(xi(n)- xi(n-1)) // Aproximação para y'(xn)
d3 = splin(xi,yi,'clamped',[dy1,dyn])

//periodico
d4 = splin(xi,yi,'periodic')

x = linspace(0,1,1000)

plot(x,interp(x,xi,yi,d1,out_mode='natural'),'b-')
plot(x,interp(x,xi,yi,d2,out_mode='natural'),'r-')
plot(x,interp(x,xi,yi,d3,out_mode='natural'),'g-')
plot(x,interp(x,xi,yi,d4,out_mode='natural'),'k-')


