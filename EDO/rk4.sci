function [y]=RK4(y0,x0,xf,f)

// Esta função integra a EDO y'=f(x,y) com condição incial y(x0)=y0 
// através do método Runge-Kutta Clássico (4 etapas) no itervalo (x0,xf)
// em um passo.
//
// Sistemas de EDO também podem ser integrados através desta função,
// basta definir a função f como uma função R^(n+1)->R^n
// A saída fica armazenada na matriz coluna y.
// 
// Variáveis auxiliares
// h  : espaçamento entre os nós da integração.
// k1 : primeira etapa do método Runge-Kutta Clássico. 
// k2 : segunda etapa do método Runge-Kutta Clássico.
// k3 : terceira etapa do método Runge-Kutta Clássico.
// k4 : quarta etapa do método Runge-Kutta Clássico.

// incialização. 

h=xf-x0

// 4 etapas
    k1=f(x0,y0)
    k2=f(x0+0.5*h,y0+0.5*h*k1)
    k3=f(x0+0.5*h,y0+0.5*h*k2)
    k4=f(x0+h,y0+h*k3)

    y=y0+h/6*(k1+2*(k2+k3)+k4)

endfunction
