// Construção dos dados. Fazemos isso para estudar a 
// técnica do ajuste. Em uma situação real temos
// apenas a função modelo e os dados.

// Função com a relação correta entre as variáveis
function y = f(x)
    y  = 1.35*exp(x) - 2.71*cos(%pi*x) + 1.83*cos(3*%pi*x)
endfunction

// Valores para as coordenadas x dos dados
xi = linspace(0,2,400)' // é importanet que os dados estejam
                        // em matrizes coluna.

// Valores para as coordenadas y dos dados
// a função rand(xi) gera uma sequência pseudo-aleatória
// de nũmero entre 0 e 1. Então o termo utilizado
// 2*(2*rand(xi)-1) gera uma sequência pseudo-aleatória
// entre -2 e 2 simulando a situação de incerteza de natureza
// experimental. Usamos também neste exemplo a instrução
// rand('seed',1) para fixar a sequência pseudo-aleatória, caso
// contrário ela mudaria a cada execução.
rand('seed',1)
fi = f(xi) + 2*(2*rand(xi)-1)

// Agora temos o nosso ponto de partida que são
// os dados (xi,fi) e a função modelo 1

// Grau do polinomio usado no ajuste
grau = 12

// Matriz Phi do ajuste com base x^(j-1)
Phi = ones(400,grau+1)
Phi(:,2) = xi
for j = 3:grau+1
    Phi(:,j) = xi.**(j-1)
end

a = (Phi'*Phi)\(Phi'*fi)

// c é usado para determinar que os valores de a sejam coeficientes
p_aj = poly(a,'z','c')

// Ajuste a partir da base com polinômios ortogonais
p_aj_ort = polfit(xi',fi',grau)

scf(0)
plot(xi,fi,'k.')
plot(xi,horner(p_aj,xi),'r-')
plot(xi,horner(p_aj_ort,xi),'b-')
xgrid

// Soma do quadrados dos resíduos em cada ajuste
// Quando conhecemos os coeficientes do ajuste, o vetor de resíduos é dado
// por Phi*a - fi

Q1 = norm(Phi*a-fi,2)^2
mprintf('Valor de Q para o ajuste na base x^(j-1): %.6e\n',Q1)
Q2 = norm((horner(p_aj_ort,xi)-fi),2)^2
mprintf('Valor de Q para o ajuste na base ortogonal: %.6e\n',Q2)
