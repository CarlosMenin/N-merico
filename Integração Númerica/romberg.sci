function [Rmm,R]=romberg(f,a,b,m)
/*    
Calcula a integral da função f no intervalo [a,b] através do  método de Romberg.

Dados de entrada
f: integrando.
a: extremo inferior do intervalo de integração.
b: extremo superior do intervalo de integração.
m: número de quadraturas compostas utilizadas na aproximação.

Dados de saída
R:   matriz com as aproximações de Romberg. A aproximação final é R(m,m).
Rmm: aproximação final
*/
  h2=(b-a)/2;             // metade do intervalo incial.
  T0=h2*(f(a)+f(b));      // regra simples do trapézio 
  T(1)=0.5*T0+h2*f(a+h2); // regra composta do trapézio com 3 pontos·

  for i=2:m               // Laço para o vetor T. T(i) é a aproximação
    h(i)=(b-a)*2^(-i);    // via regra composta do trapézio com (2^m)+1 pontos.
    T(i)=0.5*T(i-1)+h(i)*sum(feval(a+(2*(1:(2^(i-1)))-1)*h(i),f));
  end;

  R(1,1)=(4*T(1)-T0)/3;    
  for j=2:m               // Laço para a matriz R.
    R(j,1)=(4*T(j)-T(j-1))/3;
  end;
  for n=2:m
    for j=n:m
      R(j,n)=((4^n)*R(j,n-1)-R(j-1,n-1))/((4^n)-1);
    end;
  end;
  Rmm = R($,$)
  
endfunction

