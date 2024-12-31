%Corrections have been completed and the fix applied to the Automatic
%Frequency script so this is no longer needed (left as backup/reminder)

%MATT DO NOT MESS WITH THIS ANYMORE
%THE RESULTS ARE CORRECT STOP DOUBTING YOURSELF

opt = tfestOptions('EnforceStability',true);
file ='S7_5V_GND';
load(['Data/' file '/Result.mat']);
Phase = Phase(1:240);
Frequencies = Frequencies(1:240);
Gain = Gain(1:240);
%semilogx(Frequencies(1:280),Phase);

Phase = -Phase;
response = Gain.*exp(1i*(Phase)*pi/180);
info = idfrd(response,2*pi*Frequencies,0);
DUT = tfest(info,5);
[M,P,~,M_sd,P_sd]=bode(DUT,2*pi*Frequencies);
M = squeeze(M);
M_sd = squeeze(M_sd);
P = wrapTo360(squeeze(P));
P_sd = squeeze(P_sd);
figure(2);
title(['Transfer Function Estimate for']);
subplot(2,1,1);hold off;
semilogx(Frequencies,20*log10(Gain),'r');hold on;
semilogx(Frequencies,20*log10(M),'b',Frequencies,20*log10(M+3*M_sd),'k:',Frequencies,20*log10(M-3*M_sd),'k:');
legend('Measured','Estimated','99% Confidence');
xlabel('Frequency [Hz]');ylabel('Gain [dB]');
subplot(2,1,2);hold off;
semilogx(Frequencies,Phase,'r');hold on;
semilogx(Frequencies,P,'b',Frequencies,P+3*P_sd,'k:',Frequencies,P-3*P_sd,'k:');
legend('Measured','Estimated','99% Confidence');
xlabel('Frequency [Hz]');ylabel('Phase [deg]');
figure(3);
pzplot(DUT);
isstable(DUT)

eval([file '= DUT']);
eval(['save(''Data/OverallResults.mat'',''' file ''',''-append'')']);


