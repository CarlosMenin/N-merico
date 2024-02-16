function y=f(x)
    y = sin(x) + 1
endfunction

xi = [0:0.1:1]'

//ln(C*exp(a*x) = ln(c) + ax
fi = log(f(xi))

Phi = ones(xi)
Phi(:,2) = xi

a_til = (Phi'*Phi)\(Phi'*fi)

a = a_til

a(1) = exp(a(1))

disp(a)
