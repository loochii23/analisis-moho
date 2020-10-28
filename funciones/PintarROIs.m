function [Nfig] = PintarROIs(Nfig,I,TotalAlto,TotalAncho,Coordtemp)

figure(Nfig);
imshow(I);
hold on;

 for i=1:TotalAlto

        for j=1:TotalAncho
            
            dataCoord=Coordtemp{i,j};
            rectangle('Position',dataCoord(1:4),'EdgeColor','g','LineWidth',1,'LineStyle','-.');  
            hold on;
            pause(0.1);

        end

 end

end

