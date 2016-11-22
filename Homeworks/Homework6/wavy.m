clc;
clear;
data = csvread('D:\Courses Files_2015_Fall\Machine Learning\Homeworks\Homework6\datasets\wavy_data.csv');
x = data(:,1);
y = data(:,2);
deg = [1,2,3,4,5,6,7,8];
msestraining = [];
msestesting = [];
p=[24,2,17,22,19,14,12,11,7,13,10,27,18,9,8,30,1,25,5,26,4,20,15,6,28,29,3,23,16,21];
xtraining=x(p(1:20));
xtesting=x(p(21:30));
ytraining=y(p(1:20));
ytesting=y(p(21:30));
figure(1);
scatter(xtraining,ytraining,'c','fill');
hold on
scatter(xtesting,ytesting,'m','fill');
legend('training data','testing data');
title('data splited');
xlabel('x');
ylabel('y');
figure(2);
for D = 1:8
    F1 = fourier_features(xtraining,deg(D));
    F2 = fourier_features(xtesting,deg(D));
    w1 = pinv(F1*F1')*F1*ytraining;
    msestraining = [msestraining, norm(F1'*w1 - ytraining)/length(ytraining)];
    msestesting = [msestesting, norm(F2'*w1 - ytesting)/length(ytesting)];
    subplot(2,4,D)
    plot_model(w1,deg(D),xtraining,ytraining,xtesting,ytesting);
end
figure(3)
plot(1:length(msestraining),msestraining,'.-','markersize',20,'Color','c');
hold on
plot(1:length(msestesting),msestesting,'.-','markersize',20,'Color','m');
legend('training error','testing error','Location','northwest');
xlabel('D');
ylabel('error');


F = fourier_features(x,4);
w = pinv(F*F')*F*y;
figure(4);
f = 0;
s = [0:0.001:1]';
f = [];
for m = 1:4;
    f = [f, cos(2*pi*m*s), sin(2*pi*m*s)];
end
f = sum(f*w(2:end),2) + w(1);
hold on
plot(s,f,'Color','b','LineWidth',2);
scatter(x,y,'k','fill');
title('data fitted D=4');
xlabel('x');
ylabel('y');


