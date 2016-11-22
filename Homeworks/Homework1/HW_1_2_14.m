max_its=100;
steplength=[10^-3,10^-1,1.001];
out=zeros(100,1);
 for i=1:3
	alpha=steplength(i);
	w=[1; 1; 1; 1; 1; 1 ;1 ;1 ;1; 1 ];
	for iter=1:100
        out(iter,i)=w'*w;
        grad=2*w ;   %%% PLACE GRADIENT HERE
        w=w-alpha*grad;
    end
    plot(out,'LineWidth',2);
 end
%grid on
title('HW1 2.14')
legend('10^-3','10^-1','1.001','location','northwest')
xlabel('iteration');
ylabel('objective function value');