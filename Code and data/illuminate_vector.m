% illuminate vector
function showkey()
clc
clear
image=imread('X:\Do_an\face_library\AAA_DataLEM\Adam1.bmp');
imshow(image);
hold on
datafile=load('X:\Do_an\code\code_in_report\trained\BNdata1.mat');
data=datafile.output{1,1}.descriptors;
A=angle_feature3(data);
imsize=size(image);
n=0;
for i=1:1:size(A,2)
    TransformLine(imsize, A(:,i), 0.0, 0.0, 1.0, 0.0);
    TransformLine(imsize, A(:,i), 0.85, 0.1, 1.0, 0.0);
    TransformLine(imsize, A(:,i), 0.85, -0.1, 1.0, 0.0);
    n=n+1;
end
sprintf('size = %d', n)
hold off

function TransformLine(imsize, keypoint, x1, y1, x2, y2)

len = 6;

s = sin(keypoint(3));
c = cos(keypoint(3));

r1 = keypoint(1) - len * (c * y1 + s * x1);
c1 = keypoint(2) + len * (- s * y1 + c * x1);
r2 = keypoint(1) - len * (c * y2 + s * x2);
c2 = keypoint(2) + len * (- s * y2 + c * x2);

plot([c1 c2],[r1 r2],'r-'); %[column1 column2],[row1 row2] 



