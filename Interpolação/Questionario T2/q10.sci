x = [5,6];

L1 = poly([6],'x')/(5-6)
L2 = poly([5],'x')/(6-5)

disp(3*horner(L1,5) + 4*horner(L2,5))
disp(3*horner(L1,5.5) + 4*horner(L2,5.5))
disp(3*horner(L1,6) + 4*horner(L2,6))
