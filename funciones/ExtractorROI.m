function [ROI] = ExtractorROI(Img,Centroide,radio)

f=Centroide(1,1);
c=Centroide(1,2);

fi=f-radio;
ff=f+radio;
ci=c-radio;
cf=c+radio;
%fprintf('value of fi: %d\n', fi);
%fprintf('value of ff: %d\n', ff);
%fprintf('value of ci: %d\n', ci);
%fprintf('value of cf: %d\n', cf);
%fprintf('value of radio: %d\n', radio);

ROI=Img(fi:ff,ci:cf,:);
end

