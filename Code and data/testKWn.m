clc
clear % AR: 64% (20/3) 63% (30/5)
right=0;
exten=7;  
database=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR2/*01.mat');
test=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR2/*14.mat');
number=0;
for Wn=20:10:50
for K=4
Hausdorff_distance=zeros(length(test),length(database));
for ii=1:length(test)
    testfile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR2/',test(ii).name);
    testtrain=load(testfile);
    for jj=1:length(database)
        datafile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR2/',database(jj).name);
        datatrain=load(datafile);
        if(jj~=42)
            Hausdorff_distance(ii,jj)=MHD_ft_angle(datatrain,testtrain,Wn,K);
        end
    end
end
for i=1:1:100
    Hausdorff_distance(i,42)=1000;
end
right=0;
%top=2;
for ii=1:length(test)
    %for k=1:top
        [Minimum_distance,placejj]=min(Hausdorff_distance(ii,:));
        testname=test(ii).name(1:end-exten);
        modelname=database(placejj).name(1:end-exten);
        if strcmp(testname,modelname)==1
           right=right+1;
        end
        %Hausdorff_distance(ii,placejj)=max(Hausdorff_distance(ii,:));
    %end
end
percentage=100*right/length(test);
number=number+1;
result(1,number)=Wn;
%result(2,number)=K;
result(2,number)=percentage;
display(number)
end
end