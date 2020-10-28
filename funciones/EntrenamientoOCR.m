%% LIMPIEZA DE VARIABLES:
clc;
clear all;
close all;
clear vars;
%% CARGAR LOS DATOS CORRESPONDIENTES:

load 'CarctN1.mat';
load 'CarctN9.mat';

%% AGREGAR A LAS VARIABLES ORIGINALES UNA FILA MÁS, QUE CORRESPONDE A LA CLASE:

DataC1=[CarctN1;ones(1,length(CarctN1))];
DataC9=[CarctN1;2*ones(1,length(CarctN1))];


%% DEFINICIÓN DE CANTIDADES DE ENTRENAMIENTO DE MANERA AUTOMÁTICA:

Nclases=2;
Lclass=length(CarctN1);

%%

DataCompleta=[CarctN1,CarctN9];

%%

L=length(DataCompleta);

%% PORCENTAJES DE ENTRENAMIENTO DEFINIDO POR EL USUARIO:

Pentrenamiento=80;
Pvalidacion=100-Pentrenamiento;

%% DEFINICIÓN DE LA CANTIDAD DE DATOS DE ENTRENAMIENTO GLOBALES

Lentrenamiento=ceil((Pentrenamiento/100)*L);
Lvalidacion=L-Lentrenamiento;

%% DEFINICIÓN DE LA CANTIDAD DE DATOS DE ENTRENAMIENTO POR CADA CLASE

LentrenamientoxClass=Lentrenamiento/Nclases;

%% GENERACIÓN DE INDICES ALEATORIOS DE ENTRENAMIENTO POR CADA CLASE:

indicesClaseN1=randperm(Lclass,LentrenamientoxClass);
indicesClaseN9=randperm(Lclass,LentrenamientoxClass);

%% SELECCIÓN Y EXTRACCIÓN DE LOS DATOS DE ENTRENAMIENTO:

DataEntreClaseN1=DataC1(1:4,indicesClaseN1);
DataEntreClaseN9=DataC9(1:4,indicesClaseN9);

%% ORGANIZACIÓN DEL VECTOR DE ENTRENAMIENTO DE LA RED NEURONAL:


DataTrain=[DataEntreClaseN1,DataEntreClaseN9];

EtiquetasEntre=[DataC1(5,indicesClaseN1),DataC9(5,indicesClaseN9)];

%% CREACIÓN DE LA RED NEURONAL ARTIFICIAL Y ENTRENAMIENTO DE LA MISMA:

NNCO=ceil(length(EtiquetasEntre)/10);

miRED=feedforwardnet(NNCO);

miREDFinal=train(miRED,DataTrain,EtiquetasEntre);

%% BUSQUEDA Y EXTRACCIÓN DE LOS INDICES DE VALIDACIÓN 

datapruebaC1=1:20;
datapruebaC2=1:20;

for i=1:length(indicesClaseN1)
    
    VtempC1=indicesClaseN1(1,i);
    VtempC2=indicesClaseN9(1,i);
    
    for j=1:length(datapruebaC1)
        
        if(VtempC1==datapruebaC1(1,j))
            
            datapruebaC1(1,j)=0; 
        end
        
        if(VtempC2==datapruebaC2(1,j))
            
            datapruebaC2(1,j)=0; 
        end
        
    end
        
end
%%
indiceC1=1;
indiceC2=1;

for i=1:length(datapruebaC1)
    
    dataC1=datapruebaC1(1,i);
    dataC2=datapruebaC2(1,i);
    
    if(dataC1~=0)
       indxValC1(indiceC1)=dataC1;
        indiceC1=indiceC1+1;
    end
    
    if(dataC2~=0)
        indxValC2(indiceC2)=dataC2;
        indiceC2=indiceC2+1;    
    end
    
end
%% EXTRACCIÓN DE LOS DATOS DE VALIDACIÓN PARA POSTERIOR EVALUACIÓN:


dataValC1=DataC1(1:4,indxValC1);
dataValC2=DataC9(1:4,indxValC2);

dataVal=[dataValC1,dataValC2];

%% VERIFICACIÓN DE LOS DATOS DE VALIDACIÓN:


for i=1:length(dataVal)
    
    Vtemp=dataVal(:,i);
    
    Restemp=miREDFinal(Vtemp);
    
    Resul(i,1)=round(Restemp);
    
    
end

%% 
for i=1:length(Resul)
    
    datoTemp=Resul(i,1);
    
    if(datoTemp==1)
        ResulOH_redon(1,i)=1;
        ResulOH_redon(2,i)=0;     
    end
    
    if(datoTemp==2)
        ResulOH_redon(1,i)=0;
        ResulOH_redon(2,i)=1; 
    end
    
end

%%

dataEtiValC1=DataC1(5,indxValC1);
dataEtiValC2=DataC9(5,indxValC2);

dataEtiVAL=[dataEtiValC1';dataEtiValC2'];

%%

for i=1:length(dataEtiVAL)
    
    datoTemp=dataEtiVAL(i,1);
    
    if(datoTemp==1)
        EtiVallOH(1,i)=1;
        EtiVallOH(2,i)=0;     
    end
    
    if(datoTemp==2)
        EtiVallOH(1,i)=0;
        EtiVallOH(2,i)=1; 
    end
    
end

%%

figure(1)

plotconfusion(EtiVallOH,ResulOH_redon)

%% POST ANALISIS DE LOS DATOS DE VALIDACIÓN USANDO OPCIÓN DE RECHAZO: 

for i=1:length(dataVal)
    
    Vtemp=dataVal(:,i);
    
    Restemp=miREDFinal(Vtemp);
    
    if(Restemp>=0.75 && Restemp<=1.25)   
        Resul_OR(i,1)=1;   
    elseif(Restemp>=1.75 && Restemp<=2.25) 
        Resul_OR(i,1)=2; 
    else   
        Resul_OR(i,1)=3;    
    end   
    
end


%% RECOLECTAR LOS INDICES DONDE NO HAY MUESTRA RECHAZADA:

aux=1;

for i=1:length(Resul_OR)
    
    valAux=Resul_OR(i,1);
    
    if(valAux~=3)
        vectorIndices(aux,1)=i;
        aux=aux+1;
    end
    
    
end

%%
%QUEDA LOS ÚNICOS DATOS QUE NO RECHAZO, Y AL CONTRARIO SI CLASIFICÓ:

dataVal_OR=Resul_OR(vectorIndices);

%LAS ETIQUETAS DE LOS ANTERIORES DATOS COMO TAL:

EtiqVal_OR=dataEtiVAL(vectorIndices);

%%

for i=1:length(dataVal_OR)
    
    datoTemp=dataVal_OR(i,1);
    
    if(datoTemp==1)
        dataValOR_OH(1,i)=1;
        dataValOR_OH(2,i)=0;     
    end
    
    if(datoTemp==2)
        dataValOR_OH(1,i)=0;
        dataValOR_OH(2,i)=1; 
    end
    
end

for i=1:length(EtiqVal_OR)
    
    datoTemp=EtiqVal_OR(i,1);
    
    if(datoTemp==1)
        EtiValOR_OH(1,i)=1;
        EtiValOR_OH(2,i)=0;     
    end
    
    if(datoTemp==2)
        EtiValOR_OH(1,i)=0;
        EtiValOR_OH(2,i)=1; 
    end
    
end

%% PLOTEO DE LA MATRIZ DE CONFUSIÓN HABIENDO USADO LA OPCIÓN DE RECHAZO:

figure(2)
plotconfusion(EtiValOR_OH,dataValOR_OH)
