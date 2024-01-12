//Construindo L1
//(x-6)/(5-6)
p1 = poly([6],'x')/(5-6)

// Construindo L2
//(x-5)/(6-5)
p2 = poly([5],'x')/(6-5)

p3 = 3*p1 + 4*p2

disp(horner(p3,5))
disp(horner(p3,5.5))
disp(horner(p3,6))
