max_its =100;
out=zeros(100,1);
w=[1; 1; 1; 1; 1; 1 ;1 ;1 ;1; 1 ];
%a=exp(w'*w);
for iter=1:100
	out(iter)=log(1+exp(w'*w));
	grad1=(2*w*exp(w'*w))/(1+exp(w'*w));
	grad2=(2*exp(w'*w)+4*w.^2*exp(w'*w)+2*exp(2*(w')*w))/(1+exp(w'*w))^2;
	w=w-grad1./grad2;
end
plot(out,'LineWidth',2);
title('HW1 2.17')
xlabel('iteration');
ylabel('objective function value');
