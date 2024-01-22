function y=polfit(xi,fi,grad,var_pol)
  /* 
  Esta função calcula o ajuste de mínimos quadrados de um polinômio de grau definido 
  pela variável de entrada grad aos dados definidos pela variável de entrada (xi,fi).
  O método' utilizado nessa função evita os problemas de condicionamento quando as
  funções utilizadas no ajuste são polinômios.
 
  Variáveis de entrada
  xi      -> matriz linha com as coordenadas x dos dados para ajuste
  fi      -> matriz linha com as coordenadas y dos dados para ajuste
  grad    -> grau do polinômio a ser ajustado
  var_pol -> variável formal para o polinômio (deve ser uma string)

  Variável de saída
  y -> polinômio ajustado (objeto do tipo polinômio).

  Varáveis auxiliares
  n - > quantidade de dados
  alpha        -> coeficientes da relação de recorrência para os polinômios ortogonais
  beta_        -> coeficientes da relação de recorrência para os polinômios ortogonais
  vecpol       -> matriz linha com os polinômios ortogonais
  phi_i        -> valor do polinômio vecpol(i)
  a            -> fator ajustado
  phi_i_minus1 -> valor do polinômio vecpol(i-1)
  phi_i_minus2 -> valor do polinômio vecpol(i-2)

  */

  // Checagem e inicialização

  if size(xi,2)<>size(fi,2)|size(xi,1)<>1  then
    error('Dimensão dos dados incorreta!',5)
  end

  if grad<0 | imag(grad)>0 | (type(grad)<>1 & type(grad)<>8)
    error('O grau deve ser un inteiro positivo')
  else 
    grad = uint32(grad)
  end

  if ~isdef('var_pol','local') then
    var_pol = 'z'
  elseif ~(type(var_pol)==10 & isequal(size(var_pol),[1 1])) then
    error('A variável formal deve ser uma string (escalar)!',2)
  end

  grad   = uint32(grad)
  n      = size(xi,2)
  alpha  = sum(xi)/n
  vecpol = [1,poly(alpha,var_pol), zeros(1,grad-2)] 

  // Construção do polinômio interpolante 
  
  // Contribuição do termo de grau 0 (i=1)
  y = sum(fi)/n
    
  // Contrbuição do termo de grau 1 (i=2)
  phi_i = horner(vecpol(2),xi)
  a     = (fi*phi_i')/(phi_i*phi_i')
  y     = y + a*vecpol(2)

  // Contribuição do termo de grau 2 (i=3)
  alpha     = ( (xi.*phi_i)*phi_i' )/(phi_i*phi_i')
  beta_      = sum(xi.*phi_i)/n
  vecpol(3) = poly(alpha,var_pol)*vecpol(2) - beta_
  
  phi_i = horner(vecpol(3),xi)
  a = (fi*phi_i')/(phi_i*phi_i')
  y = y + a*vecpol(3)
  
  // Contribuição dos demais termos
  for i = 4:grad+1
    phi_i_minus1 = horner(vecpol(i-1),xi)
    phi_i_minus2 = horner(vecpol(i-2),xi)
    alpha        = ( (xi.*phi_i_minus1)*phi_i_minus1' )/(phi_i_minus1*phi_i_minus1')
    beta_        = ((xi.*phi_i_minus1)*phi_i_minus2')/(phi_i_minus2*phi_i_minus2')
    vecpol(i)    = poly(alpha,var_pol)*vecpol(i-1) - beta_*vecpol(i-2)

    phi_i = horner(vecpol(i),xi)
    a     = (fi*phi_i')/(phi_i*phi_i')
    y     = y + a*vecpol(i)
  end
endfunction
