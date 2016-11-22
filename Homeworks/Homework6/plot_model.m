function plot_model(w,D,x1,y1,x2,y2)
f = 0;
s = [0:0.001:1]';
f = [];
for m = 1:D;
    f = [f, cos(2*pi*m*s), sin(2*pi*m*s)];
end
f = sum(f*w(2:end),2) + w(1);
hold on
plot(s,f,'Color','b','LineWidth',2);
scatter(x1,y1,20,'c','fill');
scatter(x2,y2,10,'m','fill');
axis([0 1 (min(y1) - 0.5) (max(y1) + 0.5)])
s = ['D = ',num2str(D)];
title(s,'FontSize', 15)
end