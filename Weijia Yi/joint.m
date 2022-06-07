function [theta,f]=joint(X,d,m)
%m我试过3和4
M=size(X,1);
N=size(X,2);
Z=zeros(m*M,N-m+1);
for k=0:(m-1)
    for p=1:N-m+1
        Z(k*M+1:(k+1)*M,p)=X(:,p+k);
    end
end
[Uz,~,~]=svd(Z);
Uz=Uz(:,1:d);

%根据文献的矩阵拆分
Im1=[eye(m-1),zeros(m-1,1)];%[Im-1 0]
Im2=[zeros(m-1,1),eye(m-1)];%[0 Im-1]
IM1=[eye(M-1),zeros(M-1,1)];%[IM-1 0]
IM2=[zeros(M-1,1),eye(M-1)];%[0 IM-1]

Jx_phi=kron(Im1,eye(M));
Jy_phi=kron(Im2,eye(M));
Jx_theta=kron(eye(m),IM1);
Jy_theta=kron(eye(m),IM2);

Ux_phi=Jx_phi*Uz;
Uy_phi=Jy_phi*Uz;
Ux_theta=Jx_theta*Uz;
Uy_theta=Jy_theta*Uz;

MM_len=d;
MM=zeros(MM_len,MM_len,2);
MM(:,:,1)=pinv(Ux_phi)*Uy_phi;
MM(:,:,2)=pinv(Ux_theta)*Uy_theta;

[~,LL] = acdc(MM);

theta=diag(LL(:,:,2));
theta=int8(real(asind(log(theta)./(1j*pi))));
f=diag(LL(:,:,1));
f=(real(log(f)./1j)./(2*pi))';