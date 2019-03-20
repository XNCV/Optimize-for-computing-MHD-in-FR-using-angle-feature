% Author: Tinh Bui and Nhan Truong
% Description:
%          Arrange the dominant points in files ".ssfpm" in order z-order curve and
%          store them in structure "struct"
% Input: 
%       1) library: the name of the database we used (BN, AR) (should be a string)
%       2) number: the number correspond to the condition take photos (should be a string)
%       3) direct: the path of the files ".ssfpm" in the database
% Output:
%       1) A file ".mat":
%          The content of each person in this file was contructed from 8 parts
%          corresponding to 8 bins of the value of the angle features
% Note:
%       1) The input is the files of many people. Each person has 1 file to store
%          the description. However, the output is only one file to save all of them.
%       2) The inputs should be a string and we need combine the rule.
%          For example: Bern library: 'BN' and the image was take in the condition 1: '1'
%       3) In file with the end by ".mat", there are 4 characters and by ".ssfpm" are 6
function output=train(library, number)
direct=uigetdir('X:/');
database=dir(strcat(direct,sprintf('/*%s.ssfpM',number)));
[row, column]=size(database);
output=cell(row,1);
for count=1:1:length(database)
    databasefile=fullfile(direct, database(count).name);
    D_original = dlmread(databasefile);
    descrips=z_order_ssfpM(D_original);
    output{count}=struct('name', database(count).name,'descriptors', descrips);
    filename=sprintf('dps/%sdata%s.mat',library, number);
    save(filename, 'output');
end
end