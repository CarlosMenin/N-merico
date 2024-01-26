function y=f(x)
    y = sin(x) +1
endfunction

xi = [0:0.1:1]'

fi = f(xi) 

fi_til = 1./fi

Phi = ones(xi)
Phi(:,2) = xi

a_til = (Phi'*Phi)\(Phi'*fi_til)

disp(a_til)
