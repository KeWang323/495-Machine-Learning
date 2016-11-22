function tanh_regression_hw()
clear all

% load data
[x,y] = load_data();

% plot data
subplot(1,2,1)
plot_data(x,y)

%%% Main: perform gradient descent to fit tanh basis sum %%%
num_runs = 3;
colors = ['r','g','b'];
for i = 1:num_runs
    
    % minimize least squares cost
    [b,w,c,v,obj_val] = tanh_grad_descent(x,y,i);
    
    % plot resulting fit to data
    color = colors(i);
    subplot(1,2,1)
    plot_approx(b,w,c,v,color);
    hold on
    
    % plot objective value decrease for current run
    subplot(1,2,2)
    hold on
    plot_obj(obj_val,color);
end

%%%%%%%%%%%% ML functions %%%%%%%%%%%%%
%%% gradient descent for single layer tanh nn %%%
    function [b,w,c,v,obj_val] = tanh_grad_descent(x,y,i)
        
        % initialize weights and other items
        [b,w,c,v] = initialize(i);
        P = length(x);
        M = 4;
        alpha = 10^-3;
        l_P = ones(P,1);
        
        % stoppers and containers
        max_its = 15000;
        k = 1;
        obj_val = [];       % container for objective value at each iteration
        
        
        %%% main %%%
        while k <= max_its
            % update gradients
            %%% YOUR CODE GOES HERE
            q=zeros(P,1);
            for j=1:P
                for i=1:M
                    q(j,1)=q(j,1)+w(i)*tanh(c(i)+x(j)*v(i));
                end
            end
            q=q-y+b*ones(P,1);
            grad_b=2*l_P'*q;
            q4=[q,q,q,q];
            
            tn=zeros(P,4);
            for i=1:P
                for j=1:M
                    tn(i,j)=tanh(c(j)+x(i)*v(j));
                end
            end
            grad_w=2*l_P'*(q4.*tn);

            
            s1=zeros(P,1);
            s2=zeros(P,1);
            s3=zeros(P,1);
            s4=zeros(P,1);
            for j=1:P
                s1(j,1)=(sech(c(1)+x(j)*v(1)))^2;
            end
            for j=1:P
                s2(j,1)=(sech(c(2)+x(j)*v(2)))^2;
            end
            for j=1:P
                s3(j,1)=(sech(c(3)+x(j)*v(3)))^2;
            end
            for j=1:P
                s4(j,1)=(sech(c(4)+x(j)*v(4)))^2;
            end
            grad_c(1,1)=2*l_P'*(q.*s1)*w(1);
            grad_c(2,1)=2*l_P'*(q.*s2)*w(2);
            grad_c(3,1)=2*l_P'*(q.*s3)*w(3);
            grad_c(4,1)=2*l_P'*(q.*s4)*w(4);
            
            grad_v(1,1)=2*l_P'*(q.*x.*s1)*w(1);
            grad_v(2,1)=2*l_P'*(q.*x.*s2)*w(2);
            grad_v(3,1)=2*l_P'*(q.*x.*s3)*w(3);
            grad_v(4,1)=2*l_P'*(q.*x.*s4)*w(4);
            
            % take gradient steps
            b = b - alpha*grad_b;
            w = w - alpha*grad_w';
            c = c - alpha*grad_c;
            v = v - alpha*grad_v;
            
            % update stopper and container
            k = k + 1;
            obj_val = [obj_val, calculate_obj_val(x,y,b,w,c,v)];
        end
        
        function s = calculate_obj_val(x,y,b,w,c,v)
            s = 0;
            P = length(x);
            for p = 1:P
                s = s + (b + w'*tanh(c + v*x(p)) - y(p))^2;
            end
        end
    end

%%% randomly initialize parameters %%%
    function [b,w,c,v] = initialize(i)
        b = 0;
        w = 0;
        c = 0;
        v = 0;
        if i == 1
            b = -0.4544;
            w = [-0.3461   -0.8727    0.6312    0.9760]';
            c = [ -0.6584    0.7832   -1.0260    0.5559]';
            v = [-0.8571   -0.8623    1.0418   -0.4081]';
            
        elseif i == 2
            b =    -1.1724;
            w = [  0.0950   -1.9936   -3.6876   -0.6466]';
            c = [ -3.4814   -0.3177   -4.7905   -1.5374]';
            v = [-0.7055   -0.6778    0.1639   -2.4117]';
        elseif i==3
            b =  0.1409;
            w = [0.5207   -2.1275   10.7415    3.5584]';
            c = [2.7754    0.0417   -5.5907   -2.5756]';
            v = [-1.8030    0.7578   -2.4235    0.6615]';
        end
    end

%%%%%%%%%%%% data manipulation and plotting functions %%%%%%%%%%%%%
%%% plot tanh approximation %%%
    function plot_approx(b,w,c,v,color)
        M = length(c);
        s = [0:0.01:1]';
        t = b;
        for m = 1:M
            t = t + w(m)*tanh(c(m) + v(m)*s);
        end
        hold on
        plot(s,t,color,'LineWidth',2)
        %axis([0 1 (min([t;y]) - 0.1) (max([t;y]) + 0.1)])
    end

%%% plot objective value at each iteration of gradient descent %%%
    function plot_obj(o,color)
        if length(o) == 15000
            plot(100:length(o), o(100:end),'color', color)
            set(gca,'XTick',[100,1000,5000:5000:length(o)])
        else
            plot(1:length(o), o,'color', color)
        end
        xlabel('$$k$$','Fontsize',20,'Interpreter','latex')
        ylabel('$$g(w^k)$$  ','Fontsize',20,'Interpreter','latex')
        set(get(gca,'YLabel'),'Rotation',0)
        axis square
        set(gcf,'color','w');
    end

%%% plot data %%%
    function plot_data(x,y)
        scatter(x,y,30,'k','fill');
        hold on
        
        % graph info labels
        xlabel('x','Fontsize',18)
        ylabel('y   ','Fontsize',18)
        set(get(gca,'YLabel'),'Rotation',0)
        axis square
        set(gcf,'color','w');
    end

%%% load data %%%
    function [x,y] = load_data()
        data = csvread('D:\Courses Files_2015_Fall\Machine Learning\Homeworks\Homework5\tanh_regression_exercise\noisy_sin_samples.csv');
        x = data(:,1);
        y = data(:,2);
    end
%     function tan = tanh(z)
%         t = 1./(1 + exp(-z));
%         tan=2*t-1;
%     end
%     function sec= sech(z)
%         sec=2/(exp(z)+exp(-z));
%     end
end


