%Noise Analysis Test

%Global Varriables
BPM = 60;       %HeartRate
Amp = 1E-3;     %Volts
L = 1000;  %Number of points
time = 180/BPM;  %seconds

%Equipment Setttings
waveGenIP = '169.254.5.21';
scopeIP = 'USB0::0x0957::0x179A::MY58102398::0::INSTR';

%Generate the ECG Waveform
ECG = ECGwaveGen(BPM,time,L,Amp*1E6);
NoisyECG = 0.5.*ECG+(max(ECG)-min(ECG)).*rand(1,length(ECG));
SampleRate = 2*L/time;
%Send the waveform to the function Generator
arbTo33500(ECG,waveGenIP,Amp*100,SampleRate,'ECG');
%Examine the recovered signal

%Test if recovered correctly
    %Correlation analysis
   
%Send Real ECG to Function Generator
load RealECG.mat;
val = (val/1000)*0.02;
Amp = 2e-3;
SampleRate = 1000;
arbTo33500(val,waveGenIP,Amp,SampleRate,'Real_ECG');


