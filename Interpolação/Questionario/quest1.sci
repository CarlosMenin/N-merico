xi =[2 3]
yi = [4 7]

p = polinterp(xi,yi,'x')

disp(horner(p,2.5))
