clear;
imds = imageDatastore('I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\dataset-moho\*.jpg');
imgs = readall (imds);

infoDataROI = xlsread('I:\UTAP\SISTEMAS EXPERTOS\PROYECTO\infoDataROI.xlsx');

for i=1: length(infoDataROI)
    imageName=infoDataROI(i,1);
    centroide(1,2)= infoDataROI(i,2);
    centroide(1,1)= infoDataROI(i,3);
    radio= infoDataROI(i,4);
    
    tempImage = imgs{imageName, 1};
    
    ROI = ExtractorROI(tempImage, centroide, radio);
    dataSetROI{i,1} = ROI;
    
end
