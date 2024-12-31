
load("Signal.mat");
load("Pure.mat");
%Pure = Perfect ECG
%Signal = Differential ECG Measurement

% Parameters
fs=1000;
n = length(Signal);
t=0:1/fs:1/fs*(n-1);
timeLimits = [0.001 60]; % seconds
frequencyLimits = [0 100]; % Hz
timeValues = t(1:n-1);

%Signal Setup
Signal_ROI = Signal(:);
minIdx = timeValues >= timeLimits(1);
maxIdx = timeValues <= timeLimits(2);
timeValues = timeValues(minIdx&maxIdx);
Signal_ROI = Signal(minIdx&maxIdx);
Pure_ROI = Pure(minIdx&maxIdx);

%Spectrum Analysis
[PSignal_ROI, FSignal_ROI] = pspectrum(Signal_ROI,timeValues,'FrequencyLimits',frequencyLimits);
[PPure_ROI, FPure_ROI] = pspectrum(Pure_ROI,timeValues,'FrequencyLimits',frequencyLimits);
PureFFT = mag2db(PPure_ROI);
NoiseFFT = mag2db(PSignal_ROI)-mag2db(PPure_ROI)-120.5;
OutputFFT = mag2db(PSignal_ROI);
InputFFT = NoiseFFT*1000+PureFFT/100;

%Ploting Figures
figure(1);
subplot(2,1,1);
plot(t,Signal);
axis([0 5 -inf inf]);
subplot(2,1,2);
plot(t,Pure);
axis([0 5 -inf inf]);
xlabel("Time [s]");
ylabel("Amplitude [mV]");
figure(2);clf;
hold on;grid on;
plot(FPure_ROI,OutputFFT);
plot(FPure_ROI,PureFFT);
figure(3);clf;
hold on;grid on;
plot(FPure_ROI,NoiseFFT+60);
plot(FPure_ROI,PureFFT-40);
plot(FPure_ROI,NoiseFFT+60+PureFFT-40);
legend("Measurement","ECG","Noise","Input");
xlabel("Frequency [Hz]");
ylabel("Magnitude [dB]");

%freqz