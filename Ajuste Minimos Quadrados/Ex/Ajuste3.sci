//ln(a1) + a2*ln(x) + a3*x
fi_til = log(fi)

Phi = ones(xi)
Phi(:,2) = log(xi)
Phi(:,3) = xi

a_til = (Phi'*Phi)\(Phi'*fi_til)

a = a_til

a(1) = exp(a_til(1))  

disp(a)

resp = a(1)*xi.**a(2).*exp(a(3)*xi)

norma = (norm(fi - resp),2)

disp(norma**2)


