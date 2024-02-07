function sol=ode_int(F,y0,a,b,n,ode_met)

// Esta função integra a EDO y'=f(x,y) com condição inicial y(x0)=y0 
// através do método explícito definido pela variável ode_met no itervalo 
// (x0,xf) em n passos.
//
// Sistemas de EDO também podem ser integrados através desta função,
// basta definir a função f como uma função R^(n+1)->R^n
// A saída é uma lista cujo primeiro elemento são os valores da
// variável independente e o segundo, os valores das aproximações.
// 
// Dados de entrada
// ––––––––––––––––
// F : lado direito da EDO. F deve possuir obrigatoriamente dois 
// argumentos, o primeiro deve ser a variável independente e o 
// segundo, a dependente
// y0: condição inicial (pode ser uma lista)
// a : valor inicial da variável independente
// b : valor final da variável independente
// n : quantidade de passos para chegar a "a" partindo de "b"
// 
// Dados de saída
// ––––––––––––––
// sol: lista cujo primeiro elemento são os valores da
// variável independente e o segundo, os valores das aproximações
//
// Variáveis auxiliares
// ––––––––––––––––––––
// h  : espaçamento entre os nós da integração.
// yi : aproximação calculada no i-ésimo passo
// x  : valores da variável independente
// y  ; valores das aproxcimações 

// incialização ////////////////////////////////////////////////////////////////
    h  = (b-a)/n
    yi = y0

    x      = linspace(a,b,n+1) 
    y      = zeros(y0)
    y(:,1) = yi

// Cálculo das aproximações/////////////////////////////////////////////////////
    for i=1:n
        yi       = ode_met(yi,x(i),x(i)+h,F)
        y(:,i+1) = yi
    end
    sol = list(x,y)
endfunction
