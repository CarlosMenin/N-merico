xi =[1 2 3]
yi = [3 4 7]

p = polinterp(xi,yi,'x')

disp(horner(p,1.5))
