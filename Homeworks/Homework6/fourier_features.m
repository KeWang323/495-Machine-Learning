function F = fourier_features(x,D)
    F=zeros(2*D,size(x,1));
    for i=1:D
        for j=1:size(x,1)
            F(2*i-1,j)=cos(2*pi*i*x(j,1));
            F(2*i,j)=sin(2*pi*i*x(j,1));
        end
    end
    F=[ones(1,size(F,2));F];
end