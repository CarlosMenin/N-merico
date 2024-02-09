/*

u'' + (e^-u' -1) + 5*(e^-u -1) = sin(2*t)
u(1) = 0 e u'(1) = 0

Logo,
y1(t) = u(t), y2 = u'(t)

y1'(t) = y2(t)
y2'(t) = sin(2*t) -((e^y2 -1) + 5*(e^y1 -1))

*/

function dy=f(x,y)
    dy(1) = y(2)
    dy(2) = sin(2*x) + 6 - exp(-y(2)) - 5*exp(-y(1))
endfunction


h = 0.001
n = (3.5 - 1)/h

x = 1
y = [0;0]

for i=1:n
    y = Heun(y,x,x+h,f)  // ou yi = yi + h*f(xi,yi)
    x = x + h
end

disp(x)
disp(y(1))
