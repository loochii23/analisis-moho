clear;
imds = imageDatastore('I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\dataset_moho\dataset-completo\*.jpg');
imgs = readall (imds);

infoDataROIMoho = xlsread('I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\infoDataROI-moho.xlsx');
infoDataROINoMoho = xlsread('I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\infoDataROI-no-moho.xlsx');


for i=1: length(infoDataROIMoho)
    imageName=infoDataROIMoho(i,1);
    centroide(1,2)= infoDataROIMoho(i,2);
    centroide(1,1)= infoDataROIMoho(i,3);
    
    tempImage = imgs{imageName, 1};
    
    ROI = ExtractorROI(tempImage, centroide, 65);
    imwrite (ROI, strcat ('I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\dataset_moho\ROI-moho\', string(i), '.jpg'));
    dataSetROIMoho{i,1} = ROI;
    
end

for i=1: length(infoDataROINoMoho)
    imageName=infoDataROINoMoho(i,1);
    centroide(1,2)= infoDataROINoMoho(i,2);
    centroide(1,1)= infoDataROINoMoho(i,3);
    
    tempImage = imgs{imageName, 1};
    
    ROI = ExtractorROI(tempImage, centroide, 65);
    imwrite (ROI, strcat ('I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\dataset_moho\ROI-No-moho\', string(i), '.jpg'));
    dataSetROINoMoho{i,1} = ROI;
    
end