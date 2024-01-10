function y=f(x)
    y = 1./(1+25*x.**2)
endfunction

n = 21; i = 1:n
x = linspace(-1,1,n)

//pontos de Chebyshev
xi = -cos(%pi*(2*i-1)/(2*n))
yi = f(xi)

p = polinterp(xi,yi,'x')

plot(x,f(x),'k-')
plot(xi,yi,'k.')
plot(x,horner(p,x),'r-')
xgrid;

//spline cubico "not a knot"

di = splin(xi,yi)
plot(x,interp(x,xi,yi,di),'b-')
