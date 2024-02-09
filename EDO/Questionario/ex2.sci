/*
u' = u*t


*/
function du=f(u,t)
    du(1) = u*t
endfunction

h = 0.1 
n = (2-1)/h                    
              

xi = 1
yi = 0.1 

for i=1:n
    yi = EulerA(yi,xi,xi+h,f)  // ou yi = yi + h*f(xi,yi)
    xi = xi + h
end

disp(yi)
