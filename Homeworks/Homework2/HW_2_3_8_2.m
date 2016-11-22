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
out=zeros(3,1);
grad_stop = 10^-5;
max_its=3;
alpha=10^-1;
u=40;
r=2;
gradr=1;
iter=1;
while norm(gradr) > grad_stop && iter <= max_its
    gradr=0;
    for i=1:5
        gradr=gradr+2*(((-u^2)/(r+xp(i))^2)+yp(i)*u/(u/(r+xp(i))^2));
    end
    r=r-alpha*gradr;
    for j=1:5
        out(iter)=out(iter)+((u/(r+xp(j)))-yp(j))^2;
    end
    iter=iter+1;
end
plot(out,'LineWidth',2);