function du=f(t,u)
    du(1) = sin(u)
endfunction

n = 100
h = (2-0)/n                   
              

xi = 0
yi = 1 

for i=1:n
    yi = EulerA(yi,xi,xi+h,f)  // ou yi = yi + h*f(xi,yi)
    xi = xi + h
end

disp(yi)
