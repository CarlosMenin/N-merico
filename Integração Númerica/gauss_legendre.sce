function [xi,Ci] = gauss_legendre(n)
    //Pesos e nós da quadratura Gauss-Legendre no intervalo (-1,1)
    
    //Dados de entrada
    // n: quantidade de nós
    
    // Dado de saída
    // Xi: nós da quaderatura em uma matriz coluna
    // Ci: pesos da quadratura em uma matriz linha
    
    // Cálculo dos nós (algoritmo Golub-Welsch) ////////////////////////////////
    beta_i  = zeros(1,n)                   // beta_i: beta: componentes da 
                                           // diagonal principal da matriz de Jacobi
    alpha_i = 1./sqrt( 4 - (1:n-1).^(-2) ) // alpha_i: componentes das diagonais 
                                           // imediatamente e abaixo da principal 
                                           // na matriz de Jacobi
                                        
    J = diag(alpha_i,1) + diag(alpha_i,-1) // Matriz de Jacobi
    J = J + +diag(beta_i)
    [phi,lambda] = spec(J)                 // autovalores e autovetores de J
    x = diag(lambda)                       // autovalores (fora de ordem)
    [xi,i] = gsort(x,'g','i')              // xi: zeros de P_{n}} em ordem
    
    // Cálculo dos pesos ///////////////////////////////////////////////////////
    mu0 = 2                                // mu0: momento zero da função peso
    Ci  = mu0*phi(1,i).^2                  // Ci: pesos
endfunction
