function Fs = poly_features(x,D)
F=zeros(D,size(x,1));
for i=1:D
    for j=1:size(x,1)
        F(i,j)=x(j,1)^i;
    end
end
Fs=[ones(1,size(F,2));F];
end