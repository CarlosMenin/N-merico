function [y]=pesos_trap(n)
 // Retorna uma matriz linha com n colunas formada pelos os pesos
 // utilizados na quadratura composta do trapézio.   
 y(1,1)=1;
 y(1,2:n-1)=2;
 y(1,n)=1;
endfunction

function [y]=pesos_simp(n)
 // Retorna uma matriz linha com n colunas formada pelos os pesos
 // utilizados na quadratura composta de Simpson. Observação: n deve
 // ser um número ímpar maior do que 1. 
 y(1,1)=1;
 for i=1:(n-3)/2
   y(1,2*i)=4;
   y(1,2*i+1)=2;
 end;
 y(1,n-1)=4;
 y(1,n)=1;
endfunction
