// Definição do integrando
function y=f(x)
    y = sin(sin(sin(x)))
endfunction

// Cálculo da quadratura no intervalo [0,10] através de Gauss-Legendre
// com dois nós em cento e vinte e oito subintervalos
// (antes é necessário executar o arquivo gauss_legendre.sce)

I = int_gl(f,0,10,2,128)
mprintf('%.11e\n',I)
