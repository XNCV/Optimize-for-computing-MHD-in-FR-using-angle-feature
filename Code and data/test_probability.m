% Author: Tinh Bui and Nhan Truong
% Description:
%          Determine the probability of the appearance of dominant points (dps)
%          in each bin and calculate the complexity of computing before and 
%          after using our optimal technique.
% Input:
%       1) model, test: the direct path to data which store dps
% Output:
%       1) Prob_appear1, Prob_appear2: the probability of the appearance of dps
%          in each bin.
%       2) complexity_before, complexity_after: the complexity of computing.
%% Model
clc
clear
model=dir('train/AR/*01.mat');
Num_dps_1=zeros(1,8); Prob_appear1=zeros(1,8);
for i=1:1:length(model)
    modelfile=fullfile('train/AR/',model(i).name);
    modeltrain=load(modelfile);
    for j=1:1:8
        Num_dps_1(j)=Num_dps_1(j)+ size(modeltrain.features{j,1},2);
    end
end
summ1=sum(Num_dps_1(1,:));
for i=1:1:8
    Prob_appear1(i)=Num_dps_1(i)/summ1;
end
%% Test
test=dir('train/AR/*14.mat');
Num_dps_2=zeros(1,8); Prob_appear2=zeros(1,8);
for i=1:1:length(test)
    modelfile=fullfile('train/AR/',test(i).name);
    modeltrain=load(modelfile);
    for j=1:1:8
        Num_dps_2(j)=Num_dps_2(j)+ size(modeltrain.features{j,1},2);
    end
end
summ2=sum(Num_dps_2(1,:));
for i=1:1:8
    Prob_appear2(i)=Num_dps_2(i)/summ2;
end
%% Complexity
comp_each_bin=zeros(1,8);
for i=1:1:8
    comp_each_bin(i)=Num_dps_2(i)*Num_dps_1(i);
end
complexity_before = summ1*summ2
complexity_after=sum(comp_each_bin(1,:));