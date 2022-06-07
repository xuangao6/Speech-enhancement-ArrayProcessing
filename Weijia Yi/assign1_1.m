clear all;
%% generate signal model
M=5;
N=20;
Delta=1/2;
Theta=[-20,30];
%theta=[-pi/9,pi/6];
F=[0.1,0.3]';
SNR=20;

[X,A,S]=gendata(M,N,Delta,Theta,F,SNR,1);

[~,Singular,~] = svd(X,'econ');
% figure(1)
% stem(diag(Singular),'o')

%% estimation of directions
d=2;
theta=esprit(X,d);

%% estimation of frequency
f=espritfreq(X,d);

%% joint estimation
[theta_j,f_j]=joint(X,2,3);

