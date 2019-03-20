% Author: Tinh Bui and Nhan Truong
% Description: 
%          This function classifies the dominant points (dps) thank to their
%          angle features. The size of bins is the same.
% Input: 
%       1) A is a matrix which saves the coordinates of dps
%          The first rows: the value of the row of dps
%          The second rows: the value of the column of dps
%          The third rows: the value of angle feature of dps
%       2) n is the number of bins to separate dps in the image.
% Output:
%       1) The output is a struct type contain n parts, each part the same structure
%          with A.
% Note:
%       1) The matrix A is the output of the function 'angle_feature()'
function output=classify_features(A,n)
for i=1:1:n
    features=0; low=-pi+(i-1)*2*pi/n; high=-pi+i*2*pi/n;
    inc=0;
    for j=1:1:size(A,2)
        if((A(3,j)>=low)&&(A(3,j)<=high))
            inc=inc+1;
            features(1,inc)=A(1,j);
            features(2,inc)=A(2,j);
            features(3,inc)=A(3,j);
        end
    end
    output{i,1}=features;
end
end