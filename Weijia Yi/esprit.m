function theta=esprit(X,d)
M=size(X,1);
XX=X(1:M-1,:);
YY=X(2:M,:);
Z=[XX;YY];%2(M-1)*N
[Uz,~,~]=svd(Z);
Uz=Uz(:,1:d);
Ux=Uz(1:M-1,:);
Uy=Uz(M:2*M-2,:);
Theta=eig(pinv(Ux)*Uy);
theta=int8(real(asind(log(Theta)./(1j*pi))));
end