x=[0, 1, 2, 3, 5, 7, 8, 10]'
y=[8, 5, 4, 2, 1, 2, 4,7]'

// Grau do polinomio usado no ajuste
grau = 3

// Matriz Phi do ajuste com base x^(j-1)
Phi = ones(x)
Phi(:,2) = x
for j = 3:grau+1
    Phi(:,j) = x.**(j-1)
end

a = (Phi'*Phi)\(Phi'*y)

p_aj = poly(a,'z','c')

disp(p_aj)

