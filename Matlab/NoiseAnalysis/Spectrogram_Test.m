%Global Varriables
BPM = 60;       %HeartRate
Amp = 1E-3;     %Volts
L = 1000;  %Number of points
time = 180/BPM;  %seconds

ECG = ECGwaveGen(BPM,time,L,Amp*1E6);

