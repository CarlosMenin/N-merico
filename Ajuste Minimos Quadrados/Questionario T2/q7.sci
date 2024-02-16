function y=f(x)
    y = sin(x) + 1
endfunction

xi = [0:0.1:1]'

//1/(a+bx) = 1/1/(a+bx) = a + bx
fi = 1./f(xi)

Phi = ones(xi)
Phi(:,2) = xi

a_til = (Phi'*Phi)\(Phi'*fi)

a = a_til

disp(a)
