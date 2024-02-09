function [yf]=euler(y0,x0,xf,F)
/*
    Esta função integra a EDO y'=f(x,y) com condição inicial y(x0)=y0 
    através do método de Euler (1 estágio) no itervalo (x0,xf) em um passo.

    Sistemas de EDO também podem ser integrados através desta função,
    basta definir a função f como uma função R^(n+1)->R^n
    A saída fica armazenada na matriz coluna yf.
    
    Dados de entrada
    ––––––––––––––––
    y0     : condição inicial (pode ser uma lista)
    x0     : valor inicial da variável independente
    xf     : valor final da variável independente
    F      : lado direito da EDO. F deve possuir obrigatoriamente dois 
    argumentos, o primeiro deve ser a variável independente e o 
    segundo, a dependente

    Dados de saída
    ––––––––––––––
    yf: aproximação para y(xf)

    Variáveis auxiliares
    ––––––––––––––––––––
    h  : espaçamento entre os nós da integração.
    k1 : primeiro estágio
*/

// incialização 
    h = xf - x0

// 1 etapa
    k1 = F(x0,y0)

    yf = y0 + h*k1

endfunction
