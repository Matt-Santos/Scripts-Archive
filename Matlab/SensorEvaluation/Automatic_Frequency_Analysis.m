%Automatic Frequency Analysis Script
%Utilizes Keysight Scope and Function Generator
clear;clc;%close all;

%Global Settings
DUT = 'S3_4V';  %Filename
F_min = 0.1;    %Hz
F_max = 2e5;    %Hz
ppd = 10;       %Points per Decade
Vpp = 0.5;      %Output Amplitude [V]
waveform = sin(linspace(0,2*pi,500)); %The test waveform
%Equipment Setttings
waveGenIP = '169.254.5.21';
scopeIP = 'USB0::0x0957::0x179A::MY58102398::0::INSTR';
%Setup for testing
mkdir(['Data/',DUT]);
figure(1);
Frequencies = logspace(log10(F_min),log10(F_max),ppd*(log10(F_max)-log10(F_min)));
Xscale = 2./(10*Frequencies);
SampleRate = Frequencies*500;
Gain=zeros(1,length(Frequencies));
GainVar=zeros(1,length(Frequencies));
Phase=zeros(1,length(Frequencies));
%Perform Testing
for x=1:length(Frequencies)
    %Output the waveform
    arbTo33500(waveform,waveGenIP,Vpp,SampleRate(x),'waveform');
    %Take the Measurements
    data = ScopeRead(scopeIP,Xscale(x),0.07,0.7,1,2);
    %Save the Measurements
    save(['Data/',DUT,'/',num2str(x),'.mat'],'data');
    %estimate the gain and phase
    [Gain(x),GainVar(x),Phase(x)] = GPAnalysis(data.A,data.B,Frequencies(x),data.Time);
    %save gain, phase and test info
    save(['Data/',DUT,'/Result.mat'],'Gain','GainVar','Phase','Frequencies','Xscale','F_min','F_max','ppd','Vpp');
    %Realtime Diagnosing Plot
    subplot(2,1,1);
    title(['Last Measurement ' num2str(Frequencies(x)) 'Hz']);
    plot(data.Time,data.A,data.Time,data.B);legend('Input','Output');
    xlabel('Time [s]');ylabel('Amplitude [V]');
    subplot(2,1,2);yyaxis left;xlabel('Frequency [Hz]');
    semilogx(Frequencies,20*log10(Gain));ylabel('Gain [dB]');
    yyaxis right;
    semilogx(Frequencies,Phase);ylabel('Phase [deg]');
end

%Estimate Transfer Function
response = Gain.*exp(1i*-Phase*pi/180);
info = idfrd(response,2*pi*Frequencies,0);
eval([DUT '= tfest(info,5)']);
%Save the Result in Overall File
save('Data/OverallResults.mat',DUT,'-append');
%Visually check TF estimate accuracy
eval(['[M,P,~,M_sd,P_sd]=bode(' DUT ',2*pi*Frequencies);']);
M = squeeze(M);
M_sd = squeeze(M_sd);
P = wrapTo360(-squeeze(P));
P_sd = squeeze(-P_sd);
figure(2);
title(['Transfer Function Estimate for ' DUT]);
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

Data = load('gong');
sound(Data.y, Data.Fs);