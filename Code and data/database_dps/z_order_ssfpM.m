% Author: Tinh Bui and Nhan Truong
% Description:
%          All of the pixels in the image are added indexes in order z-order curve
%          Then, we only keep the dominant points, and delete the value to equal to 0
% Input: 
%       1) B is file end with ".ssfpm". These files were created from the facial images
%          after passing them through the software named LEMExpression.exe
% Output:
%       1) A, a matrix, contains the dominant points in order z-order curve
%          		The first rows: the value of the row of dps
%          		The second rows: the value of the column of dps
%          		The third rows: the value of the third column of dps in file ".ssfpm"
% Note:
%       1) In file ".ssfpm", 
%          		The first columns: the value of the row of dps
%          		The second columns: the value of the column of dps
% Reference:
%       1) LEMExpression:
%          https://maxwell.ict.griffith.edu.au/cvipl/projects.html (accessed date: 03/15/2019)
%       2) Z-order curve:
%          https://en.wikipedia.org/wiki/Z-order_curve (accessed date: 03/15/2019)
function A = z_order_ssfpM(B)
[r2,c2]=size(B);
% The sizes of the images are similar and equal to 160x160,
% so we need 8 bits to cover each edge, 65536 = 2^(8x2)
C=zeros(3,65536);
for i=2:r2
    if ((B(i,3)>=0)&&(B(i,1)~=-1))
        % Need check again file ffspm
        row = B(i,2)-1; column = B(i,1)-1; coor = 0;
        for j=0:7   
            coor=bitor(coor,bitshift(bitand(column,1),(2*j)));
            column=bitshift(column,-1);
            coor=bitor(coor,bitshift(bitand(row,1),(2*j+1)));
            row=bitshift(row,-1);
        end
        C(1,coor+1)=B(i,1);   %row
        C(2,coor+1)=B(i,2);   %column
        C(3,coor+1)=B(i,3);
    end
end
x = 1;
for i=1:65536
    if(C(1,i)~=0)
        A(1,x)= C(1,i);
        A(2,x)= C(2,i);
        A(3,x)= C(3,i);
        x=x+1;
    end
end
end
