clc;
clear;
A=0;
B=0;
xp=[0
25
50
75
100];
yp=[4.7
2.9
1.73
1.43
1.11];
for i=1:5
    A=A+[1;xp(i)]*[1,xp(i)];
    B=B+[1;xp(i)]*(1/yp(i));
end
w=A^(-1)*B;
figure(1);
plot(xp,yp,'.','color','red');
hold on;
x=0:0.1:100;
y=w(1)+w(2)*x;
plot(x,1./y);
title('HW2 3.8')
legend('data','fitting curve','location','northeast')
xlabel('length of wire');
ylabel('current');
