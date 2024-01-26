function y=f(x)
    y = sin(x)
endfunction

xi = [0:0.1:1]'

fi = f(xi)

// Grau do polinomio usado no ajuste
grau = 1

// Matriz Phi do ajuste com base x^(j-1)
Phi = ones(xi)
Phi(:,1) = xi

a = (Phi'*Phi)\(Phi'*fi)

p_aj = poly(a,'z','c')

disp(p_aj)
