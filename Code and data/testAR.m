% Author: Tinh Bui and Nhan Truong
% Description:
%          Calculate the accuracy of the recognition in the varying lighting condition
% Input:
%       1) database: the data of the faces was taken in ideal condition
%       2) test1, test2: the data of the face in the same lighting condition
% Output:
%       1) percentage: the accuracy of the recognition
% Note:
%       1) This code only use for the AR database
% Current result:
%       1) 05th and 18th images (the right light):  62.00%
%       2) 06th and 19th images (the left light):   59.50%
%       3) 07th and 20th images (the both lights):  40.00%
% Reference:
%       1) The code from MEng Dang Nguyen Chau
clc
clear
right=0;
exten=7;
tic;
database=dir('train/AR/*01.mat');
test1=dir('train/AR/*05.mat');
test2=dir('train/AR/*18.mat');
Hausdorff_distance=zeros(length(test1)+length(test2),length(database));
for ii=1:(length(test1)+length(test2))
    if(ii<=length(test1))
        testfile=fullfile('train/AR/',test1(ii).name);
        testtrain=load(testfile);
        for jj=1:length(database)
            datafile=fullfile('train/AR/',database(jj).name);
            datatrain=load(datafile);
            if(jj~=42)
                Hausdorff_distance(ii,jj)=MHD_ft_angle(datatrain,testtrain,20,4);
            end
        end
    else
        testfile=fullfile('train/AR/',test2(ii-length(test1)).name);
        testtrain=load(testfile);
        for jj=1:length(database)
            datafile=fullfile('train/AR/',database(jj).name);
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