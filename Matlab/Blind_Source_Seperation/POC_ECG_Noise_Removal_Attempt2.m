%Attempts at Removing Floating GND Noise
clear;clc;
%Load the output waveform
load('POC_1Vpp_FG_Noise.mat');

%Perform Resampling Procedure (correct orcad)
fs = 1000;
[S_ECG,T] = resample(S_ECG,Time,fs);
[CCE1_Out,T] = resample(CCE1_Out,Time,fs);
[CCE2_Out,T] = resample(CCE2_Out,Time,fs);

%Plot the starting Sensor Data
figure(1);
subplot(3,1,1);plot(T,CCE1_Out);title('CCE1');
subplot(3,1,2);plot(T,CCE2_Out);title('CCE2');
subplot(3,1,3);plot(T,CCE2_Out-CCE1_Out);title('CCE2-CCE1');

%Attempt Kalman Filtering
%--------------------------------

%Load the Input Signal
Input = CCE2_Out-CCE1_Out;

%Remove the Inital Filter Setup Time (it gets neglected in long run)
Input = Input(fs*1.5:end);
T = T(fs*1.5:end);

%Establish the ECG Period through auto corelation (to many calculations)
[autocor,lags] = xcorr(Input);
[peakVals,peakLocs]=findpeaks(autocor,'sortstr','descend');
figure(2);
subplot(2,1,1);
plot(T,Input);title('Input Signal');
subplot(2,1,2);
plot(lags,autocor);hold on;
plot(lags(peakLocs),peakVals,'or');
title('Autocorrelation Results');
Period = T(peakLocs(2));

%Establish the ECG Period through R peaks
[peakVals,peakLocs]=findpeaks(Input,'MinPeakDistance',0.5/fs,'MinPeakHeight',0.2);
Period = mean(T(peakLocs(2:end))-T(peakLocs(1:end-1))); %[s]
Inital_Peak_Location = T(peakLocs(1));

%Divide Signal into ECG Period Sections
prev = peakLocs(1);
for i=1:length(peakLocs)-1
    Y(i,:) = Input(prev:prev+floor(Period*fs));
    prev = prev+floor(Period*fs);
end
##
##%Kalman Filter
##for k=1:1
##    W = Y(k
##
##
##end

