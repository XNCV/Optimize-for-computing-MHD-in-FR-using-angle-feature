% Author: Tinh Bui and Nhan Truong
% Description: 
%          This function calculates angle features without...out weight of them
%          and save them into matrix 'output'
% Input: 
%       1) A is the matrix which saves the coordinates of the dominant points (dps)
%          The first rows: the value of the row of dps
%          The second rows: the value of the column of dps
% Output:
%       1) The output is the matrix contain:
%          The first rows: the value of the row of dps
%          The second rows: the value of the column of dps
%          The third rows: the value of angle feature of dps
% Note:
%       1) dps from A were extracted from the image have coordinate system (x, -y)
%          when we compare with descartes coordinate system
function output=angle_feature(A)
output=zeros(3,size(A,2));
for j=1:1:size(A,2)
    n=0;B=zeros(2,size(A,2)-1);
    for i=1:1:size(A,2)
        if(i~=j)
            n=n+1;
            yi=A(1,i)-A(1,j); xi=A(2,i)-A(2,j);
            % Each vector has the length to equal to 1
            B(1,n)=yi/sqrt(yi^2+xi^2);
            B(2,n)=xi/sqrt(yi^2+xi^2);
        end
    end
    y=sum(B(1,:));
    x=sum(B(2,:));
    output(1,j)=A(1,j);
    output(2,j)=A(2,j);
    % Need read carefully the Note row=-y, column=x
    output(3,j)=atan2(-y,x);
end
end