x = [0,1,2,3,5,7,8,10]
y = [8,5,4,2,1,2,4,7]

xi = x'
yi = y'

Phi = ones(xi)
Phi(:,2) = xi
Phi(:,3) = xi.^2

a = (Phi'*Phi)\(Phi'*yi)

disp(a)
