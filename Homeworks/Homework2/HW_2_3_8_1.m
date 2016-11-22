clc;
clear;
xp=[0
    25
    50
    75
    100
    ];
yp=[4.7
    2.9
    1.73
    1.43
    1.11
    ];
out=zeros(100,1);
grad_stop = 10^-5;
max_its=100;
alpha=10^-1;
u=2;
r=2;
gradu=1;
iter=1;
while norm(gradu) > grad_stop && iter <= max_its
    gradu=0;
    for i=1:5
        gradu=gradu+2*((u/(r+xp(i))^2)-yp(i)/(u/(r+xp(i))));
    end
    u=u-alpha*gradu;
    for j=1:5
        out(iter)=out(iter)+((u/(r+xp(j)))-yp(j))^2;
    end
    iter=iter+1;
end

plot(out,'LineWidth',2);
