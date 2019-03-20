% Author: Tinh Bui and Nhan Truong
% Description:
%          The dominant points in the database were added one element
%		   named angle feature. Then, they were classified thank to
%		   this feature
% Input: 
%       1) A file ".mat" with struct type (variable output) contains:
%          The name of people: name
%          The coordinate of the dominant points: descriptors
%          		The first rows: the value of the row of dps
%          		The second rows: the value of the column of dps
% Output:
%       1) A file ".mat":
%          The name of this file is the name of a person
%          The content in this file was contructed from 8 parts corresponding
%          to 8 bins of the value of the angle features
% Note:
%       1) In the input file, many people was arranged in only one file, but
%          at the output file, each person had 1 file to store the description.
%          We used the difference of the name to separate them.
clc
clear
database=load('database_dps\dps\ARdata20.mat');
for i=1:1:size(database.output,1)
    angle_features=angle_feature(database.output{i,1}.descriptors);
	% Choose 8 bins to separate the data
    features=classify_features(angle_features,8);
    filename=database.output{i,1}.name(1:end-6);
    filename=sprintf('train/AR/%s.mat',filename);
    save(filename, 'features');
    display(i)
end