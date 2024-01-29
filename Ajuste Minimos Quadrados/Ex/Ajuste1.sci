fi_til = log(fi)

Phi = ones(xi)
Phi(:,2) = xi

a_til = (Phi'*Phi)\(Phi'*fi_til)

a = a_til

// Precisa inverter de volta
a(1) = exp(a_til(1))

disp(a)

resp = a(1)*exp(a(2)*xi)

norma = (norm(fi - resp),2)

disp(norma**2)
