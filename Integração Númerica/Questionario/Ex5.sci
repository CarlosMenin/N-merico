// Integrando
function y=f(x)
    y = sin(cos(2*x))
endfunction

a=2;b=3

i = 128;

n = i+1

h = (b-a)/(n-1)

xi = linspace(a,b,n)' // dados em coluna

//Método do trapézio
disp(h/2*pesos_trap(n)*f(xi))
