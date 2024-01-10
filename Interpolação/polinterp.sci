function y=polinterp(no_x,no_y,var_pol) 
// O polinômio é construído a partir da forma de Lagrange.

// Variáveis de entrada.

// no_x      -> matriz linha com as coordenadas x dos nós da interpolação.
// no_y      -> matriz linha com as coordenadas y dos nós da interpolação.
// var_pol   -> variável formal para o polinômio (deve ser uma string).

// Variável de saída.

// y      -> polinômio interpolante (objeto do tipo polinômio).

// Variáveis auxiliares

// n           -> quantidade de pontos a serem interpolados.
// C           -> matriz coluna das constantes normalizadoras dos polinômios de Lagrange.
// i           -> índice de linha.
// j           -> índice de coluna.
// zero_Lpol_i -> zeros do i-ésimo polinômio de Lagrange.
// Lpol        -> matriz coluna com os polinômios de Lagrange.

// Checagem e inicialização

    if size(no_x,2)<>size(no_y,2)|size(no_x,1)<>1  then
        error('Dimensão dos dados incorreta!',5)
    end
    
    if ~isdef('var_pol','local') then
        var_pol = %z
    end
    
    if ~(type(var_pol)==10 & isequal(size(var_pol),[1 1])) then
        error('A variável formal deve ser uma string (escalar)!',2)
    end
    
    n=size(no_x,2)
    C=ones(n,1)
 
// Determinação das constantes normalizadoras
    for i=1:n
        for j=1:n
            if i~=j then
              C(i)=C(i)/(no_x(i)-no_x(1,j))
            end
        end
    end
  
// construção dos n polinômios de Lagrange
    for i=1:n
        zero_Lpol_i=no_x
        zero_Lpol_i(i)=[]
        Lpol(i)=C(i)*poly(zero_Lpol_i,var_pol)
    end
  
// construção do polinômio interpolante
    y=no_y*Lpol

endfunction
