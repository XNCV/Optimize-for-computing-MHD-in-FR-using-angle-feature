% Author: Tinh Bui and Nhan Truong
% Description:
%          Calculate the accuracy of the recognition in the ideal condition
% Input:
%       1) database: the data of the faces was taken in ideal condition
%       2) test: the data of another face in the ideal condition
% Output:
%       1) percentage: the accuracy of the recognition
% Note:
%       1) This code use for both the Bern database and  the AR database
% Current result:
%       1) Bern: 90%
%       2) AR:   72%
% Reference:
%       1) The code from MEng Dang Nguyen Chau
clc
clear
right=0;
exten=7;
%top=1;
tic;
database=dir('train/AR/*01.mat');
test=dir('train/AR/*14.mat');
Hausdorff_distance=zeros(length(test),length(database));
for ii=1:length(test)
    testfile=fullfile('train/AR/',test(ii).name);
    testtrain=load(testfile);
    for jj=1:length(database)
        datafile=fullfile('train/AR/',database(jj).name);
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