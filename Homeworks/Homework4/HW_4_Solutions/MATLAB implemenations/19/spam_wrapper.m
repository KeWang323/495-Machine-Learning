function spam_wrapper()

% load data
[X,y] = load_data();

% run iterative grad
run_comparison(X,y);

%%%%%%%%%%%%%%% subfunctions %%%%%%%%%%%
%%% compare grad descents %%% 
function run_comparison(X_orig,y)
    X = X_orig;

    % remove the non BoW features
    X = X(:,1:48);
    X = [ ones(size(X,1),1), X];
    X = X';

    % run softmax
    [mis,w] = squared_margin_grad(X,y);
    plot_it(mis,'k',2)

    % keep char BoW features 
    X = X_orig;
    X = X(:,1:54);
    X = [ ones(size(X,1),1), X];
    X = X';

    [mis,w] = squared_margin_grad(X,y);
    plot_it(mis,'g',2)
    
    
    % keep char BoW features and spam features and take logs of big numbers
    X = X_orig;
    X(:,end) = log(X(:,end));
    X(:,end - 1) = log(X(:,end - 1));
    X = [ ones(size(X,1),1), X];
    X = X';

    [mis,w] = squared_margin_grad(X,y);
    plot_it(mis,'m',2)


    % plot mean result
    legend('BoW','BoW + chars', 'BoW + chars + spam feats')
end

function [in,w] = squared_margin_grad(X,y)

%%%%%%%%%%%%%%%%% functions %%%%%%%%%%%%%%%
%%% gradient descent function for margin squared function %%%


    w = randn(size(X,1),1)/10;
    alpha = 10^-6;
    
    % Initializations 
    iter = 1;
    max_its = 5000;
    
    in = [];% this will contain array of misclassifications
    cost = [];
        
    H = bsxfun(@times,X',y);
    l = ones(size(X,2),1);
    
    while  iter < max_its
       iter
        grad = -2*H'*max(0,l - H*w);
        w = w - alpha*grad;
 
        % update iteration count
        iter = iter + 1;
        
        % at the end of an iteration, calculate number of
        % misclassifications
        % calculate number of misclassifications
        maxTerm = sign(-H*w);
        maxTerm = max(0,maxTerm);
        misClassSum = ones(1,length(maxTerm))*maxTerm;
        
           
        
        
    
        
        

        in = [in, misClassSum];
        
    end
  
end

%%% plots descent levels %%%
function plot_it(mis,color,width)
    % plot all
    start = 2;
    hold on
    plot(start:length(mis),mis(start:end),'Color',color,'LineWidth',width);
    title('# of misclassifications')
    box off
    
    % last adjustments to plot    
    axis tight
    set(gca,'FontSize',14)
    xlabel('iteration','FontSize',18)
    ylabel('number of misclassifications','FontSize',18)

end

%%% load data %%%
function [X, y] = load_data()    
      
    %%% load spam database data %%%
    data = csvread('spambase_data.csv');
    X = data(:,1:end-1);  
    y = data(:,end);
    ind = find(y == 1);
    length(ind)
    ind = find(y == -1);
    length(ind)
end


end