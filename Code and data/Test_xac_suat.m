%test xac suat xuat hien
clc
clear
data=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/*01.mat');
C1=zeros(1,8); D1=zeros(1,8);
for i=1:1:length(data)
    datafile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/',data(i).name);
    datatrain=load(datafile);
    for i=1:1:8
        C1(i)=C1(i)+ size(datatrain.features{i,1},2);
    end
end
summ1=sum(C1(1,:));
for i=1:1:8
    D1(i)=C1(i)/summ1;
end
data2=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/*14.mat');
C2=zeros(1,8); D2=zeros(1,8);
for i=1:1:length(data2)
    datafile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/',data2(i).name);
    datatrain=load(datafile);
    for i=1:1:8
        C2(i)=C2(i)+ size(datatrain.features{i,1},2);
    end
end
summ2=sum(C2(1,:));
for i=1:1:8
    D2(i)=C2(i)/summ2;
end

X=zeros(1,8);
for i=1:1:8
    X(i)=C2(i)*C1(i);
end
m=sum(X(1,:));