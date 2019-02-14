%test AR
%test trong dieu kien chieu sang thay doi
%chieu sang ben phai, anh 5+18 (62%); ben trai, anh 6+19 (59.5%); hai ben, anh 7+20(40%)
clc
clear
right=0;
exten=7;
tic;
database=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/*01.mat');
test1=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/*05.mat');
test2=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/*18.mat');
Hausdorff_distance=zeros(length(test1)+length(test2),length(database));
for ii=1:(length(test1)+length(test2))
    if(ii<=length(test1))
        testfile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/',test1(ii).name);
        testtrain=load(testfile);
        for jj=1:length(database)
            datafile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/',database(jj).name);
            datatrain=load(datafile);
            if(jj~=42)
                Hausdorff_distance(ii,jj)=MHD_ft_angle(datatrain,testtrain,20,4);
            end
        end
    else
        testfile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/',test2(ii-length(test1)).name);
        testtrain=load(testfile);
        for jj=1:length(database)
            datafile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR1/',database(jj).name);
            datatrain=load(datafile);
            if(jj~=42)
                Hausdorff_distance(ii,jj)=MHD_ft_angle(datatrain,testtrain,20,4);
            end
        end
    end
    fprintf('Dang tinh anh %d \n', ii);
end
for i=1:1:200
    Hausdorff_distance(i,42)=1000;
end
for ii=1:(length(test1)+length(test2))
        [Minimum_distance,placejj]=min(Hausdorff_distance(ii,:));
        if(ii<=length(test1))
            testname=test1(ii).name((1:end-exten));
        else
            testname=test2(ii-length(test1)).name((1:end-exten));
        end
        modelname=database(placejj,1).name(1:end-exten);
        if strcmp(testname,modelname)==1
            right=right+1;
        end
end
percentage=100*right/(length(test1)+length(test2));
toc;