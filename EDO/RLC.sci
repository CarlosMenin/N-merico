/* 
Construção de n aproximações entre 0 e 2*%pi

Neste exemplo, o código produz apenas o valor da aproximação em x=2*%pi. Aqui
não guardaremos os valores intermediários mas apenas o valor da última 
aproximação.

A solução exata dor problema é y(x)=cos(x).

v = -(v'' + v'/RC)*LC
y(1) = v
y(2) = v'
Logo, dy(1) = y(2)
dy(2) = -y(2)/(R*C) - y(1)/(L*C)
*/


R = 125
L = 200e-3
C = 5e-6

// Função do lado direito da EDO

function dy=f(x,y)
    dy(1) = y(2)
    dy(2) = -y(2)/(R*C) - y(1)/(L*C)
endfunction

// Vamos aproximar no intervalo [0,2*%pi] com n aproximações

n = 10                    // numéro de aproximações no intervalo (0,2%pi]
h = 0.001/n                // espaçamento entre os nós

// Incialização das variáveis a partir da condição inicial
xi = 0
yi = [25;-0.3] 


sol = ode_int(yi,0,10,f,10,euler)

disp(sol)

yi = sol(2) // soluções aproximadas ao longo do intervalo
yf = yi(:,$)     // aproximação no último nó, ou seja, para y(2*%pi)


mprintf('\nO valor apropximado de y(0.001)\n')
mprintf('a partir de %d aproximações intermediárias é %.12e\n',n-1,yf)
