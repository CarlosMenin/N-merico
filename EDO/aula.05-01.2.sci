/* 
Construção de n aproximações entre 0 e 2*%pi

Neste exemplo, o código produz apenas o valor da aproximação em x=2*%pi. Aqui
não guardaremos os valores intermediários mas apenas o valor da última 
aproximação.

A solução exata dor problema é y(x)=cos(x).
*/


// Função do lado direito da EDO

function dy=f(x,y)
    dy(1) =  y(2)
    dy(2) = -y(1)
endfunction

// Vamos aproximar no intervalo [0,2*%pi] com n aproximações

n = 1000                    // numéro de aproximações no intervalo (0,2%pi]
h = 2*%pi/n                // espaçamento entre os nós

// Incialização das variáveis a partir da condição inicial
xi = 0
yi = [1;0] 



for i=1:n
    yi = euler(yi,xi,xi+h,f)  // ou yi = yi + h*f(xi,yi)
    xi = xi + h
end

mprintf('\nO valor apropximado de y(2*\%%pi)\n')
mprintf('a partir de %d aproximações intermediárias é %.12e\n',n-1,yi(1))
