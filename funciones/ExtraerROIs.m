function [ImgDescom,Coordtemp] = ExtraerROIs(TotalAncho,TotalAlto,Img,ladoROI,deltaROI)

  %PARAMETROS INICIALES 
  fi=1;
  ff=ladoROI;
  ci=1;
  cf=ladoROI;
  
  Coordtemp=cell(TotalAlto,TotalAncho);
  
  ImgDescom=cell(TotalAlto*TotalAncho,2);
  
  cont=1;
  
  for i=1:TotalAlto
    
    for j=1:TotalAncho
                
        Itemp=Img(fi:ff,ci:cf);
        
        CoordenadasCuadros=[ci,fi,ladoROI-1,ladoROI-1];
        
        Coordtemp{i,j}=CoordenadasCuadros;
        
        ci=ci+deltaROI;
        cf=cf+deltaROI;
               
        ImgDescom{cont,1}=Itemp;
        ImgDescom{cont,2}=CoordenadasCuadros;
        
        cont=cont+1;
        
    end
    
       fi=fi+deltaROI;
       ff=ff+deltaROI;
       
       ci=1;
       cf=ladoROI;
    
  end
  

end

