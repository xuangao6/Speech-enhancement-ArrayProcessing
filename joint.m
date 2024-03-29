function [theta,f,Jxphi_part] = joint(X,d,m)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[M,N] = size(X);
Delta = 0.5;
Z=zeros(M*m,(N-m+1));

for kk = 1:M
    for mm = 1:m
        Z(((mm-1)*M+1):mm*M,:) = X(:,mm:(N-m+1+mm-1));
    end
end

[Uz,~,~] = svd(Z);
Uz=Uz(:,1:d);

Jxphi_part = [eye(m-1), zeros(m-1,1)];
Jyphi_part = [zeros(m-1,1), eye(m-1)];
Jxthe_part = [eye(M-1), zeros(M-1,1)];
Jythe_part = [zeros(M-1,1), eye(M-1)];

Jxphi = kron(Jxphi_part, eye(M));
Jyphi = kron(Jyphi_part, eye(M));
Jxthe = kron(eye(m), Jxthe_part);
Jythe = kron(eye(m), Jythe_part);

Uxphi = Jxphi*Uz;
Uyphi = Jyphi*Uz;
Uxthe = Jxthe*Uz;
Uythe = Jythe*Uz;

MM(:,:,1) = pinv(Uxphi)*Uyphi;
MM(:,:,2) = pinv(Uxthe)*Uythe;

[~,LL] = acdc(MM);

theta = diag(LL(:,:,2));
theta = rad2deg(asin(imag(log(theta))/(2*pi*Delta)));
f = diag(LL(:,:,1));
f = imag(log(f))/(2*pi);

end

