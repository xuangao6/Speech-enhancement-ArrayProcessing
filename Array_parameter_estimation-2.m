clear all
P=4;
N=500;
sigma=0;
L=1;
Ns=N-L+1;
indx=ceil(4.*rand(1,2000));
sk=[1/sqrt(2)+1j/sqrt(2) 1/sqrt(2)-1j/sqrt(2) -1/sqrt(2)+1j/sqrt(2) -1/sqrt(2)-1j/sqrt(2)];
s=zeros(1,Ns);
for k=1:Ns
    num=indx(k);
    s(k)=sk(num);
end
%%%%%%Ns>L
%%%%%%N=Ns+L-1
[x,~]=gendata_conv(s,P,N,sigma);
X=zeros(2*P,N-1);
for m=1:2*P
    for n=1:N-1
        X(m,n)=x(P*(n-1)+m);
    end
end

%% ZF
P2=4;
N2=500;
sigma2=0.5;

[x2,H]=gendata_conv(s,P2,N2,sigma2);
X2=zeros(2*P2,N2-1);
for m=1:2*P2
    for n=1:N2-1
        X2(m,n)=x2(P2*(n-1)+m);
    end
end
ze=zeros(size(H,1),1);
Hm=[ze H;H,ze];
e1=zeros(size(Hm,2),1);
e1(1)=1;
e2=zeros(size(Hm,2),1);
e2(2)=1;
h1=Hm*[e1 e2]; 
W_zf=pinv(Hm*(Hm'))*h1;
W_wi=(Hm*(Hm')+(sigma2^2).*eye(size(Hm,1)))\h1;

fig1=figure(1);
title('P=4')
subplot(2,2,1)
plot(real(S_zf(1,:)),imag(S_zf(1,:)),'.')
title('Zero-forcing')
subtitle('the first output')
axis([-1.5 1.5 -1.5 1.5])
grid on
subplot(2,2,2)
plot(real(S_zf(2,:)),imag(S_zf(2,:)),'.')
title('Zero-forcing')
subtitle('the second output')
axis([-1.5 1.5 -1.5 1.5])
grid on
subplot(2,2,3)
plot(real(S_wi(1,:)),imag(S_wi(1,:)),'.')
title('Wiener')
subtitle('the first output')
axis([-1.5 1.5 -1.5 1.5])
grid on
subplot(2,2,4)
plot(real(S_wi(2,:)),imag(S_wi(2,:)),'.')
title('Wiener')
subtitle('the second output')
axis([-1.5 1.5 -1.5 1.5])
grid on
set(fig1, 'Position', [100,100,800,800])

figure(2)
plot(real(s),imag(s),'+')
