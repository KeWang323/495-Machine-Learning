clear
clc;

data=csvread('D:\Courses Files\Machine Learning\Homeworks\Homework3\exercise 9 data\breast_cancer_data.csv');
X=data(:,1:end-1);
y=data(:,end);

X=[ones(size(X,1),1) X]';
w=0.0005*ones(9,1);

iter=1;
max_its=10;
grad1=1;
nummissoft=zeros(max_its,1);
while  norm(grad1)>10^-12 && iter<=max_its
    grad1=0;
    grad2=0;
    for i=1:699
        a=-y(i)*X(:,i)'*w;
        grad1=grad1-(1/(1+exp(-a)))*y(i)*X(:,i);
        grad2=grad2+(1/(1+exp(-a)))*(1-(1/(1+exp(-a))))*X(:,i)*X(:,i)';
    end
    w=w-pinv(grad2)*grad1;
    for i=1:699
        nummissoft(iter,1)=nummissoft(iter,1)+max(max(0,sign(-y(i)*X(:,i)'*w)));
    end
    iter=iter+1;
end
plot(nummissoft,'color','black','LineWidth',2);

hold on

w=0.0005*ones(9,1);
iter=1;
grad3=1;
nummissqu=zeros(max_its,1);
while  norm(grad3)>10^-14 && iter<=max_its
    grad3=0;
    grad4=0;
    for i=1:699
        grad3=grad3-2*max(0,1-y(i)*X(:,i)'*w)*y(i)*X(:,i);
        if 1-y(i)*X(:,i)'*w>0
            grad4=grad4+2*X(:,i)*X(:,i)';
        end
    end

    w=w-pinv(grad4)*grad3;
    for i=1:699
        nummissqu(iter,1)=nummissqu(iter,1)+max(0,sign(-y(i)*X(:,i)'*w));
    end
    iter=iter+1;
end
plot(nummissqu,'color','m','LineWidth',2);
legend('softmax cost','squared margin','location','northeast')
xlabel('iteration');
ylabel('number of misclassifications');
title('HW3 4.9')