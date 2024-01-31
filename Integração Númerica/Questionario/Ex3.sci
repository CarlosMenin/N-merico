// Integrando
function y=f(x)
    y = cos(2*x)
endfunction

a=2;b=3

i = 64;

n = i+1

h = (b-a)/(n-1)

xi = linspace(a,b,n)' // dados em coluna

//Método de Simpson
disp(h/3*pesos_simp(n)*f(xi))
