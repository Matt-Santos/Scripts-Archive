% Traveling Wave Simulation & Figure Plot
clc;clear;
%Parameters
tx = 1000;
t0 = 0;
t1 = 250;
t2 = 500;
A = 1;
t_L = 2*pi;

t = linspace(0,t_L,tx);

Vx = [A*sin(t(1:tx/2)) zeros(1,tx/2)];
V1 = [zeros(1,t1) Vx(1:tx-t1)];
V2 = [zeros(1,t2) Vx(1:tx-t2)];

%Plot the Figure
figure(1);clf;hold on;
subplot(3,1,1);plot(t,Vx); %Waveform at t=0
subplot(3,1,2);plot(t,V1); %Waveform at t=t1
subplot(3,1,3);plot(t,V2); %Waveform at t=t2


