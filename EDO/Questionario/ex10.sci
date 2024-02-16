//y1 = v
//y2 = w

// Definição do lado direito da EDO
function dy=f(x, y)
    dy(1) = y(1) - 1/3*y(1)^3 - y(2) + sin(3*x)
    dy(2) = 0.1*y(1) + 0.07 -0.08*y(2)
endfunction

//  
h = 0.05
n = (75-0)/h

// condição inicial
x = 0
y = [1;0]

// Cálculo das aproximações (Runge-Kutta Clássico de 4 estágios)
for i=1:n
    y = RK4(y,x,x+h,f)
    x = x + h
end
disp(y(1)+y(2))
