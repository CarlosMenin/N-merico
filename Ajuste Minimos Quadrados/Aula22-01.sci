// Construção dos dados. Fazemos isso para estudar a técnica do ajuste. Em uma
// situação real temos apenas a função modelo e os dados.


// Função com a relação correta entre as variáveis
function y=f(x)
    y = 1.35*exp(x) - 2.71*cos(%pi*x) + 1.83*cos(3*%pi*x)
endfunction

// Valores para as coordenadas x dos dados
xi = linspace(0,2,400)'

// Valores para as coordenadas y dos dados
// Ajuste é feito para deixar o intervalo entre -2 e 2
// A função rand(xi) gera uma sequência pseudo-aleatória de número entre 0 e 1
// então o termo utilizado 2*(2*rand(xi)-1) gera uma sequência pseudo-aleatória
// entre -2 e 2 simulando a situação de incerteza de natureza experimental
fi = f(xi) + 2*(2*rand(xi)-1)

// Agora temos o nosso ponto de partida que são os dados (xi,fi) e a função
// modelo
// phi(x) = a(1)*exp(x) - a(2)*cos(%pi*x) + a(3)*cos(3*%pi*x)

// Matriz Phi do ajuste
Phi = [exp(xi),cos(%pi*xi),cos(3*%pi*xi)]
//Phi = [ones(xi),xi,xi.**2,xi.**3]

// Ajuste de mínimos quadrados
a = (Phi'*Phi)\(Phi'*fi)

// A função ajustada
function y=f_aj(x)
    y = a(1)*exp(x) + a(2)*cos(%pi*x) + a(3)*cos(3*%pi*x)
endfunction

p = polfit(xi',fi',3)

// Visualização dos resultados

scf(0)
plot(xi,fi,'k.')        // Dados do problema
plot(xi, f(xi), 'b-')   // Relação exata entre x e y (desconhecida/inacessível)
plot(xi,f_aj(xi),'r-')  // Função modelo ajustada
//plot(xi,f_aj(xi),'g-')  // Função modelo ajustada
plot(xi,horner(p,xi),'y-')
