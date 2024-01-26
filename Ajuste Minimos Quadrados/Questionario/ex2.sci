function y=f(x)
    y = sin(x)
endfunction

xi = [0:0.1:1]'

fi = f(xi)

// Grau do polinomio usado no ajuste
grau = 2

// Matriz Phi do ajuste com base x^(j-1)
Phi = ones(xi)
Phi(:,2) = xi
for j = 3:grau+1
    Phi(:,j) = xi.**(j-1)
end

a = (Phi'*Phi)\(Phi'*fi)

p_aj = poly(a,'z','c')

disp(p_aj)
