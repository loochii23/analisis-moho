dirBase='I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\dataset_moho\ROI-moho';
cd(dirBase);

TipoImg='.jpg';

archivos=dir('*.jpg');
carctN1 = zeros(4, 11);
for i=1: length(archivos)
    
    nombreTemp=num2str(i);
    nombreImagen=strcat(nombreTemp, TipoImg);
    Itemp=imread(nombreImagen);  
    
    dirBase='I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\funciones';
    cd(dirBase);
    
    [C1,C2,C3,C4,vectorCarct] = ExtractorCarctIMG(Itemp);
    
    carctN1(:, i) = vectorCarct;
    dirBase='I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\dataset_moho\ROI-moho';
    cd(dirBase);
end

%segunda caracteristica

dirBase='I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\dataset_moho\ROI-No-moho';
cd(dirBase);

TipoImg='.jpg';

archivos=dir('*.jpg');
carctN2 = zeros(4, 11);
for i=1: length(archivos)
    
    nombreTemp=num2str(i);
    nombreImagen=strcat(nombreTemp, TipoImg);
    Itemp=imread(nombreImagen);  
    
    dirBase='I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\funciones';
    cd(dirBase);
    
    [C1,C2,C3,C4,vectorCarct] = ExtractorCarctIMG(Itemp);
    
    carctN2(:, i) = vectorCarct;
    dirBase='I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\dataset_moho\ROI-No-moho';
    cd(dirBase);
end

