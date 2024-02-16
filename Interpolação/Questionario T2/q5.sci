x = [1,2,3,4];
y = [3,4,7,6];

xi = x;
yi = y;

p = polinterp(xi,yi,'x')

x = horner(p,1.5)
disp(x)
