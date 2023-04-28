function [X,X_,S,A] = gendata(M,N,Delta,theta,f,SNR)
% data generator function
% X: M*N
% M: number of antennas
% N: number of samples
% A: M*d
% S: d*N
% d: number of sinusoidal signals(source)
% Delta: antenna spacing; Delta = 1/2 * lambda
% theta: d*1; -90 - 90
% f: normalized frequencies 0 - 1
% SNR: per source
d = 2;
X = zeros(M,N);
A = zeros(M,d);
S = zeros(d,N);
theta = theta(:);
f = f(:);
%% A
c = (1:M);
for ff = 1:M
    for a = 1:d
        phi(ff,a) = 2*pi*Delta*sin(theta(a,1)).*c(1,ff);
    end
end 

A = exp(i*phi);
%% S
z = (1:N);
S = exp(i*2.*pi.*z.*f);
%% X
X_ = A*S;
X = awgn(X_,SNR,'measured');
end

% for k = 1:d
%     for m = 1:M
%         A(m,k) = exp(i*(M-1)*phi(m,k));
%     end
% end

% for m = 1:N
%     for k = 1:d
%         S(k,m) = exp(i*2*pi*f(k)*m);
%     end
% end

% var_noise = power(S,S)*SNR_1;
% X = A*S + noise;

% phi = 2*pi*Delta*sin(theta).*c;