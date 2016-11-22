clear;
clc;
%%%%%%读取数据 建立空矩阵%%%%%%
data = csvread('D:\Courses Files\Machine Learning\Homeworks\Homework4\MNIST exercise\MNIST_train_data.csv');
X=data(:,1:end - 1);
y=data(:,end);
X=[ones(size(X,1),1), X];
X = X';
datat = csvread('D:\Courses Files\Machine Learning\Homeworks\Homework4\MNIST exercise\MNIST_test_data.csv');
Xt=datat(:,1:end - 1);
yt=datat(:,end);
Xt=[ones(size(Xt,1),1), Xt];
Xt = Xt';

y1=-1*ones(60000,1);
y2=-1*ones(60000,1);
y3=-1*ones(60000,1);
y4=-1*ones(60000,1);
y5=-1*ones(60000,1);
y6=-1*ones(60000,1);
y7=-1*ones(60000,1);
y8=-1*ones(60000,1);
y9=-1*ones(60000,1);
y10=-1*ones(60000,1);
for i=1:60000
    switch (y(i))
        case 1
            y1(i)=1;

        case 2
            y2(i)=1;

        case 3
            y3(i)=1;

        case 4
            y4(i)=1;

        case 5
            y5(i)=1;

        case 6
            y6(i)=1;

        case 7
            y7(i)=1;

        case 8
            y8(i)=1;

        case 9
            y9(i)=1;

        case 10
            y10(i)=1;
    end
end
yt1=-1*ones(10000,1);
yt2=-1*ones(10000,1);
yt3=-1*ones(10000,1);
yt4=-1*ones(10000,1);
yt5=-1*ones(10000,1);
yt6=-1*ones(10000,1);
yt7=-1*ones(10000,1);
yt8=-1*ones(10000,1);
yt9=-1*ones(10000,1);
yt10=-1*ones(10000,1);
for i=1:10000
    switch (yt(i))
        case 1
            yt1(i)=1;

        case 2
            yt2(i)=1;

        case 3
            yt3(i)=1;

        case 4
            yt4(i)=1;

        case 5
            yt5(i)=1;

        case 6
            yt6(i)=1;

        case 7
            yt7(i)=1;

        case 8
            yt8(i)=1;

        case 9
            yt9(i)=1;

        case 10
            yt10(i)=1;
    end
end
accuracy=zeros(10,1);
accuracyt=zeros(10,1);

