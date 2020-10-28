clc;
clear all;
close all;
clear vars;
%%

DirBase='D:\BACK UP FELIPE PALTA\DATOS 1\Trabajo UTAP\Clases Dictadas\9. Materias a dictar semestre II-2020\Modulo 1\Inteligencia Artificial\BaseDatosNumeros\Numero 9';
cd(DirBase);


%%

TipoImg='.png';

Archivos=dir('*.png');

CarctN9=zeros(4,20);

for i=1:length(Archivos)
    
    NombreTemp=num2str(i);
    
    NombreImagen=strcat(NombreTemp,TipoImg);
    
    Itemp=imread(NombreImagen);
    
    DirBase='D:\BACK UP FELIPE PALTA\DATOS 1\Trabajo UTAP\Clases Dictadas\9. Materias a dictar semestre II-2020\Modulo 1\Inteligencia Artificial\Scripts Matlab';
    cd(DirBase);
    
    [C1,C2,C3,C4,vectorCarct] = ExtractorCarctIMG(Itemp);
    
    CarctN9(:,i)=vectorCarct;
    
    DirBase='D:\BACK UP FELIPE PALTA\DATOS 1\Trabajo UTAP\Clases Dictadas\9. Materias a dictar semestre II-2020\Modulo 1\Inteligencia Artificial\BaseDatosNumeros\Numero 9';
    cd(DirBase);
   
end





