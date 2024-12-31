clc;clear;

%Obtain ECG Sample Data
[sig, Fs, tm] = rdsamp('edb/e0103', 1);

%Corrupt Signal with High and Low Frequency Noise
sig_HPN = sig+5*sin(2*pi*1/10*tm + 1.232)+3*sin(2*pi*1/4*tm + 5.32);
sig_LPN = sig+1*sin(2*pi*70*tm + 3.213)+2.5*sin(2*pi*80*tm + 3.213);

%Apply LPF and HPF to recover ECG Signal
sig_HPF = filter([10 1],[1],sig);
sig_LPF = filter([1],[10 1],sig);

%Plot both noisy and filtered Signals
set(0, 'DefaultAxesFontSize', 18)
figure(1);clf;
hold on;
subplot(2,1,1);grid on;
title("ECG Signal with High Frequency Noise");
plot(tm,sig_HPN);
xlabel("Time [s]","fontsize",18);
ylabel("Amplitude [mV]","fontsize",18);
axis([0 10 -inf inf]);
subplot(2,1,2);grid on;
title("Filtered ECG Signal");
plot(tm,sig);
xlabel("Time [s]","fontsize",18);
ylabel("Amplitude [mV]","fontsize",18);
axis([0 10 0 inf]);

figure(2);clf;
hold on;
subplot(2,1,1);grid on;
title("ECG Signal with Low Frequency Noise");
plot(tm,sig_LPN);
xlabel("Time [s]","fontsize",18);
ylabel("Amplitude [mV]","fontsize",18);
axis([0 8 -inf inf]);
subplot(2,1,2);
title("Filtered ECG Signal");
plot(tm,sig);grid on;
xlabel("Time [s]","fontsize",18);
ylabel("Amplitude [mV]","fontsize",18);
axis([0 8 0 inf]);
