// Definição do lado direito da EDO

m=1;g=10;l=1

function dz=f(t,z)
  dz(1)=z(2)
  dz(2)=-(g/l)*sin(z(1)) //-0.01*z(2)+0.1*sin(sqrt(10)*t);
endfunction

// Solução no intervalo [0,8] via Runge-Kutta clássico de 4 estágios.
// aproximações em 4000 pontos uniformemente espaçados.
n= 4000
// Condição inicial (em t0=0)
z0 = [%pi-0.01;0]

// A variável z guarda as aproximações para a solução ao longo do 
// intervalo
z = ode_int(z0,0,8,f,n,RK4)

// As variáveis o e vo correpondem respectivamente às aproximações para o 
// ângulo e a velocidade angular
o  = z(1,:)
vo = z(2,:)

// Visualização dos dados

// Gráfico da solução aproximada o(t)
t = linspace(0,8,n+1)
scf(0)
plot(t,o)
xgrid

// Gráfico do espaço de fase o x vo
scf(1)
plot(o,vo)
xgrid

// A energia mecânica total deve ser uma constante.
// O vetor Emec guarda a energia mecânica total. 
Emec= (1/2)*m*(l*vo).^2 - g*l*cos(o)

// O gráfico abaixo contém informação sobre o erro relativo
// no valor da energia mecância total.
// Emec(1) cooresponde ao valor da energia que é conservada
// Podemos notar que a variação é pequena mas existe.
scf(2)
plot((Emec-Emec(1))/Emec(1),'-k')
xgrid
