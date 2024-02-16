function y=f(x)
    y = sin(sin(sin(x)))
endfunction


format('v',14)
disp(int_gl(f,0,10,3,64))
