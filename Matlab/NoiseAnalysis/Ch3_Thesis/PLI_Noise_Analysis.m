%Measure 60Hz Frequency and Amplitude Varrience
%Writen by Matthew Santos
clear;clc;%close all;

%Global Settings
DUT = '60Hz_Noise';  %Filename
time = 120; %s

%Equipment Setttings
scopeIP = 'USB0::0x0957::0x179A::MY58102398::0::INSTR';
xscale = 100e-3; %s
%Setup for testing
mkdir(['Data/',DUT]);
data=[];
%Perform Testing
for x=1:ceil(time/xscale)
    %Take the Measurements
    results = ScopeRead(scopeIP,xscale,2.5,1,1,2);
    data = [data results.A];
    fprintf('Progress = %f Percent', x/length(ceil(time/xscale)))
end

%save(['Data/',DUT,'/',num2str(x),'.mat'],'data');
load(['Data/',DUT,'/1022.mat']);

%Measure Amplitude Varrience
amp = peak2peak(data)/2;
histogram(amp,22, 'Normalization','probability');
mamp=mean(amp);
samp=std(amp);
xlabel('Peak Amplitude [V]');
ylabel('Relative Probability [%]');
axis([0 10 0 0.2]);
grid on;

%Measure Frequency Varrience
freq = meanfreq(data,250,[10 90]/250)*250;
histogram(freq,300, 'Normalization','probability');
set(gca, 'YScale', 'log')
axis([59.89 60.05 0.001 1]);
grid on;
ytickformat('%2.4f');
mfreq=mean(freq);
sfreq=std(freq);
xlabel('Frequency [Hz]');
ylabel('Relative Probability [%]');
