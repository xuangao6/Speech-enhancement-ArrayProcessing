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
