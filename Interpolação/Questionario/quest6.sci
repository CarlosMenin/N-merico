xi =[1 2 3 4]
yi = [3 4 7 6]

p = polinterp(xi,yi,'x')

disp(horner(p,4.1))
