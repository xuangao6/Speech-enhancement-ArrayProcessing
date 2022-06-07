function f=espritfreq(X,d)
M=size(X,1);
N=size(X,2);
% 用每一行的x计算，然后求平均
Z=zeros(M,N-M+1);%5*16
FF=zeros(M,d);
for k=1:M
    x=X(k,:);
    for p=1:M
        Z(p,:)=x(p:N-M+p);
    end
    XX=Z(1:M-1,:);
    YY=Z(2:M,:);
    ZZ=[XX;YY];%2(M-1)*N
    [Uz,e,~]=svd(ZZ);
    [~,indx] = sort(diag(e),'descend');
    Uz=Uz(:,indx);
    Uz=Uz(:,1:d);
    Ux=Uz(1:M-1,:);
    Uy=Uz(M:2*M-2,:);
    Theta=eig(pinv(Ux)*Uy);
    f=(real(log(Theta)./1j)./(2*pi))';
    f=sort(f,'descend');
    FF(k,:)=f;
end
f=mean(FF);

%%%%%%%%%%%%%%%%%%%% third version %%%%%%%%%%%%%%%%%%%%
% 用每一行的x计算Rx，然后求平均
% FF=zeros(M,d);
% for k=1:M
%     x=X(k,:);%length 20
%     m=N-1;
%     rx=xcorr(x);%length of rx is 2n-1;
%     Rx=toeplitz(rx(N:N+m))/N;
%     [~,e,Uz]=eig(Rx);
%     [~,indx] = sort(diag(e),'descend');
%     Uz=Uz(:,indx);
%     Uz=Uz(:,1:d);
%     Ux=Uz(1:N-1,:);
%     Uy=Uz(2:N,:);
%     Theta=eig(pinv(Ux)*Uy);
%     % Theta1=sort(Theta,'descend');
%     % Theta2=Theta1(1:2,:);
%     f=abs((real(log(Theta)./1j)./(2*pi))');
%     f=sort(f,'descend');
%     FF(k,:)=f;
% end
% f=mean(FF);

end