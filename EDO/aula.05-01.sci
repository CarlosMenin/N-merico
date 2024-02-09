/* 
Construção de n aproximações entre 0 e 2*%pi

Neste exemplo o código produz a sequência de valores das variáveis independentes
xi nas quais as aproximações foram calculadas, incluindo a condição inicial, e 
a sequencia de aproximações yi que inclui a condição inicial. Portanto, xi é uma
matriz linha com n+1 colunas e yi uma matriz 2 x (n+1) (dois linhas pois a 
solução assume valores no R²).

A solução exata dor problema é y(x)=cos(x).
*/


// Função do lado direito da EDO

function dy=f(x,y)
    dy(1) =  y(2)
    dy(2) = -y(1)
endfunction

// Vamos aproximar no intervalo [0,2*%pi] com n aproximações
n  = 100

// Condição inicial (em x0=0)
y0 = [1;0]

// Cáculo das aproximações 
xi = linspace(0,2*%pi,n+1)
yi = ode_int(y0,0,2*%pi,f,n,euler)


// Gráfico da aproximação para y1 (primeira componente de yi)
plot(xi,yi(1,:),'.k')
xgrid

// Gráfico da aproximação para y2 (seguda componente de yi)
plot(xi,yi(2,:),'.r')
