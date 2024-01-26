function y=f(x)
    y = sin(x) +1
endfunction

xi = [0:0.1:1]'

fi = f(xi) 

fi_til = log(fi)

Phi = ones(xi)
Phi(:,2) = xi

a_til = (Phi'*Phi)\(Phi'*fi_til)

a = a_til

// Precisa inverter de volta
a(1) = exp(a_til(1))

disp(a)

