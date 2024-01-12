yi = [75.97 75.42 75.33 75.28 75.26 75.26 75.30 75.37 75.46 75.58 75.74 75.94]
xi = [0 10 20 25 30 40 50 60 70 80 90 100]
p = polinterp(xi,yi,'x')

dp = derivat(p)

xp = linspace(0,100,1000)

//disp(roots(dp))

//plot(xp,horner(p,xp),'r-')
//plot(xi, horner(p,xi),'k.')

xn = [20 25 30 40 50]
yn = [75.33 75.28 75.26 75.26 75.30]

pn = polinterp(xn,yn,'x')

plot(xp,horner(pn,xp),'k-')

dn = derivat(pn)

disp(roots(dn))

// 34.612711

