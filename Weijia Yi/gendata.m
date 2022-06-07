function [X,A,S]=gendata(M,N,Delta,theta,f,SNR,n)
MM=(0:M-1)';%行数，离散空间
theta=deg2rad(theta);
delay=2.*pi.*Delta.*sin(theta).*MM;
k=(1:N);%列数，离散时间

A=exp(1j.*delay);
S=exp(1j.*2.*pi.*f.*k);
if n==0
    X=A*S;
else if n==1
        X=awgn(A*S,SNR,'measured');
    end
end
end