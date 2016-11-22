clc;
clear;
A=0;
B=0;
xp=[0
3
6
9
12
15
18
21
24

];
yp=[0.04274
0.058356
0.11781
0.26356
0.54712
0.7389
0.88959
0.98
0.96904
];
figure(1);
plot(xp,yp,'.','color','red');
for i=1:5
    A=A+[1;xp(i)]*[1,xp(i)];
    B=B+[1;xp(i)]*log(yp(i)/(1-yp(i)));
end
w=A^(-1)*B;
hold on;
x=0:0.1:25;
y=w(1)+w(2)*x;
plot(x,1./(1+exp(-y)));
title('HW2 3.10')
legend('data','fitting curve','location','northwest')
xlabel('x');
ylabel('y');