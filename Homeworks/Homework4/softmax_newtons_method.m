function w = softmax_newtons_method(X,y,maxiteration)
    % precomputations
    H = bsxfun(@times,X',y);% @times array multiple .*
%     w = randn(size(X,1),1)/size(X,1);
    w = zeros(size(X,1),1)/size(X,1);
    
    %%% main %%%
    k = 1;
    while k <= maxiteration
        
        % prep gradient for logistic objective
        r = sigmoid(-H*w);
        g = r.*(1 - r);
        grad = -H'*r;
        hess = bsxfun(@times,g,X')'*X'+0.001*eye(size(X,1));

        % take Newton step
        temp = hess*w - grad;
        w = pinv(hess)*temp;
        k = k + 1;
    end
    
    function t = sigmoid(z)
        t = 1./(1 + exp(-z));
    end 
    
end