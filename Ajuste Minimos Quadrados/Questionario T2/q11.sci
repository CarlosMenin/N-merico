x = [0,1,2,3,5,7,8,10]
y = [8,5,4,2,1,2,4,7]

xi = x'
yi = y'

Phi = [ones(xi), xi, xi.^2, xi.^3]

a = (Phi'*Phi)\(Phi'*yi)
p= poly(a,'z','c')

disp(norm((y-horner(p,x),2)))
