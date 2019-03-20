% Author: Tinh Bui and Nhan Truong
% Description:
%          Calculate the accuracy of the recognition in the varying pose of head
% Input:
%       1) database: the data of the faces was taken in ideal condition (1st image)
%       2) test1, test2: the data of the face in the same pose condition
% Output:
%       1) percentage: the accuracy of the recognition
% Note:
%       1) This code only use for the BERN database
%       2) When process 9th and 10th images (look downward), we need replace the line:
%          testname=test2(ii-length(test1)).name((1:end-5));
%          by this line:
%          testname=test2(ii-length(test1)).name((1:end-6));
% Current result:
%       1) 3rd and 4th images (look to the left):  43.33%
%       2) 5th and 6th images (look to the right): 41.67%
%       3) 7th and 8th images (look upward):       40.00%
%       4) 9th and 10th images (look downward):    46.67%
% Reference:
%       1) The code from MEng Dang Nguyen Chau
clc
clear
right=0;
tic;
database=dir('train/BN/*1.mat');
test1=dir('train/BN/*7.mat');
test2=dir('train/BN/*8.mat');
Hausdorff_distance=zeros(length(test1)+length(test2),length(database));
for ii=1:(length(test1)+length(test2))
    if(ii<=length(test1))
        testfile=fullfile('train/BN/',test1(ii).name);
        testtrain=load(testfile);
        for jj=1:length(database)
            datafile=fullfile('train/BN/',database(jj).name);
            datatrain=load(datafile);
            Hausdorff_distance(ii,jj)=MHD_ft_angle(datatrain,testtrain,20,4);
        end
    else
        testfile=fullfile('train/BN/',test2(ii-length(test1)).name);
        testtrain=load(testfile);
        for jj=1:length(database)
            datafile=fullfile('train/BN/',database(jj).name);
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