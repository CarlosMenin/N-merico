//(x - 6)*(x - 7)*(x - 8)
//
C = (9-6)*(9-7)*(9-8)

p = poly([6 7 8],'x')/C
disp(C)
disp(p)

disp(horner(p,9))
