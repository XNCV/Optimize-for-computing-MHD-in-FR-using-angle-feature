function h=MHD_ft_angle(A,B,Wn,K)
%% tinh hAB
sumA=0;nA=0; nAA=0;
for i=1:1:8
    for jA=1:1:size(A.features{i,1},2)
        distA=0;
        for jB=1:1:size(B.features{i,1},2)
            distA(jB)=sqrt( (A.features{i,1}(1,jA)-B.features{i,1}(1,jB))^2 +(A.features{i,1}(2,jA)-B.features{i,1}(2,jB))^2 );
        end
        if(min(distA)<K)
            nAA=nAA+1;
        end
        sumA=sumA+min(distA);
    end
    nA=nA+jA;
end
hAB=sumA/nA;
%% tinh hBA
sumB=0;nB=0;nBB=0;
for i=1:1:8
    for jB=1:1:size(B.features{i,1},2)
        distB=0;
        for jA=1:1:size(A.features{i,1},2)
            distB(jA)=sqrt( (B.features{i,1}(1,jB)-A.features{i,1}(1,jA))^2 +(B.features{i,1}(2,jB)-A.features{i,1}(2,jA))^2 );
        end
        sumB=sumB+min(distB);
    end
    if(min(distB)<K)
        nBB=nBB+1;
    end
    nB=nB+jB;
end
hBA=sumB/nB;
hmax=max(hAB,hBA);
Dn=1-0.5*(nAA/nA+nBB/nB);
h=sqrt(hmax^2+Wn^2*Dn^2);
end