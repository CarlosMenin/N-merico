function [y]=Heun(y0,x0,xf,f)

// Esta função integra a EDO y'=f(x,y) com condição incial y(x0)=y0 
// através do método de Heun (2 etapas) no intervalo (x0,xf)
// em um passo.
//
// Sistemas de EDO também podem ser integrados através desta função,
// basta definir a função f como uma função R^(n+1)->R^n
// A saída fica armazenada na matriz coluna y.
// 
// Variáveis auxiliares
// h  : espaçamento entre os nós da integração.
// k1 : primeira etapa do método de Heun. 
// k2 : segunda etapa do método de Heun.

// incialização.

h=xf-x0

// 2 etapas
    k1=f(x0,y0)
    k2=f(x0+2/3*h,y0+2/3*h*k1)

    y=y0+h/4*(k1+3*k2)

endfunction
