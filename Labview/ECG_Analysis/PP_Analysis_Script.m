% myDAQ Post Processing Script
clc;clear;
%Note the Input file must first be translated into csv format
pkg load io;
pkg load signal;

filename = "Non_Inverting_AMP_G=2_RL=1M/data.csv";

%Skip these if data already loaded
data = csv2cell(filename,",");
amplitude = cell2mat(data(:,2));
time = cell2mat(data(:,1));
time_s = str2num(time(:,[1 2]))*3600+str2num(time(:,[4 5]))*60+str2num(time(:,[7 8 9 10 11 12 13 14 15]));
time_s = time_s - time_s(1);

%Post Processing Filter
sampleFrequency = 1000; %[Hz]
[b,a] = butter (2, [1/sampleFrequency/2 200/sampleFrequency/2]); %Order, passband
filtered_signal = filter(b,a,amplitude);

%Moving Average
average_sig = movmean(filtered_signal,1000*0.1);

%Figure Ploting
figure(1);clf;
hold on;
plot(time_s,amplitude);
title("Unfiltered Human Body Input Signal From Single Electrode");
xlabel("Time [s]");
ylabel("Amplitude [V]");
axis([50 53 -inf inf]);

figure(2);clf;
hold on;
plot(time_s,filtered_signal);
title("Filtered Human Body Input Signal From Single Electrode");
xlabel("Time [s]");
ylabel("Amplitude [V]");
axis([50 53 -0.2 0.2]);

figure(3);clf;
hold on;
plot(time_s,average_sig);
title("Extra Filtered Human Body Input Signal From Single Electrode");
xlabel("Time [s]");
ylabel("Amplitude [V]");
axis([50 53 -0.2 0.2]);
