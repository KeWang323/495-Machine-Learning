clc;
clear;
data = csvread('D:\Courses Files_2015_Fall\Machine Learning\Homeworks\Homework6\datasets\galileo_ramp_data.csv');
x = data(:,1);
y = data(:,2);
deg = [1,2,3,4,5,6];
msestraining=cell(6,1);
msestesting=cell(6,1);


for i=1:6
    xtraining=x;
    ytraining=y;
    xtraining(i,:)=[];
    ytraining(i,:)=[];
    xtesting=x(i,:);
    ytesting=y(i,:);
    msestraining{i} = [];
    msestesting{i} = [];
    for j=1:6
        F1 = poly_features(xtraining,j);
        F2 = poly_features(xtesting,j);
        w1 = pinv(F1*F1')*F1*ytraining;
        msestraining{i} = [msestraining{i}, norm(F1'*w1 -ytraining)/length(ytraining)];
        msestesting{i} = [msestesting{i}, norm(F2'*w1 - ytesting)/length(ytesting)];
        
    end
    figure(1);
    subplot(2,3,i);
    plot(1:length(msestraining{i}),msestraining{i},'.-','markersize',20,'Color','c');
    hold on
    plot(1:length(msestesting{i}),msestesting{i},'.-','markersize',20,'Color','m');
    if i<4
        legend('training error','testing error','Location','northwest');
    else
        legend('training error','testing error','Location','northeast');
    end
    xlabel('D');
    ylabel('error');
end

mstr=msestraining{1}+msestraining{2}+msestraining{3}+msestraining{4}+msestraining{5}+msestraining{6};
mstr=mstr/6;
mste=msestesting{1}+msestesting{2}+msestesting{3}+msestesting{4}+msestesting{5}+msestesting{6};
mste=mste/6;
figure(2);
plot(1:1:6,mstr,'.-','markersize',20,'Color','c');
hold on
plot(1:1:6,mste,'.-','markersize',20,'Color','m');
set(gca,'XTick',1:1:6);
title('average training and testing error');
xlabel('D');
ylabel('error');
legend('training error','testing error','Location','northwest');
figure(3);
F = poly_features(x,2);
w = pinv(F*F')*F*y;
f = 0;
s = [0:0.01:max(x)]';
f = [];
for m = 1:2;
    f = [f, s.^m];
end
f = sum(f*w(2:end),2) + w(1);
plot(s,f,'Color','m','LineWidth',2);
hold on
scatter(x,y,'k','fill');
title('final fitted curve');
xlabel('x');
ylabel('y');