function y=f(x)
    y = exp(x)
endfunction

xi = [-2 -1 0 1 2]
yi = f(xi)

p = polinterp(xi,yi,'x')

disp(horner(p,0.5))
