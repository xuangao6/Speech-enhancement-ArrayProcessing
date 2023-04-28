clear all
load("data.mat")

frame_num=6718;
frame_size=320;

%% STFT
win = hamming(frame_size,'periodic');%16kHz,0.02s

% noise n, speech signals with noise x

for M=1:4
    noisy_1(M,:,:)=stft(noisy_arti_2(M,:),fs,'Window',win);
    noisy_2(M,:,:)=stft(noisy_babble_2(M,:),fs,'Window',win);
    noisy_3(M,:,:)=stft(noisy_spee_2(M,:),fs,'Window',win);
    x_1(M,:,:)=stft(x_arti_2(M,:),fs,'Window',win);
    x_2(M,:,:)=stft(x_babble_2(M,:),fs,'Window',win);
    x_3(M,:,:)=stft(x_spee_2(M,:),fs,'Window',win);
end

%% s estimation
[s_arti_wie,s_arti_mvdr]=beamformer(x_1,noisy_1,frame_num,frame_size);
[s_babble_wie,s_babble_mvdr]=beamformer(x_2,noisy_2,frame_num,frame_size);
[s_spee_wie,s_spee_mvdr]=beamformer(x_3,noisy_3,frame_num,frame_size);

%% ISTFT

esti_arti_1=istft(s_arti_wie,fs,'Window',win);
esti_arti_2=istft(s_arti_mvdr,fs,'Window',win);
esti_babble_1=istft(s_babble_wie,fs,'Window',win);
esti_babble_2=istft(s_babble_mvdr,fs,'Window',win);
esti_spee_1=istft(s_spee_wie,fs,'Window',win);
esti_spee_2=istft(s_spee_mvdr,fs,'Window',win);

save('output.mat', 'esti_arti_1', 'esti_arti_2',...
    'esti_babble_1', 'esti_babble_2','esti_spee_1', 'esti_spee_2')

%% beamformer func
function [s_wie,s_mvdr]=beamformer(x,n,frame_num,frame_size)
for k=1:frame_num
    for l=1:frame_size
% Calculate Rn,Rx
        rx_1=xcorr(x(:,l,k));
        rx_1=rx_1(4:7);
        Rx_1=toeplitz(rx_1);
        clear rx_1

        rn_1=xcorr(n(:,l,k));
        rn_1=rn_1(4:7);
        Rn_1=toeplitz(rn_1);
        clear rn_1

% GEVD Rs
    % A=Rx_1; B=Rn_1;
        [U,Diag,Q]=eig(Rx_1,Rn_1);
        Diag=Diag-eye(size(Diag,1));
        Rs_1=Rn_1*U*Diag/U;

% Calculate Wiener
        e1=zeros(size(Rs_1,2),1);
        e1(1)=1;
        w1_wie=Rx_1\Rs_1*e1;
% Calculate MVDR
        [~,index_row]=max(abs(diag(Diag)));
        a=Q(:,index_row(1));
        w1_mvdr=Rn_1\a/(a'/Rn_1*a);

% solve s
        s_1_wie=w1_wie'*x(:,l,k);
        s_1_mvdr=w1_mvdr'*x(:,l,k);
        s_wie(l,k)=s_1_wie;
        s_mvdr(l,k)=s_1_mvdr;
    end
end
end