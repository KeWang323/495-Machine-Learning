clc;
clear;
A=0;
B=0;
xp=[0.68608
0.50679
0.34545
0.7581
0.1903
0.81336
0.95399
0.17358
0.14515
0.35531
0.59709
0.41464
0.53799
0.49533
0.4278
0.215
0.3791
0.85292
0.023528
0.52766
0.52465
];
yp=[-0.99147
-0.41632
0.97764
-0.61354
1.2788
-1.1745
-0.34193
0.60278
0.75034
1.0266
-0.48369
0.67935
-0.10388
-0.031348
0.4147
0.88859
0.61248
-0.97585
0.44822
0.042831
-0.24897
];
for i=1:21
    A=A+[1;sin(2*pi*xp(i))]*[1,sin(2*pi*xp(i))];
    B=B+[1;sin(2*pi*xp(i))]*yp(i);
end
w=A^(-1)*B;
figure(1);
axis([0,1,-1.5,1.5]);
plot(xp,yp,'.','color','red');
hold on;
x=0:0.01:1;
y=w(2)*sin(2*pi*x)+w(1); 
plot(x,y);
title('HW2 3.5 original')
legend('data','fitting curve','location','northwest')
xlabel('x');
ylabel('y');

figure(2);
axis([0,2*pi,-1.5,1.5]);
plot(sin(2*pi*xp),yp,'.','color','red');
hold on;
x=-1:0.01:1;
y=w(2)*x+w(1); %3.9360
plot(x,y);
title('HW2 3.5 transformaed')
legend('data','fitting curve','location','northwest')
xlabel('f(x)=sin(2¦Ðx)');
ylabel('y');

