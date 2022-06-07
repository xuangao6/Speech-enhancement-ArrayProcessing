% EE4715 - Array processing Part 2
% Channel equalization

clc
clear all

P = 4;
N = 500;
sigma = 0;
%% Signal Model - 1
% generate s matrix
Ns = 300;
s = zeros(Ns,1);
s_i = [1/(2^(1/2))+i/(2^(1/2)), -1/(2^(1/2))+i/(2^(1/2)), -1/(2^(1/2))-i/(2^(1/2)), 1/(2^(1/2))-i/(2^(1/2))]';
for i = 1:Ns
    s(i) = s_i(randi([1,4],1));
end
% generate x
sigma = 0;
x = gendata_conv(s,P,N,sigma);


%% Signal Model - 2
P = 4;
N = 500;
sigma = 0;



%% Signal Model - 3






