function R=romberg_data(data,hm,m)
// Através do método de Romberg, calcula uma aproximação para a integral de uma 
// função a partir de seu valor em um conjunto discreto de pontos com
// espaçamento uniforme hm.
//
// Dados de entrada
// dados: matriz linha com os valores da função.
// hm: espaçamento uniforme entre os pontos.
// m: número de quadraturas compostas utilizadas na aproximação.
//
// Observação: é necessário que a variável "dados" contenha 2^k+1 componentes, 
// onde k é um número natural maior ou igual a m. 
// 
// Dados de saída
// R: matriz com as aproximações de Romberg. A aproximação final é 
// R(m,m).

  T(m+1)=hm*(0.5*(data(1)+data($))+sum(data(2:$-1)));

  for i=m:-1:1               // Laço para o vetor T. T(i) é a aproximação
    h(i)=hm*2^(m+1-i);    // via regra composta do trapézio com (2^m)+1 pontos.
    T(i)=2*T(i+1)-h(i)*sum(data(2^(m-i)+1:2^(m+1-i):$));
  end;

  for j=1:m               // Laço para a matriz R.
    R(j,1)=(4*T(j+1)-T(j))/3;
  end;
  for n=2:m
    for j=n:m
      R(j,n)=((4^n)*R(j,n-1)-R(j-1,n-1))/((4^n)-1);
    end;
  end;
  
endfunction

