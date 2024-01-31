// Integrando
function y=f(x)
    y = x.**2 + exp(x)
endfunction

a=0;b=2

h = 0.0625
//h = (b-a)/(n-1)

n = (b-a)/h + 1

xi = linspace(a,b,n)' // dados em coluna

// Método do trapézio
disp(h/2*pesos_trap(n)*f(xi))

