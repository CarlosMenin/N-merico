function y=f(x)
    y = exp(x)
endfunction

x = [-2, -1,0,1,2];
fi = f(x);

p = polinterp(x,fi,'x');

disp(horner(p,1))
