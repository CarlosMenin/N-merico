a = 2; b = 3                                 // extremidades da integral
xi = [2,2.05,2.1,2.2,2.4,2.6,2.8,2.9,2.95,3] // nós da quadratura

// Construção das matrizes A e E
A = ones(10,10)
E = zeros(10,1)

//A(2,:) = xi
//E(1) = b - a
//E(2) = (b**2 - a**2)/2
for i=1:10
    A(i,:) = xi.**(i-1)
    E(i) = (b**i - a**i)/i
end

// Cálculo dos pesos
Ci = A\E

// Aproximação
disp(Ci'*sin(5*xi')) // Como Ci é matriz coluna e xi matriz linha
                     // é necessário a transposição dos mesmos
                     // para que o produto corresponda ao somatório
                     // que aproxima a integral 
