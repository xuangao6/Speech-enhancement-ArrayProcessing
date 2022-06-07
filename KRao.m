function [X,Y,Z] = KRao(d,f,Delta,theta,M,N)
% a data model using the Khatri-Rao product structure
% theta = theta(:);
% f = f(:);
F = zeros(3,d);
A = zeros(M,d);
S = zeros(d,N);
phi_fre = diag(exp(i*2*pi*f));
the = diag(theta);
%% S
z = (1:N);
S = exp(i*2.*pi.*z.*f');
%% A
c = (1:M);
for ff = 1:M
    for a = 1:d
        phi(ff,a) = 2*pi*Delta*sin(theta(a)).*c(1,ff);
    end
end 
A = exp(i*phi);
%% [X;Y;Z]
X = A*S;
Y = A*phi_fre*S;
Z = A*the*S;
end
