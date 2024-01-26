function y=f(x)
    y = sin(x)
endfunction

xi = [0:0.1:1]'

fi = f(xi)

// Matriz Phi do ajuste com base x^(j-1)
Phi = ones(xi)
Phi(:,2) = xi

a = (Phi'*Phi)\(Phi'*fi)

p_aj = poly(a,'z','c')

disp(p_aj)
