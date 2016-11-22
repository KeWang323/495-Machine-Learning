clear;
clc;

data = csvread('D:\Courses Files\Machine Learning\Homeworks\Homework4\exercise 19\spambase_data.csv');
X=data(:,1:end - 1);
y=data(:,end);
X=[ones(size(X,1),1), X];
X=X';
max_its=1000;

w1=ones(size(X(1:49,:),1),1)/100;
L1=max(eig(X(1:49,:)'*X(1:49,:)));
L1=2*L1;
iter=1;
grad1=1;
nummis1=ones(max_its,1);
while  norm(grad1)>10^-12 && iter<=max_its
    grad1=0;
    for i=1:4601
        grad1=grad1-2*max(max(0,1-y(i)*X(1:49,i)'*w1))*y(i)*X(1:49,i);
    end
        w1=w1-(1/L1)*grad1;
    for i=1:4601
        nummis1(iter,1)=nummis1(iter,1)+max(max(0,sign(-y(i)*X(1:49,i)'*w1)));
    end
    iter=iter+1;
end


w2=ones(size(X(1:55,:),1),1)/100;
L2=max(eig(X(1:55,:)'*X(1:55,:)));
L2=2*L2;
iter=1;
grad2=1;
nummis2=zeros(max_its,1);
while  norm(grad2)>10^-12 && iter<=max_its
    grad2=0;
    for i=1:4601
        grad2=grad2-2*max(max(0,1-y(i)*X(1:55,i)'*w2))*y(i)*X(1:55,i);
    end
        w2=w2-(1/L2)*grad2;
    for i=1:4601
        nummis2(iter,1)=nummis2(iter,1)+max(max(0,sign(-y(i)*X(1:55,i)'*w2)));
    end
    iter=iter+1;
end



for i=57:58
    for j=1:4601
        X(i,j)=log10(X(i,j));
    end
end
X=zscore(X);

% w3 = zeros(58,1);
L3=max(eig(X'*X));
L3=2*L3;
w3=ones(size(X,1),1)/100;
iter=1;
grad3=1;
nummis3=zeros(max_its,1);
while  norm(grad3) >10^-12 && iter<=max_its
    grad3=0;
    for i=1:4601
        grad3=grad3-2*max(0,1-y(i).*X(:,i)'*w3)*y(i).*X(:,i);
    end
    w3=w3-(1.5/L3)*grad3;
    for i=1:4601
        nummis3(iter,1)=nummis3(iter,1)+max(0,sign(-y(i)*X(:,i)'*w3));
    end
    iter=iter+1;
end
plot(nummis1,'color','b','LineWidth',2);
hold on
plot(nummis2,'color','g','LineWidth',2);
hold on
plot(nummis3,'color','m','LineWidth',2);
legend('BoW','BoW + char.freqs','BoW + char.freqs + spam features','location','northeast')
xlabel('iteration');
ylabel('number of misclassifications');
title('HW4 4.19')