clc;
clear;

data=csvread('D:\Courses Files\Machine Learning\Homeworks\Homework3\exercise 10 data\feat_face_data.csv');
X=data(:,1:end-1);
y=data(:,end);
X=[ones(size(X,1),1) X]';

L=max(eig(X'*X));
L1=L/4;
L2=2*L;

w=zeros(497,1);
max_its =500;
iter=1;
grad1=1;
nummissoft=zeros(max_its,1);
while norm(grad1) > 10^-12 && iter <=max_its
    grad1=0;
    for i=1:10000
        a=-y(i)*X(:,i)'*w;
        grad1=grad1-(1/(1+exp(-a)))*y(i)*X(:,i);           % YOUR CODE GOES HERE
    end
        w=w-(1/L1)*grad1;
    for i=1:10000
        nummissoft(iter,1)=nummissoft(iter,1)+max(max(0,sign(-y(i)*X(:,i)'*w)));
    end
    iter=iter+1;
end
plot(nummissoft,'color','black','LineWidth',2);
hold on

w=zeros(497,1);
grad2=1;
nummissqu=zeros(max_its,1);
iter=1;
while norm(grad2) > 10^-12 && iter <=max_its
    grad2=0;
    for i=1:10000
        grad2=grad2-2*max(0,1-y(i)*X(:,i)'*w)*y(i)*X(:,i);
    end
        w=w-(1/L2)*grad2;
    for i=1:10000
        nummissqu(iter,1)=nummissqu(iter,1)+max(max(0,sign(-y(i)*X(:,i)'*w)));
    end
    iter=iter+1;
end
plot(nummissqu,'color','m','LineWidth',2);
legend('softmax cost','squared margin','location','northeast')
xlabel('iteration');
ylabel('number of misclassifications');
title('HW3 4.10')