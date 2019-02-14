%BERN_test dieu kien goc chup thay doi
%nhin sang trai, hinh 3+4 ( 43.33%); nhin sang phai, hinh 5+6 ( 41.67%); nhin len tren, hinh
%7+8 ( 40%)  nhin xuong (46.67%)
clc
clear
right=0;
tic;
database=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/BN1/*1.mat');
test1=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/BN1/*5.mat');
test2=dir('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/BN1/*6.mat');
Hausdorff_distance=zeros(length(test1)+length(test2),length(database));
for ii=1:(length(test1)+length(test2))
    if(ii<=length(test1))
        testfile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/BN1/',test1(ii).name);
        testtrain=load(testfile);
        for jj=1:length(database)
            datafile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/BN1/',database(jj).name);
            datatrain=load(datafile);
            Hausdorff_distance(ii,jj)=MHD_ft_angle(datatrain,testtrain,20,4);
        end
    else
        testfile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/BN1/',test2(ii-length(test1)).name);
        testtrain=load(testfile);
        for jj=1:length(database)
            datafile=fullfile('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/BN1/',database(jj).name);
            datatrain=load(datafile);
            Hausdorff_distance(ii,jj)=MHD_ft_angle(datatrain,testtrain,20,4);
        end
    end
    fprintf('Dang tinh anh %d \n', ii);
end
for ii=1:(length(test1)+length(test2))
        [Minimum_distance,placejj]=min(Hausdorff_distance(ii,:));
        if(ii<=length(test1))
            testname=test1(ii).name((1:end-5));
        else
            testname=test2(ii-length(test1)).name((1:end-5));
        end
        modelname=database(placejj,1).name(1:end-5);
        if strcmp(testname,modelname)==1
            right=right+1;
        end
end
percentage=100*right/(length(test1)+length(test2));
toc;