% Author: Tinh Bui and Nhan Truong
% Description:
%          Illuminate the value of Wn , K and the accuracy in a chart.
% Input:
%       1) A, B, C, D: is matrix with the first rows to be the value of Wn,
%          the second rows to be the value of the accuracy. Each matrix has
%          a private value of K.
% Output:
%       1) A chart
A=[10 20 30 40 50;71 67 64 63 63];%k=3
B=[10 20 30 40 50;72 72 69 65 65];%k=4
C=[10 20 30 40 50;69 70 58 64 60];%k=5
D=[10 20 30 40 50;63 62 58 51 48];%k=7
grid on 
hold on
plot(A(1,:),A(2,:),'kx-',B(1,:),B(2,:),'ko-',C(1,:),C(2,:),'ks-',D(1,:),D(2,:),'k+-');
grid on 
hold on
xlabel('Wn thay doi');
ylabel('ti le nhan dang') ;
legend ('k=3','k=4','k=5','k=7');
xlim([10 50]);
ylim([0 100]);