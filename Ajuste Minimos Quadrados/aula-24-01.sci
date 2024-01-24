// Construção dos dados. Fazemos isso para estudar a 
// técnica do ajuste. Em uma situação real temos
// apenas a função modelo e os dados.

// Função com a relação correta entre as variáveis
function y = f(x)
    y  = 2.37*x.^(-3.13)
endfunction

// Valores para as coordenadas x dos dados
xi = linspace(1,3,400)' // é importanet que os dados estejam
                        // em matrizes coluna.

// Valores para as coordenadas y dos dados
// a função rand(xi) gera uma sequência pseudo-aleatória
// de nũmero entre 0 e 1. Então o termo utilizado
// 0.05*(2*rand(xi)-1) gera uma sequência pseudo-aleatória
// entre -0.05 e 0.05 simulando a situação de incerteza de natureza
// experimental. Usamos também neste exemplo a instrução
// rand('seed',1) para fixar a sequência pseudo-aleatória, caso
// contrário ela mudaria a cada execução.
rand('seed',1)
fi = f(xi) + 0.05*(2*rand(xi)-1)

fi_til = log(fi)

// Matriz Phi do ajuste
Phi = ones(400,2)
Phi(:,2) = log(xi)

// Coeficientes do ajuste linearizado
a_til = (Phi'*Phi)\(Phi'*fi_til)

// Coeficientes aproximados do ajuste de mínimos quadrados
a = a_til
a(1) = exp(a_til(1))

//plot(xi,fi,'k.')
plot(xi,f(xi),'k-')
plot(xi,a(1)*xi.^a(2),'r-')
xgrid
