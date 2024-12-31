% myDAQ Post Processing Script
clc;
%Note the Input file must first be translated into csv format
pkg load io;
pkg load signal;

filename = "Thesis_Prototype_Fixed_Feedback/LM358/data.csv";
%filename = "Thesis_Prototype_Fixed_Feedback/data.csv";

%Skip these if data already loaded
if ~exist("data")
  data = csv2cell(filename,",");
  amplitude = cell2mat(data(:,2));
  time = cell2mat(data(:,1));
  time_s = str2num(time(:,[1 2]))*3600+str2num(time(:,[4 5]))*60+str2num(time(:,[7 8 9 10 11 12 13 14 15]));
  time_s = time_s - time_s(1);
end

%Post Processing Filter
sampleFrequency = 1000; %[Hz]
[b,a] = butter (2, [1/sampleFrequency/2 100/sampleFrequency/2]); %Order, passband
filtered_signal = filter(b,a,amplitude);

%Frequency Analysis
fftSignal = fft(filtered_signal);
fftSignal = fftshift(fftSignal);
f = sampleFrequency/2*linspace(-1,1,length(amplitude));

%Eliminate strange High frequencies
target = 284; %[Hz]
width = 431; %[Hz]
[~,index_low] = min(abs(f-target+width/2));
[~,index_high] = min(abs(f-target-width/2));
value = zeros(index_high-index_low,1)*mean([abs(fftSignal(index_low)),abs(fftSignal(index_high))]);
correctedfftSignal = [fftSignal(1:end-index_high-1);value;fftSignal(end-index_low:index_low);value;fftSignal(index_high+1:end)];

%Trim the end
correctedfftSignal(end-700:end)=value(1);
correctedfftSignal(1:700)=value(1);

%Remove 60Hz
target = 60; %[Hz]
width = 5; %[Hz]
[~,index_low] = min(abs(f-target+width/2));
[~,index_high] = min(abs(f-target-width/2));
value = zeros(index_high-index_low,1)*mean([abs(correctedfftSignal(index_low)),abs(correctedfftSignal(index_high))]);
correctedfftSignal = [correctedfftSignal(1:end-index_high-1);value;correctedfftSignal(end-index_low:index_low);value;correctedfftSignal(index_high+1:end)];

%Inverse FFT
ifftSignal = ifftshift(correctedfftSignal);
ifftSignal = ifft(ifftSignal);

%Moving Average
len = 1000*0.05;
average_sig = movmean(ifftSignal,len);
for i=1:25
  average_sig = movmean(average_sig,len);
end

%Figure Ploting
figure(1);clf;
hold on;
plot(time_s,amplitude);
title("Raw Input Signal");
xlabel("Time [s]");
ylabel("Amplitude [V]");
axis([34.5 38 -inf inf]);

figure(2);clf;
hold on;
plot(time_s,filtered_signal);
title("Bandpass Filtered Input Signal");
xlabel("Time [s]");
ylabel("Amplitude [V]");
axis([34.5 38 -inf inf]);

figure(3);clf;
hold on;
plot(f,abs(correctedfftSignal));
title("Manipulated FFT Signal");
xlabel("Frequency [Hz]");
ylabel("Magnitude [dB]");
axis([0 inf 0 max(abs(fftSignal(length(f)*0.55:end)))]);
##
##figure(4);clf;
##hold on;
##plot(time_s,ifftSignal);
##title("Inverse FFT of Manipulated FFT Signal");
##xlabel("Time [s]");
##ylabel("Amplitude [V]");
##axis([107 112 -inf inf]);

figure(5);clf;
hold on;
plot(time_s,average_sig);
title("Moving Averaged Applied to Manipulated Inversed FFT");
xlabel("Time [s]");
ylabel("Amplitude [V]");
axis([34.5 38 -0.8 0.4]);

%Perform Heart Rate Assesment
[peak_Points,peak_loc] = findpeaks(average_sig,"DoubleSided","MinPeakDistance",0.1,"MinPeakHeight",0.5);
%plot(time_s(peak_loc),average_sig(peak_loc),'xm');
HeartRate = [];
for i=1:length(peak_loc)-1
  HeartRate(i) = 60/(time_s(peak_loc(i+1))-time_s(peak_loc(i))); %[bpm]
end

%Heart Rate Plot
figure(6);clf;
hold on;
plot(time_s(peak_loc(1:end-1)),HeartRate,'om');
title("Measured Heart Rate Over Time");
xlabel("Time [s]");
ylabel("Rate [bpm]");
axis([-inf inf 10 200]);

