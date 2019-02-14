%This function calculates angle features without...out weight of them 
%and save them into matrix 'output'
function output=angle_feature(A)
output=zeros(3,size(A,2));
for j=1:1:size(A,2)
    n=0;B=zeros(2,size(A,2)-1);
    for i=1:1:size(A,2)
        if(i~=j)
            n=n+1;
            xi=A(1,i)-A(1,j); yi=A(2,i)-A(2,j);
            B(1,n)=xi/sqrt(xi^2+yi^2);
            B(2,n)=yi/sqrt(xi^2+yi^2);
        end
    end
    x=sum(B(1,:));
    y=sum(B(2,:));
    output(1,j)=A(1,j);
    output(2,j)=A(2,j);
    output(3,j)=atan2(-x,y); %row=-x; column=y;
end
end