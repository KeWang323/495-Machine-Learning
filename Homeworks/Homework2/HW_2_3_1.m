clc;
clear;
A=0;
B=0;
xp=[2004.2 2004.5 2004.8 2005 2005.2 2005.5 2005.8 2006 2006.2 2006.5 2006.8 2007 2007.2 2007.5 2007.8 2008 2008.2 2008.5 2008.8 2009 2009.2 2009.5 2009.8 2010 2010.2 2010.5 2010.8 2011 2011.2 2011.5 2011.8 2012 2012.2 2012.5 2012.8 2013 2013.2 2013.5 2013.8 2014];
yp=[0.26 0.26 0.33 0.35 0.36 0.37 0.38 0.39 0.43 0.44 0.45 0.48 0.51 0.51 0.53 0.55 0.58 0.59 0.61 0.64 0.66 0.68 0.69 0.72 0.76 0.76 0.78 0.81 0.81 0.85 0.87 0.87 0.9 0.91 0.96 0.97 0.99 0.99 1.03 1.08];
for i=1:40
    A=A+[1;xp(i)]*[1,xp(i)];
    B=B+[1;xp(i)]*yp(i);
end
w=A^(-1)*B;
x=2004:0.1:2014;
plot(xp,yp,'.','color','red');
axis([2004,2014,0,1.25]);
hold on;
y=w(2)*x+w(1); %3.9360
plot(x,y);
title('HW2 3.1')
legend('data','linear model','location','northwest')
xlabel('year');
ylabel('student debt in trillion dollars');