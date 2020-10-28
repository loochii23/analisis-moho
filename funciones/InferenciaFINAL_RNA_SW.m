function [Nfig,Resultadof] = InferenciaFINAL_RNA_SW(Nfig,I,TotalAlto,TotalAncho,Coordtemp,ImgDescom,red)

figure(Nfig);
imshow(I);
hold on;

aux=1;

Resultadof=zeros(TotalAlto,TotalAncho);

 for i=1:TotalAlto

        for j=1:TotalAncho
            
            
            %EXTRAER CARACTERÍSTICAS DE CADA ROI:
            
            [vectorCarct] = ExtractCarctCuadrantes(ImgDescom{aux,1});
            aux=aux+1;
            
            Restemp=red(vectorCarct);
            
                    if(Restemp>=-0.2 && Restemp<=0.2)

                    Resultadof(i,j)=0;
                    R=0;

                    elseif(Restemp>=0.8 && Restemp<=1.2)

                    Resultadof(i,j)=1;
                    R=1;

                    elseif(Restemp>=1.8 && Restemp<=2.2)

                    Resultadof(i,j)=2;
                    R=2;

                    else

                    Resultadof(i,j)=3;
                    R=3;

                    end
                    
            switch R
                
                case 0 % VERDE SI ES 0
                    
                    dataCoord=Coordtemp{i,j};
                    rectangle('Position',dataCoord(1:4),'EdgeColor','g','LineWidth',2,'LineStyle','-');  
                    hold on;
                    pause(0.01);
                    
                    
                case 1 % AZUL SI ES 1 - TIENE MOHO
                    
                    dataCoord=Coordtemp{i,j};
                    rectangle('Position',dataCoord(1:4),'EdgeColor','b','LineWidth',2,'LineStyle','-');  
                    hold on;
                    pause(0.01);
                    
                    
                case 2 % AMARILLO SI ES 2 - NO TIENE MOHO
                    
                    dataCoord=Coordtemp{i,j};
                    rectangle('Position',dataCoord(1:4),'EdgeColor','y','LineWidth',2,'LineStyle','-');  
                    hold on;
                    pause(0.01);
                         
                    
%                 case 3 % ROJO SI ES 3 (OPC DE RECHAZO)
                    
%                     dataCoord=Coordtemp{i,j};
%                     rectangle('Position',dataCoord(1:4),'EdgeColor','r','LineWidth',2,'LineStyle','-');  
%                     hold on;
%                     pause(0.01);
                            
                
            end
                     
        end
        
 end
 
end

