% EE4715 - Array processing Part 1
% Estimation of directions and frequencies

clc
clear all

%% signal model
d = 2;
M = 3;
N = 20;
theta = deg2rad([-20,30]);
f = [0.1,0.3];
SNR = 20; 
Delta = 1/2;
[X, X_,S,A] = gendata(M,N,Delta,theta,f,SNR);
X_singular = svd(X);
N_ = 2*N; % double samples
[XX, XX_, SS] = gendata(M,N_,Delta,theta,f,SNR);
XX_singular = svd(XX);
M_ = 2*M; % double antennas
[XXX, XXX_] = gendata(M_,N,Delta,theta,f,SNR);
XXX_singular = svd(XXX);
theta_ = deg2rad([-5,5]); % smaller angle difference
[XXXX, XXXX_] = gendata(M,N,Delta,theta_,f,SNR);
XXXX_singular = svd(XXXX);
f_ = [0.1,0.12]; % smaller freq difference
[XXXXX, XXXXX_] = gendata(M,N,Delta,theta,f_,SNR);
XXXXX_singular = svd(XXXXX);

% figure(1)
% plot(1:M,X_singular,'ro',1:M,XX_singular,'b*'), legend('N samples','2N samples');
% title('The effect of sample numbers on singular values','FontSize',12)
% xlabel('M','FontSize',10);
% ylabel('singular values of X','FontSize',10);
% % axis([1 128 -0.2 1]);
% grid on
% 
% figure(2)
% plot(1:M,X_singular,'ro',1:M_,XXX_singular,'b*'), legend('M antennas','2M antennas');
% title('The effect of antennas numbers on singular values','FontSize',12)
% xlabel('M','FontSize',10);
% ylabel('singular values of X','FontSize',10);
% % axis([1 128 -0.2 1]);
% grid on
% 
% figure(3)
% plot(1:M,X_singular,'ro',1:M,XXXX_singular,'b*'), legend('\theta = [-20 30]','\theta = [-5 5]');
% title('The effect of different angles on singular values','FontSize',12)
% xlabel('M','FontSize',10);
% ylabel('singular values of X','FontSize',10);
% % axis([1 128 -0.2 1]);
% grid on
% 
% figure(4)
% plot(1:M,X_singular,'ro',1:M,XXXXX_singular,'b*'), legend('f = [0.1 0.3]','f = [0.1 0.12]');
% title('The effect of different frequencies on singular values','FontSize',12)
% xlabel('M','FontSize',10);
% ylabel('singular values of X','FontSize',10);
% % axis([1 128 -0.2 1]);
% grid on
%% estimation of directions
theta_est = esprit(X_,d, Delta);
%% estimation of frequencies
% figure(5)
% plot(1:N, S(1,:), 1:N, S(2,:));
% grid on
f_est = espritfreq(X_,d);
%% joint estimation of directions and frequencies
m = 6;
[theta_est2,f_est2,Jxphi_part] = joint(X_,d,m);
%% comparison
d_com = 2;
M_com = 3;
N_com = 20;
theta_com = deg2rad([-20,30]);
f_com = [0.1,0.12];
SNR = [0 4 8 12 16 20];
% X_com = zeros(M_com,N_com,size(SNR,2),1000);

% [X_com, ~,~,A] = gendata(M_com,N_com,Delta,theta_com,f_com,SNR);
% WH = pinv(A);

% for tea = -90:1:90
%    c = (1:M);
%     for ff = 1:M
%         phi(ff,tea+91) = 2*pi*Delta*sin(tea).*c(1,ff);
%     end
% end 
%     A = exp(i*phi);



% c = (1:M);
% for ff = 1:M
%     for a = 1:d
%         phi(ff,a) = 2*pi*Delta*sin(theta(a,1)).*c(1,ff);
%     end
% end 

% A = exp(i*phi);



% for hh = 1:1000
%     for cpe = 1:size(SNR,2)
%         [X_com(:,:,cpe,hh), ~,~] = gendata(M_com,N_com,Delta,theta_com,f_com,SNR(cpe));
%     end
% 
%     for cpe = 1:size(SNR,2)
%         theta_com1(:,:,cpe,hh) = esprit(X_com(:,:,cpe),d_com, Delta);
%     end
% 
%     for cpe = 1:size(SNR,2)
%         f_com1(:,:,cpe,hh) = espritfreq(X_com(:,:,cpe),d_com);
%     end
% 
%     for cpe = 1:size(SNR,2)
%         [theta_com2(:,:,cpe,hh),f_com2(:,:,cpe)] = joint(X_com(:,:,cpe),d_com,m);
%     end
% end

% theta_com1_mean =  mean(theta_com1(:,:,1,:));
% f_com1_mean = 
% theta_com2_mean = 