%%%%%%1%%%%%%
w1 = softmax_newtons_method(X,y1,1);
w2 = softmax_newtons_method(X,y2,1);
w3 = softmax_newtons_method(X,y3,1);
w4 = softmax_newtons_method(X,y4,1);
w5 = softmax_newtons_method(X,y5,1);
w6 = softmax_newtons_method(X,y6,1);
w7 = softmax_newtons_method(X,y7,1);
w8 = softmax_newtons_method(X,y8,1);
w9 = softmax_newtons_method(X,y9,1);
w10 = softmax_newtons_method(X,y10,1);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(1,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(1,1)=(1/length(yt))*sum(eq(yt,nt'));
%%%%%%2%%%%%%
w1 = softmax_newtons_method(X,y1,2);
w2 = softmax_newtons_method(X,y2,2);
w3 = softmax_newtons_method(X,y3,2);
w4 = softmax_newtons_method(X,y4,2);
w5 = softmax_newtons_method(X,y5,2);
w6 = softmax_newtons_method(X,y6,2);
w7 = softmax_newtons_method(X,y7,2);
w8 = softmax_newtons_method(X,y8,2);
w9 = softmax_newtons_method(X,y9,2);
w10 = softmax_newtons_method(X,y10,2);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(2,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(2,1)=(1/length(yt))*sum(eq(yt,nt'));
%%%%%%3%%%%%%
w1 = softmax_newtons_method(X,y1,3);
w2 = softmax_newtons_method(X,y2,3);
w3 = softmax_newtons_method(X,y3,3);
w4 = softmax_newtons_method(X,y4,3);
w5 = softmax_newtons_method(X,y5,3);
w6 = softmax_newtons_method(X,y6,3);
w7 = softmax_newtons_method(X,y7,3);
w8 = softmax_newtons_method(X,y8,3);
w9 = softmax_newtons_method(X,y9,3);
w10 = softmax_newtons_method(X,y10,3);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(3,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(3,1)=(1/length(yt))*sum(eq(yt,nt'));
%%%%%%4%%%%%%
w1 = softmax_newtons_method(X,y1,4);
w2 = softmax_newtons_method(X,y2,4);
w3 = softmax_newtons_method(X,y3,4);
w4 = softmax_newtons_method(X,y4,4);
w5 = softmax_newtons_method(X,y5,4);
w6 = softmax_newtons_method(X,y6,4);
w7 = softmax_newtons_method(X,y7,4);
w8 = softmax_newtons_method(X,y8,4);
w9 = softmax_newtons_method(X,y9,4);
w10 = softmax_newtons_method(X,y10,4);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(4,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(4,1)=(1/length(yt))*sum(eq(yt,nt'));
%%%%%%5%%%%%%
w1 = softmax_newtons_method(X,y1,5);
w2 = softmax_newtons_method(X,y2,5);
w3 = softmax_newtons_method(X,y3,5);
w4 = softmax_newtons_method(X,y4,5);
w5 = softmax_newtons_method(X,y5,5);
w6 = softmax_newtons_method(X,y6,5);
w7 = softmax_newtons_method(X,y7,5);
w8 = softmax_newtons_method(X,y8,5);
w9 = softmax_newtons_method(X,y9,5);
w10 = softmax_newtons_method(X,y10,5);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(5,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(5,1)=(1/length(yt))*sum(eq(yt,nt'));
%%%%%%6%%%%%%
w1 = softmax_newtons_method(X,y1,6);
w2 = softmax_newtons_method(X,y2,6);
w3 = softmax_newtons_method(X,y3,6);
w4 = softmax_newtons_method(X,y4,6);
w5 = softmax_newtons_method(X,y5,6);
w6 = softmax_newtons_method(X,y6,6);
w7 = softmax_newtons_method(X,y7,6);
w8 = softmax_newtons_method(X,y8,6);
w9 = softmax_newtons_method(X,y9,6);
w10 = softmax_newtons_method(X,y10,6);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(6,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(6,1)=(1/length(yt))*sum(eq(yt,nt'));
%%%%%%7%%%%%%
w1 = softmax_newtons_method(X,y1,7);
w2 = softmax_newtons_method(X,y2,7);
w3 = softmax_newtons_method(X,y3,7);
w4 = softmax_newtons_method(X,y4,7);
w5 = softmax_newtons_method(X,y5,7);
w6 = softmax_newtons_method(X,y6,7);
w7 = softmax_newtons_method(X,y7,7);
w8 = softmax_newtons_method(X,y8,7);
w9 = softmax_newtons_method(X,y9,7);
w10 = softmax_newtons_method(X,y10,7);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(7,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(7,1)=(1/length(yt))*sum(eq(yt,nt'));
%%%%%%8%%%%%%
w1 = softmax_newtons_method(X,y1,8);
w2 = softmax_newtons_method(X,y2,8);
w3 = softmax_newtons_method(X,y3,8);
w4 = softmax_newtons_method(X,y4,8);
w5 = softmax_newtons_method(X,y5,8);
w6 = softmax_newtons_method(X,y6,8);
w7 = softmax_newtons_method(X,y7,8);
w8 = softmax_newtons_method(X,y8,8);
w9 = softmax_newtons_method(X,y9,8);
w10 = softmax_newtons_method(X,y10,8);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(8,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(8,1)=(1/length(yt))*sum(eq(yt,nt'));
%%%%%%9%%%%%%
w1 = softmax_newtons_method(X,y1,9);
w2 = softmax_newtons_method(X,y2,9);
w3 = softmax_newtons_method(X,y3,9);
w4 = softmax_newtons_method(X,y4,9);
w5 = softmax_newtons_method(X,y5,9);
w6 = softmax_newtons_method(X,y6,9);
w7 = softmax_newtons_method(X,y7,9);
w8 = softmax_newtons_method(X,y8,9);
w9 = softmax_newtons_method(X,y9,9);
w10 = softmax_newtons_method(X,y10,9);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(9,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(9,1)=(1/length(yt))*sum(eq(yt,nt'));
%%%%%%10%%%%%%
w1 = softmax_newtons_method(X,y1,10);
w2 = softmax_newtons_method(X,y2,10);
w3 = softmax_newtons_method(X,y3,10);
w4 = softmax_newtons_method(X,y4,10);
w5 = softmax_newtons_method(X,y5,10);
w6 = softmax_newtons_method(X,y6,10);
w7 = softmax_newtons_method(X,y7,10);
w8 = softmax_newtons_method(X,y8,10);
w9 = softmax_newtons_method(X,y9,10);
w10 = softmax_newtons_method(X,y10,10);
w=[w1 w2 w3 w4 w5 w6 w7 w8 w9 w10];
yx=zeros(length(y),10);
yxt=zeros(length(yt),10);
for i=1:10
    yx(:,i)=X'*w(:,i);
    yxt(:,i)=Xt'*w(:,i);
end
n=zeros(length(y),1);
nt=zeros(length(yt),1);
[m,n]=max(yx');
[mt,nt]=max(yxt');
accuracy(10,1)=(1/length(y))*sum(eq(y,n'));
accuracyt(10,1)=(1/length(yt))*sum(eq(yt,nt'));
figure();
plot(accuracy,'color','r','LineWidth',2);
hold on
plot(accuracyt,'color','b','LineWidth',2);
legend('training','test','location','northeast')
xlabel('iteration');
ylabel('accuracy');
title('HW4 MNIST')