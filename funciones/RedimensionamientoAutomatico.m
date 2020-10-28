clc;
clear all;
close all;
clear vars;
%%

DirBase='C:\Users\Felipe Palta\Downloads\PruebaRedimensionamiento';
cd(DirBase);

%%

TipoImg='.jpg'; %CAMBIAR LA EXTENSIÓN

Archivos=dir('*.jpg'); %CAMBIAR LA EXTENSIÓN

Encabezado='Colombia'; %% CAMBIAR LA BASE DEPENDIENDO COMO LO HAYAN LLAMADO

P1=' ('; %MANTENER IGUALES
P2=')'; %MANTENER IGUALES

L=length(Archivos); %CUANTOS ARCHIVOS DE FORMATO (EL QUE HAYA QUEDADO CON ARCHIVOS)

%% ALMACENAR LOS TAMAÑOS DE CADA IMAGEN

Dimensiones=zeros(L,2);

for i=1:L
    
    NombreTemp=num2str(i);
    NombreImagen=strcat(Encabezado,P1);
    NombreImagen=strcat(NombreImagen,NombreTemp);
    NombreImagen=strcat(NombreImagen,P2);
    NombreImagen=strcat(NombreImagen,TipoImg);
    
    
    Itemp=imread(NombreImagen);
    
    [f,c,cap]=size(Itemp);
    
    Dimensiones(i,1)=f;
    Dimensiones(i,2)=c;
    
    
end


%% REDIMENSIONAR LAS IMAGENES

EncabezadoFinal='ColombiaRedim';


f_deseada=980;
c_deseada=1440;

for i=1:L
    
    NombreTemp=num2str(i);
    NombreImagen=strcat(Encabezado,P1);
    NombreImagen=strcat(NombreImagen,NombreTemp);
    NombreImagen=strcat(NombreImagen,P2);
    NombreImagen=strcat(NombreImagen,TipoImg);
    
    DirBase='C:\Users\Felipe Palta\Downloads\PruebaRedimensionamiento';
    cd(DirBase);
    
    Itemp=imread(NombreImagen);
    
    B=imresize(Itemp,[f_deseada c_deseada]);
    
    %CAMBIAR EL PATH PARA GUARDAR LA IMAGEN:
    
    DirBase='C:\Users\Felipe Palta\Downloads\PruebaRedimensionamiento\ImgsRedimensionadas';
    cd(DirBase);
    
    NombreImagen2=strcat(EncabezadoFinal,NombreTemp);
    NombreImagen2=strcat(NombreImagen2,TipoImg);
    
    imwrite(B,NombreImagen2);
    
    
end
