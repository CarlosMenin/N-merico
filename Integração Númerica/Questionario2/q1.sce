function y=f(x)
    y = sin(sin(sin(x)))
endfunction

disp(int_gl(f,0,10,2,2))
