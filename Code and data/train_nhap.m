%train nhap
clc
clear
database=load('X:\Do_an\code\code_in_report\trained\ARdata20.mat');
for i=1:1:size(database.output,1)
    A=angle_feature(database.output{i,1}.descriptors);
    features=classify_features(A,8);
    filename=database.output{i,1}.name(1:end-6);
    filename=sprintf('X:/Do_an/code/id3_vectohoa_cacdactrungsovoinhau/train/AR/%s.mat',filename);
    save(filename, 'features');
    display(i)
end