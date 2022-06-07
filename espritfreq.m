function f = espritfreq(X,d)
%Estimation of frequencies
[M,N] = size(X);

for n = 1:M
    for m = 1:M
        ZZ(m,:) = X(n,m:(N-M+m));
    end
    x = ZZ(1:(M-1),:);
    y = ZZ(2:M,:);
    Z = [x;y];
    [U,S,V] = svd(Z); 
    Ux = U(1:M-1,1:d);
    Uy = U(M:2*M-2,1:d);
    z = pinv(Ux)*Uy;
    ev = eig(z);
    evv = sort(ev);
    buff = imag(log(evv))/(2*pi);
    buff = sort(buff,'ascend');
    f(n,:) = buff;
end 
    f = mean(f)';
 
end
