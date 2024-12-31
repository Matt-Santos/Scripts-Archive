%Estimate Transfer Function
opt = tfestOptions('EnforceStability',true);
response = Gain.*exp(1i*(Phase)*pi/180);
info = idfrd(response,2*pi*Frequencies,0);
old = tfest(info,4);
new = tfest(info,3,4,opt);
%Visually check TF estimate accuracy
[M,P,~,M_sd,P_sd]=bode(new,2*pi*Frequencies);
M = squeeze(M);
M_sd = squeeze(M_sd);
P = wrapTo360(squeeze(P));
P_sd = squeeze(P_sd);
figure(2);
subplot(2,1,1);hold off;
semilogx(Frequencies,20*log10(Gain),'r');hold on;
semilogx(Frequencies,20*log10(M),'b',Frequencies,20*log10(M+3*M_sd),'k:',Frequencies,20*log10(M-3*M_sd),'k:');
legend('Measured','Estimated','99% Confidence');
xlabel('Frequency [Hz]');ylabel('Gain [dB]');
subplot(2,1,2);hold off;
semilogx(Frequencies,wrapTo360(Phase),'r');hold on;
semilogx(Frequencies,wrapTo360(P),'b',Frequencies,wrapTo360(P+3*P_sd),'k:',Frequencies,wrapTo360(P-3*P_sd),'k:');
legend('Measured','Estimated','99% Confidence');
xlabel('Frequency [Hz]');ylabel('Phase [deg]');
figure(1);
bode(new,old);