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
out=zeros(6,1);
grad_stop = 10^-5;
max_its=5;
alpha=10^-1;
u=2;
r=2;
gradu=1;
gradr=1;
iteru=1;
iterr=1;
for a=1:5
    if norm(gradu) > grad_stop && iteru <= max_its
        gradu=0;
        for i=1:5
            gradu=gradu+2*((u/(r+xp(i))^2)-yp(i)/(u/(r+xp(i))));
        end
        u=u-alpha*gradu;
        iteru=iteru+1;
    end
    if norm(gradr) > grad_stop && iterr <= max_its
        gradr=0;
        for i=1:5
            gradr=gradr+2*(((-u^2)/(r+xp(i))^2)+yp(i)*u/(u/(r+xp(i))^2));
        end
        r=r-alpha*gradr;
        iterr=iterr+1;
    end
    for j=1:5
        out(iterr)=out(iterr)+((u/(r+xp(j)))-yp(j))^2;
    end
    plot(out,'LineWidth',2);
end
