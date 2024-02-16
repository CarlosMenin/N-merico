x = [6,7,8,9];
y = [3,4,7,6];

L4 = poly([6 7 8],'x')/((9-8)*(9-7)*(9-6))

disp(horner(L4,6))
disp(horner(L4,7))
disp(horner(L4,8))
disp(horner(L4,9))
