function y=ode_int(y0,x0,xf,F,n,ode_met)
/*
    Esta função integra a EDO y'=f(x,y) com condição inicial y(x0)=y0 
    através do método explícito definido pela variável ode_met no itervalo 
    (x0,xf) em n passos.
    Sistemas de EDO também podem ser integrados através desta função,
    basta definir a função f como uma função R^(n+1)->R^n
    A saída é uma lista cujo primeiro elemento são os valores da
    variável independente e o segundo, os valores das aproximações.
    
    Dados de entrada
    ––––––––––––––––
    y0     : condição inicial (pode ser uma lista)
    x0     : valor inicial da variável independente
    xf     : valor final da variável independente
    F      : lado direito da EDO. F deve possuir obrigatoriamente dois 
    argumentos, o primeiro deve ser a variável independente e o 
    segundo, a dependente
    n      : quantidade de passos para chegar a "a" partindo de "b"
    ode_met: meodo utilizado na integração da EDO 
    
    Dados de saída
    ––––––––––––––
    y: aproximação para a solução da EDO nos nós

    Variáveis auxiliares
    ––––––––––––––––––––
    h: espaçamento entre os nós da integração
    x: valores da variável independente (nós)
    
*/
// incialização ////////////////////////////////////////////////////////////////
    h      = (xf-x0)/n
    x      = linspace(x0,xf,n+1) 
    y      = zeros(size(y0,1),n+1)
    y(:,1) = y0

// Cálculo das aproximações/////////////////////////////////////////////////////
    for i=1:n
        y(:,i+1) = ode_met(y(:,i),x(i),x(i)+h,F)
    end

endfunction
