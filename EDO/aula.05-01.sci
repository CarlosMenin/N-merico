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

n = 100                    // numéro de aproximações no intervalo (0,2%pi]
xi = linspace(0,2*%pi,n+1) // nós do problema
h = 2*%pi/n                // espaçamento entre os nós

// Incialização da variável com as aproximações e a condição inicial
yi = zeros(2,n+1)

// Condição inicial
yi(:,1) = [1;0] 


for i=1:n
    yi(:,i+1) = euler(yi(:,i),xi(i),xi(i+1),f) 
end

// Gráfico da aproximação para y1
plot(xi,yi(1,:),'.k')
xgrid

// Gráfico da aproximação para y2
plot(xi,yi(2,:),'.r')
