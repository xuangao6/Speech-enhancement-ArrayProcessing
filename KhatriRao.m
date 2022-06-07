function K = KhatriRao(d,f,Delta,theta,M,N)
% a data model using the Khatri-Rao product structure
% theta = theta(:);
% f = f(:);
F = zeros(3,d);
A = zeros(M,d);
S = zeros(d,N);
% phi_fre = diag(exp(i*2*pi*f));
% the = diag(theta);
%% F
% phi = exp(j*2*pi*Delta*sin(theta)) % size 1*2
phi_fre = exp(i*2*pi*f);
the = theta;
one = ones(1,d);
F = [one;phi_fre;the];
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
A1 = A(:,1);
A2 = A(:,2);

F1 = F(:,1);
F2 = F(:,2);

for mm = 1:3
    KK_1((1+(mm-1)*M):(M+(mm-1)*M)) = F(mm,1)*A(:,1);
end

for mm = 1:3
    KK_2((1+(mm-1)*M):(M+(mm-1)*M)) = F(mm,2)*A(:,2);
end
KK = [KK_1' KK_2'];
K = KK*S;
end
