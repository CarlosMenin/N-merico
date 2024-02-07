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

sol = ode_int(f,[1;0],0,2*%pi,n,RK4)

yi = sol(2) // soluções aproximadas ao longo do intervalo
yf = yi(:,$)     // aproximação no último nó, ou seja, para y(2*%pi)

mprintf('\nO valor apropximado de y(2*\%%pi)\n')
mprintf('a partir de %d aproximações intermediárias é %.12e\n',n-1,yf)
