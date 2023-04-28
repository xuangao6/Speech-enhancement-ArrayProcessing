% A = zeros(2,1,2);
% A(:,:,1) = [1 2]';
% A(:,:,2) = [3 4]'
clc
clear all
M=3;
Delta=1/2;
for tea = -90:1:90
    tea = deg2rad(tea);
   c = (1:M);
    for ff = 1:M
        phi(ff,tea+91) = 2*pi*Delta*sin(tea).*c(1,ff);
    end    
end

A = exp(i*phi);
WH = pinv(A);

% for pp = 1:P
%     if ( ((k+(pp-1)/P)/(N-1/P)) >= 0 && ((k+(pp-1)/P)/(N-1/P)) <=0.25) || (((k+(pp-1)/P)/(N-1/P)) >= 0.5 && ((k+(pp-1)/P)/(N-1/P)) <=0.75)
%         h(pp) = 1;
%     elseif (((k+(pp-1)/P)/(N-1/P)) >= 0.25 && ((k+(pp-1)/P)/(N-1/P)) <=0.5) || (((k+(pp-1)/P)/(N-1/P)) >= 0.75 && ((k+(pp-1)/P)/(N-1/P)) <=1 )
%         h(pp) = -1;
%     end
% end

% for pp = 1:P
%     if ((pp-1/P) >= 0 && (pp-1/P) <=0.25) || ((pp-1/P) >= 0.5 && (pp-1/P) <=0.75)
%         h((pp-1/P)) = 1;
%     elseif ((pp-1/P) >= 0.25 && (pp-1/P) <=0.5) || ((pp-1/P) >= 0.75 && (pp-1/P) <=1)
%         h((pp-1/P)) = -1;
%     end
%     hh(pp,1) = h(pp-1/P);
% end

% for M=1:4
%     for tf=1:10
%         rn_1(:,tf) = xcorr(noise_1(M,tf,:));
%     end
%     Rn_1(M,:,:,tf) = toeplitz(rn_1(:,tf));
% end
% 
% Rx_11(:,:) = Rx_1(1,:,:,1);
% Rn_11(:,:) = Rn_1(1,:,:,1);
% [V, D] = eig(Rx_11,Rn_11);

% a=1

% for tf=1:11
%     for M=1:4
%         rx_1(:,tf) = xcorr(noisy_1(M,tf,:));
% %         Rx_1(M,:,:,tf) = toeplitz(rx_1(:,tf));
%     end
% end 

