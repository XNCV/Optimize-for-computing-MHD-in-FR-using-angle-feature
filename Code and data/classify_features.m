%classify features depend on its angle feature
%input is matrix A have 3 row, with:
% row 1st: row value of features
% row 2nd: column value of features
% row 3rd: angle value of features
% This matrix was used the function 'angle_feature()'
% variable n is the number of khoang devided by 360 degree.
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