function x = gendata_conv(s,P,N,sigma)
% construct the sequence x
% s: Ns*1
Ns = 5;

% generate H
L = N-Ns+1;
H = zeros(P,L);

for k = 0:(L-1)
    for pp = 1:P
    if ( ((k+(pp-1)/P)/(L-1/P)) >= 0 && ((k+(pp-1)/P)/(L-1/P)) <=0.25) || (((k+(pp-1)/P)/(L-1/P)) >= 0.5 && ((k+(pp-1)/P)/(L-1/P)) <=0.75)
        h = 1;
    elseif (((k+(pp-1)/P)/(L-1/P)) >= 0.25 && ((k+(pp-1)/P)/(L-1/P)) <=0.5) || (((k+(pp-1)/P)/(L-1/P)) >= 0.75 && ((k+(pp-1)/P)/(L-1/P)) <=1 )
        h = -1;
    end
    H(pp,k+1) = h;
    end
end

% genetate S
S = zeros(L,N);
for ss = 1:L
    S(ss,(ss:Ns+ss-1)) = s(1:Ns,:);
end

% generate X
X = zeros(P,N);
X = H*S;

% generate xx
x = zeros(P*N,1);
for mm = 1:N
    x((P*(mm-1)+1):P*mm,1) = X(1:P,mm);
end

end

% xx = zeros(N,1);
% for t = 1:N
%     for k = 1:N
%         xx(t,1) = h(t-k)*s(k);
%     end
% end
% n = 
%     x = xx + n;
