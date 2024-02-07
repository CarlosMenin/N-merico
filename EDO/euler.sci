function [y]=euler(y0,x0,xf,f)

// Esta função integra a EDO y'=f(x,y) com condição inicial y(x0)=y0 
// através do método de Euler no itervalo (x0,xf) em um passo.
//
// Sistemas de EDO também podem ser integrados através desta função,
// basta definir a função f como uma função R^(n+1)->R^n
// A saída fica armazenada na matriz coluna y.
// 
// Variáveis auxiliares
// h  : espaçamento entre os nós da integração.
// k1 : primeira etapa do método de Euler. 

// incialização 

h=xf-x0

// 1 etapa
    k1=f(x0,y0)

    y=y0+h*k1

endfunction
