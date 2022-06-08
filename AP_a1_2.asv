% EE4715 - Array processing Part 2
% Channel equalization

clc
clear all


%% Signal Model 
% generate s matrix
Ns = 300;
s = zeros(Ns,1);
s_i = [1/(2^(1/2))+i/(2^(1/2)), -1/(2^(1/2))+i/(2^(1/2)), -1/(2^(1/2))-i/(2^(1/2)), 1/(2^(1/2))-i/(2^(1/2))]';
for i = 1:Ns
    s(i) = s_i(randi([1,4],1));
end
% generate x
P = 4;
N = 500;
L = N-Ns+1;
sigma = 0;
[x,X,H,S] = gendata_conv(s,P,N,sigma);

chi = zeros(2*P,N-1); % \chi is 2 symbol periods
chi(1:P,:) = X(1:P,1:N-1);
chi((P+1):2*P,:) = X(1:P,2:N);
rank_chi = rank(chi); % the rank of chi is 2P
%% Zero-forcing and Wiener equalizer
Hm = zeros(2*P,L+1);
Hm_1 = [zeros(P,1), H];
Hm_2 = [H, zeros(P,1)];
Hm = [Hm_1;Hm_2];
WH_zf = pinv(Hm); % zero-forcing
wh_zf = WH_zf(1,:);
ss = wh_zf*chi;
ahH = wh_zf*Hm;

figure(1)
plot(real(ahH),imag(ahH),'ro');
grid on

figure(2)
plot(real(ss),imag(ss),'ro');
grid on

