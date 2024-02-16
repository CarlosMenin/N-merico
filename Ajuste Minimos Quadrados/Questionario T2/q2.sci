function y=f(x)
    y=sin(x)
endfunction

xi = [0:0.1:1]'

fi = f(xi)

Phi = ones(xi)
Phi(:,2) = xi
Phi(:,3) = xi.^2

a = (Phi'*Phi)\(Phi'*fi)

disp(a)

