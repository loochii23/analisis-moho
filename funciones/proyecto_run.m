I=imread('I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\dataset_moho\dataset-completo\002.jpg');
I=rgb2gray(I);
[FlagImg,TotalAncho,TotalAlto,ladoROI,deltaROI] = ParametrosVentana(131,10,I);
[ImgDescom,Coordtemp] = ExtraerROIs(TotalAncho,TotalAlto,I,ladoROI,deltaROI);
[Nfig,Resultadof] = InferenciaFINAL_RNA_SW(1,I,TotalAlto,TotalAncho,Coordtemp,ImgDescom,miREDFinal);