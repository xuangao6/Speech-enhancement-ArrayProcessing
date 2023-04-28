function theta = esprit(X,d,Delta)
% ESPRIT algorithm implementation
% to estimate the angles of arrival from a data matrix X
% ,assuming the number of sources is known
[M,N] = size(X);
x = X(1:(M-1),:);
y = X(2:M,:);
Z = [x;y];
[U,V,~] = svd(Z); % U: 2M*d
Ux = U(1:M-1,1:d);
Uy = U(M:2*M-2,1:d);
z = pinv(Ux)*Uy;
ev = eig(z);
evv = sort(ev);
% ec = evv(1:d,:);
sin_theta = imag(log(evv))/(2*pi*Delta);
theta = asin(sin_theta);
theta = rad2deg(theta);
% theta = theta';
end
