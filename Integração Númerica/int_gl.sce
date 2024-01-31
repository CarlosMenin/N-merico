function I=int_gl(f,a,b,n,m)
    /* 
        Aproxima a integral definida de f no intervalo [a,b] através
        da composição de quadraturas de Gauss-Legendre com n pontos
        em m subinteravalos
        
        Variáveis de entrada
        f: inetgrando
        a: extremidade inferior do intervalo de integração
        b: extremidade superior do intervalo de integração
        n: nós em cada subintervalo
        m: número de subintervalos
        
        Variáveis de saída
        I: aproximação da integral
        
        Variáveis auxiliares
        yi: nós da quadratura no intervalo (-1,1)
        Ci: pesos da quadratura
        h:  comprimento dos subintervalos 
        x:  extremidade inferior dos subintervalos
    */
    
    // Incialização das variáveis
    [yi,Ci] = gauss_legendre(n)
    h = (b-a)/m
    x = linspace(a,b,m+1)'
    I = 0
    
    // Cálculo da aproximação
    for i=1:m
        I = I + Ci*f(x(i) + (h*yi+h)/2)
    end
    I = h/2 * I
endfunction
