
// Matriz Phi do ajuste com base x^(j-1)
Phi(:,1) = xi
Phi(:,2) = xi.**2
Phi(:,3) = xi.**3

a = (Phi'*Phi)\(Phi'*fi)

disp(a)

resp = a(1)*xi + a(2)*xi.**2 + a(3)*xi.**3

norma = (norm(fi - resp),2)

disp(norma**2)
