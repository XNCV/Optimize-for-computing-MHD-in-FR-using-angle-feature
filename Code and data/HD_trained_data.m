clc
tic;
clear
right=0;
exten=7;
database=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR/*01.mat');
test=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR/*14.mat');
Hausdorff_distance=zeros(length(test),length(database));
for ii=1:length(test)
    testfile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR/',test(ii).name);
    testtrain=load(testfile);
    for jj=1:length(database)
        datafile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR/',database(jj).name);
        datatrain=load(datafile);
        if(jj~=42)
            Hausdorff_distance(ii,jj)=MHD_ft_angle(datatrain,testtrain,20,4);
        end
    end
    fprintf('Dang tinh anh %d \n', ii);
end
for i=1:1:100
    Hausdorff_distance(i,42)=1000;
end
%top=1;
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
toc;