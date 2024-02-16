x = [1,2,3,4];
y = [3,4,7,6];

xi = [2,3];
yi = [4,7];

p = polinterp(xi,yi,'x')

x = horner(p,2.5)
disp(x)
