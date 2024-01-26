function y=f(x)
    y = cos(x)
endfunction

xi = [0:0.1:1]'

fi = f(xi)

// Grau do polinomio usado no ajuste
grau = 2

// Matriz Phi do ajuste com base x^(j-1)
Phi = ones(xi)
// Tirando a variavel x de grau 1
Phi(:,grau) = xi.**(grau)


a = (Phi'*Phi)\(Phi'*fi)

disp(a)
