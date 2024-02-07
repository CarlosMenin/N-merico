// Definição do lado direito da EDO

m=1;g=10;l=1

function dz=f(t,z)
  dz(1)=z(2);
  dz(2)=-(g/l)*sin(z(1)); //-0.01*z(2)+0.1*sin(sqrt(10)*t);
endfunction

// Solução no intervalo [0,8] via Dormand-Prince.
//[z_sol,zh,rej,rejp]=dopri5([%pi-0.01;0],0,8,f,rtol=1d-8,atol=1d-8);

// Solução no intervalo [0,8] via ode solver do Scilab.
// aproximações em 4000 pontos uniformemente espaçados.
z_sol=ode([%pi-0.01;0],0,linspace(0,8,4001),1d-7,1d-9,f);

// Solução no intervalo [0,8] via Runge-Kutta clássico de 4 estágios.
// aproximações em 4000 pontos uniformemente espaçados.
n=4000
h=(8-0)/n
z_sol=zeros(2,n+1)
z_sol(:,1)=[%pi-0.01;0]
t=0
for i=1:n
    z_sol(:,i+1)=RK4(z_sol(:,i),t,t+h,f)
    t=t+h
end

scf(0);
plot(z_sol(1,:),z_sol(2,:),'.');
xgrid;

o=z_sol(1,:);
vo=z_sol(2,:);

// A energia mecânica total deve ser uma constante.
// O vetor Emec guarda a energia mecânica total. 

Emec= (1/2)*m*(l*vo).^2 - g*l*cos(o);



scf(1);

// Podemos notar que a variação é pequena mas existe.

//plot((Emec-Emec(1))/Emec(1));
plot((Emec-Emec(1))/Emec(1),'-k');
xgrid;


//scf(2)
//plot(zh);
//plot(zh,'-r');
//xgrid;
