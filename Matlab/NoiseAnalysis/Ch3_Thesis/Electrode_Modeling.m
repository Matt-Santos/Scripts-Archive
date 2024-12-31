clc;clear;clf

%Varriables
R1=100;
R2=10e3;
C1=20e-9;
Ve=30e-3; %Typical Measured Value
Cin=5e-12; %Value taken from Chapter 2 Table
Rin=10e9; %Value taken from Chapter 2 Table

%Define Transfer Function
s=tf('s');
Ze=R1+R2/(1+s*C1*R2);
ZL=Rin/(1+s*Cin*Rin);

E=ZL/(ZL+Ze)+Ve;
E_d=ZL/(ZL+2*Ze);
E_cm=ZL/(ZL+0.5*Ze)+Ve;

%Plot Transfer Function Frequency Response
bode(E,{1e-2,1e8});
grid;hold on;
bode(E_d,{1e-2,1e8});
bode(E_cm,{1e-2,1e8});