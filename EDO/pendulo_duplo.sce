// Sistema pêndulo duplo

// Constantes do sistema
m=1;g=10;l=1

// Definição do lado direito da EDO

function dz=f(t,z)
  aux=1/(1+sin(z(1)-z(3))^2) // Variável auxiliar.
  
  dz(1)=z(2)
  dz(2)=-aux*( sin(z(1)-z(3))*(cos(z(1)-z(3))*z(2)^2 + z(4)^2)  +  g/(2*l)*(3*sin(z(1))+sin(z(1)-2*z(3))) )
  dz(3)=z(4)
  dz(4)=aux*sin(z(1)-z(3))*( cos(z(1)-z(3))*z(4)^2 + 2*z(2)^2 + (2*g/l)*cos(z(1)) )
endfunction

// Condição Inicial
z0=[%pi/2;0;%pi/2;0]  // Ãngulos iniciais de 90°. 

// Integração numérica da EDO no intervalo t, (0,20) com intervalo de tempo
// 0,001.
h=0.001
n=(20-0)/h
sol=zeros(4,n+1)
sol(:,1)=z0
t=0
for i=1:n
    sol(:,i+1)=RK4(sol(:,i),t,t+h,f)
    t=t+h
end

// Variáveis introduzidas para guardar o resultado da integração
o1=sol(1,:)
vo1=sol(2,:)
o2=sol(3,:)
vo2=sol(4,:)
clear sol; // como o resultado está guardado nas variáveis o,vo,l e vl, podemos 
           // liberar memória limpando a variável sol.
           
// A energia mecânica total é constante (no caso da solução exata).
// O vetor Emec guarda a energia mecânica. 
// Obs.: a constante 1 foi adicionada à energia mecânica para evitar que a energia total seja nula
// Se Emec=0 teríamos problemas para medir o erro relativo.
Emec=(m*l^2)/2*( 2*vo1^2 + vo2^2 + 2*cos(o1-o2).*vo1.*vo2) - m*g*l*(2*cos(o1) + cos(o2)) +1

// Podemos notar que a variação é pequena mas existe.
plot((Emec-Emec(1))/Emec(1))
xgrid

