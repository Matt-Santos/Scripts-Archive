% ECG Noise Analysis Script
% Written by Matthew Santos
clear;clc;close all;

%Initalizations
SignalPFFT=[];
SignalFFT=[];
Time_Amp=[];
Time_Offset=[];
Time_Period=[];

%Configuration
timeLimits = [0.001 30]; % seconds
frequencyLimits = [0.1 1000]; % Hz

%Database Selection
%-----------------
%database="macecgdb";N_Records= 26; %Motion Artifact Database
database="edb";N_Records=89; %European Database
%database="ptbdb";N_Records=500; %Pure ECG Database
%database="nstdb";N_Records=14; %Ambulatory Noise Database
%database="mitdb";N_Records=47; %Arrhythmia Database

for RecordIndex =1:N_Records
    %Pull Sample from Database
    filename = FindECG(RecordIndex,database);
    filename = char(filename);
    filename = filename(1:end-4);
    [Signal, Fs, tm] = rdsamp(filename, 1);
    %Establish & Correct Time Values
    n = length(Signal);
    t=0:1/Fs:1/Fs*(n-1);
    timeValues = t(1:n-1);
    %Signal Preperation
    minIdx = timeValues >= timeLimits(1);
    maxIdx = timeValues <= timeLimits(2);
    timeValues = timeValues(minIdx&maxIdx);
    Signal_ROI = Signal(minIdx&maxIdx);
    %Frequency Analysis
    [PSignal_ROI, FSignal_ROI] = pspectrum(Signal_ROI,timeValues,'FrequencyLimits',frequencyLimits);
    SignalPFFT = [SignalPFFT,mag2db(PSignal_ROI)];
    %Time Analysis
    Time_Amp= [Time_Amp max(Signal)-min(Signal)];
    Time_Offset= [Time_Offset mean(Signal)];
    AC=xcorr(Signal,Signal);
    [~,locs]=findpeaks(AC,Fs,'MinPeakDistance',0.9);
    T = mean(diff(locs));
    if T<2
        Time_Period= [Time_Period T];
    end
end

%Perform Statistics
mSignalPFFT=mean(SignalPFFT');
sSignalPFFT=std(SignalPFFT');
mTime_Amp=mean(Time_Amp);
sTime_Amp=std(Time_Amp);
mTime_Offset=mean(Time_Offset);
sTime_Offset=std(Time_Offset);
mTime_Period=mean(Time_Period');
sTime_Period=std(Time_Period');
pband = bandpower(mSignalPFFT,FSignal_ROI,[0.1 100],'psd');
PowerRatio = 100*(pband/bandpower(mSignalPFFT,FSignal_ROI,'psd'));

%Plot Figures
figure(1);clf;
plot(t,Signal);title("Sample ECG Signal");
axis([0 5 -inf inf]);
xlabel("Time [s]");
ylabel("Amplitude [mV]");

figure(2);clf;
yu = mSignalPFFT+sSignalPFFT;
yl = mSignalPFFT-sSignalPFFT;
semilogx(FSignal_ROI,mSignalPFFT,'black');
hold on;grid on;
fill([FSignal_ROI' fliplr(FSignal_ROI')], [yu fliplr(yl)], 'cyan', 'linestyle', 'none');
semilogx(FSignal_ROI,mSignalPFFT,'black');
xlabel("Frequency [Hz]");
ylabel("Magnitude [dB]");
legend("Mean","Stdev");

figure(3);clf;
hold on;
fill([FSignal_ROI' fliplr(FSignal_ROI')], [yu fliplr(yl)], 'cyan', 'linestyle', 'none');
plot(FSignal_ROI,mSignalPFFT);title("Signal FFT");
grid on;
xlabel("Frequency [Hz]");
ylabel("Magnitude [dB]");