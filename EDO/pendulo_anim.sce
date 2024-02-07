// Este código realiza a animação dos dados gerados na integração numérico das equações para o pêndulo elástico.
// As variáveis utilizadas são as mesmas definidas no arquivo pendulo_l_variavel.sce



///////////////////////////////////////////////////////////////////////////////////////////////////////
// Leitura e processamento dos dados contidos nas variáveis "o" (ângulo) e "l" (comprimento do eixo).//
///////////////////////////////////////////////////////////////////////////////////////////////////////
an_l=l(1:10:$) // cada quadro pula 10*h unidades de tempo.
an_o=o(1:10:$)

dados=[an_l.*sin(an_o);-an_l.*cos(an_o)]' // a matriz dados guarda as coordenadas cartesianas utilizadas na animação. 

clear an_l; clear an_o // limpeza dos dados desnecessários.

num_q=size(dados,1) // quantidade de quadros na animação.

int_coord_x=[min(dados(:,1));max(dados(:,1))];          // intervalo na coordenada x para animação.
int_coord_y=[min(dados(:,2));max([max(dados(:,2)),0])]; // intervalo na coordenada y para animação.
//int_coord_x=[-1;1]
//int_coord_y=[-1;1]


//an_o1=o1(1:10:10000);
//an_o2=o2(1:10:10000);

//dados=[l*(sin(an_o1)+sin(an_o2));-l*(cos(an_o1)+cos(an_o2))]';

//clear an_o1; clear an_o2;

///////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////////////////////
// Abertura da janela gráfica e animação //////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

// A animação é formada pela exibição de duas composições gráficas (dois gráficos distintos).
// O 1º gráfico é formada pela adição de pontos nas posições ocupadas pelo corpo ao longo do tempo
// criando um rastro das posições ocupadas pelo corpo ao longo do tempo.
// O 2º gráfico é formado por um segmento de reta ligando a origem ao corpo. Este elemento representa o
// eixo do pêndulo. Neste caso, o elemento gráfico é atualizado a cada quadro.
// 
// Como não são criadas novas janelas gráficas, o resultado dos comandos "plot" são enviados
// à mesma janela gráfica. 


// Abre janela gráfica e atribui manipuladores à janela e às propriedades dos eixos coordenados.
fig=scf()
eixos=gca()

eixos.isoview="on"                          // mantêm as proporções 1:1.
eixos.data_bounds=[int_coord_x,int_coord_y] // altera as dimensões da janela.
xgrid                                       // desenha um reticulado.

drawlater // Suspende a exibição das alterações na janela gráfica.                           


// Desenha o 1º ponto e define as propriedades gráficas para os demais pontos:
// pontos na cor negra de tamanho 1pt
plot(dados(1,1),dados(1,2),'k.') // Adiciona a primeira composição gráfica à janela. Pontos em cor negra.
eixo=fig.children                // Define o manipulador do eixo.
compos=eixo.children             // Define o manipulador da composição.
ponto=compos.children            // Define o manipulador do 1º gráfico.
ponto.mark_size_unit="point"
ponto.mark_size=1
drawnow                          // Exibe a janela gráfica com as alterações.

plot([0 dados(1,1)],[0 dados(1,2)],'r-') // Adiciona a segunda composição gráfica à janela. Segmentos de reta na cor vermelha.
compos2=eixo.children(1)                 // Define o manipulador da composição. Trata-se da segunda composição (obs.: ordem decrescente).
ponto2=compos2.children                  // Define o manipulador do 2º gráfico.
ponto2.thickness=2                       // Altera a espessura da linha.

// Animação

for j=1:20
    for i=2:num_q
    drawlater                              // Suspende a exibição das alterações na janela gráfica.
      ponto.data(i,:)=dados(i,:)             // Atualiza a lista de pontos do 1º gráfico.
      ponto2.data=[0 0;dados(i,1) dados(i,2)]// Atualiza as coordenadas da reta no 2º gráfico.
      drawnow                                // Exibe a janela gráfica com as alterações.
    end
end



  
