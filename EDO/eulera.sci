function [y]=EulerA(y0,x0,xf,f)

// Esta função integra a EDO y'=f(x,y) com condição incial y(x0)=y0 
// através do método Euler Aperfeiçoado (2 etapas) no itervalo (x0,xf)
// em um passo.
//
// Sistemas de EDO também podem ser integrados através desta função,
// basta definir a função f como uma função R^(n+1)->R^n
// A saída fica armazenada na matriz coluna y.
// 
// Variáveis auxiliares
// h  : espaçamento entre os nós da integração.
// k1 : primeira etapa do método Euler Aperfeiçoado. 
// k2 : segunda etapa do método Euler Aperfeiçoado.

// incialização.

h=xf-x0

// 2 etapas
    k1=f(x0,y0)
    k2=f(x0+h,y0+h*k1)

    y=y0+0.5*h*(k1+k2)

endfunction
