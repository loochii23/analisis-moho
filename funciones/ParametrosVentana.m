function [FlagImg,TotalAncho,TotalAlto,ladoROI,deltaROI] = ParametrosVentana(ladoROI,deltaROI,Img)

%EXTRAER EL # FILAS, # DE COLUMNAS Y CAPAS DE LA IMAGEN:
[f,c,capas]=size(Img);

%IDENTIFICACIÓN DE SI LA IMG ES ESCALA DE GRISES O RGB
switch capas
    case 1 %SI ENTRA LA IMG ES ESCALA DE GRISES
        FlagImg=0;
    case 3 %SI ENTRA LA IMG ES RGB 
        FlagImg=1; 
end

%CALCULO DE EL ANCHO Y ALTO DE INSPECCIÓN (SE AUTOAJUSTA A CUALQUIER
%TAMAÑO DE IMAGEN):
TotalAncho=floor(((c-ladoROI)/deltaROI)+1);
TotalAlto=floor(((f-ladoROI)/deltaROI)+1);

end

