function y=f(x)
    y=sin(x)
endfunction

xi = [0:0.1:1]'

fi = f(xi)


Phi = xi


a = (Phi'*Phi)\(Phi'*fi)

disp(a)

