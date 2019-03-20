% Author: Tinh Bui and Nhan Truong
% Description:
%          Calculate the accuracy of the recognition in the difference 
%          of the confident ratio (Wn, K)
% Input:
%       1) database: the data of the faces was taken in ideal condition
%       2) test: the data of another face in the ideal condition
% Output:
%       1) result: a matrix contain
%          the first rows: the value of the variable Wn
%          the second rows: the value of the variable K
%          the third rows: the value of the variable percentage
% Note:
%       1) This code use for both the Bern database and  the AR database
% Reference:
%       1) The code from MEng Dang Nguyen Chau
clc
clear
right=0;
exten=7;  
database=dir('train/AR/*01.mat');
test=dir('train/AR/*14.mat');
number=0;
for Wn=20:10:50
for K=3:7
Hausdorff_distance=zeros(length(test),length(database));
for ii=1:length(test)
    testfile=fullfile('train/AR/',test(ii).name);
    testtrain=load(testfile);
    for jj=1:length(database)
        datafile=fullfile('train/AR/',database(jj).name);
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
result(2,number)=K;
result(3,number)=percentage;
display(number)
end
end