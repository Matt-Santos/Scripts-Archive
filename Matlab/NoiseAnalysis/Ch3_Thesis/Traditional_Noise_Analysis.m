%Traditional System Noise Analysis
%Written by Matthew Santos
clear;clc;
load("Vout"); %Average Output Signal
load("VECG"); %Average ECG Signal at Output

%Define Transfer Function Varriables
Ad=tf(1000);
Acm=tf(0.01);
F= tf(1); %System Dependant
%Electrode Model Varriables
R1=100;
R2=10e3;
C1=20e-9;
Ve=30e-3; %Typical Measured Value
Cin=5e-12; %Value taken from Chapter 2 Table
Rin=10e9; %Value taken from Chapter 2 Table
%Define Electrode Transfer Functions
s=tf('s');
Ze=R1+R2/(1+s*C1*R2);
ZL=Rin/(1+s*Cin*Rin);
E=ZL/(ZL+Ze)+Ve;
Ed=ZL/(ZL+2*Ze);
Ecm=ZL/(ZL+0.5*Ze)+Ve;

%Create Transfer Functions
T_O_ECG=Ad*F;%Ed*Ad*F;
T_O_CMN=Ecm*Acm*F;
T_O=[T_O_ECG;T_O_CMN];
T_ECG=[1/(F*Ad*Ed),-Acm*Ecm/(Ad*Ed)];%Inputs Vout,VCMN
T_CMN=[1/(F*Acm*Ecm),-Ad*Ed/(Acm*Ecm)];%Inputs Vout,VECG

%Determine Vecg at Input
Vecg = lsim(inv(T_O_ECG),VECG.Y,VECG.X);
%Determine Vcmn
Vcmn = lsim(T_CMN,[Vout.Y,Vecg],Vout.X);

%Calculate Spectrums
[Pcmn, F] = pspectrum(Vcmn,Vout.X,'FrequencyLimits',[0.001 1e3]);
[Pecg, F] = pspectrum(Vecg,Vout.X,'FrequencyLimits',[0.001 1e3]);

%Plot Frequency Results
figure(1);clf;
semilogx(F,mag2db(Pcmn),'black');hold on;
semilogx(F,mag2db(Pecg),'blue');
xlabel("Frequency [Hz]");
ylabel("Magnitude [dB]");
legend("Vcmn","Vecg");

%Plot Time Results
limits = [0 100 -inf inf];
figure(2);clf;
subplot(2,1,1);
plot(Vout.X,Vcmn);
title("Calculated Input Common Mode Noise");
xlabel("Time [s]");
ylabel("Amplitude [V]");
axis(limits);
subplot(2,1,2);
plot(Vout.X,Vecg);
title("Calculated Input ECG Signal");
xlabel("Time [s]");
ylabel("Amplitude [V]");
axis(limits);