function [C1,C2,C3,C4,vectorCarct] = ExtractorCarctIMG(I)

%CONVERSIÓN DE LA IMAGEN DE ENTRADA RGB A ESCALA DE GRISES Y DE UNA VEZ
%COMPLEMENTO
IesG=imcomplement(rgb2gray(I));

%EXTRACCIÓN DEL # DE FILAS Y EL # DE COLUMNAS DE LA IMAGEN 
[f,c]=size(IesG);

%CALCULO DEL LARGO Y ANCHO DE CADA CUADRANTE
ladofila=ceil(f/2);
ladocolumna=ceil(c/2);

%EXTRACCIÓN DE CADA UNO DE LOS 4 CUADRANTES
C1=IesG(1:ladofila,1:ladocolumna);

C2=IesG(1:ladofila,ladocolumna+1:c);

C3=IesG(ladofila+1:f,1:ladocolumna);

C4=IesG(ladofila+1:f,ladocolumna+1:c);

%EXTRACCIÓN DE LOS 4 PROMEDIOS DE LOS 4 CUADRANTES:

promeC1=mean(C1(:));
promeC2=mean(C2(:));
promeC3=mean(C3(:));
promeC4=mean(C4(:));

vectorCarct=[promeC1;promeC2;promeC3;promeC4];

end

