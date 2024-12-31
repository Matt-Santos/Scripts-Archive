%Matlab code for establshing Perfect 60Hz Feedback Delay and Gain
%with tolerance analysis
clear;clc;

%Define the Differential Input Signal
ECG_Resolution = 10e-6; %[V] can push this to a maxiumum of 100e6
ECG_Peak_Amplitude = 3.5e-3; %[V] as low as 1.5mV
PLI_Peak_Amplitude = 1; %[V] this can varry drastically

%Define the Desired Output Conditions
ECG_Resolution = 10e-3; %[V]



%60Hz NotchPass = Multiple Feedback LP Filter + HP Filter
Gain_60 = 1;
Cutoff = ;
R1 =;
R3 =;
R4 =;
C2 =;
C5 = ;

T1 = tf([-1/(R1*R3*R4*C2*C5)],[1 1/C2*(1/R1+1/R3+1/R4) 1/(R3*R4*C2*C5)]);

T2 = tf();

Tnotch = T1*T2;

%Find the phase respose at 60Hz
[mag,phase] = bode(Tnotch,2*pi*60);
offset = 180-phase;

%Apply offset to allpass filter calculator to determine Rx

%AllPass Delay Filter
Delay = 90;   %Specify Allpass delay to add in degrees
Cx = 1e-6;
Rx = 2*pi*60/Cx*tan(-deg2rad(Delay)/2);
d=1/(Rx*Cx);
Tdelay = tf([1 -d],[1 d]);

%Calculate Overall Feedback Circuit
T = Tnotch*Tdelay;
bode(T);



return;

%Below is old method
%---------------------
%Define Delay Factor Range
delay = 100:900;

for i=1:length(delay)
%Define the Transfer Function
T1 = tf([2.353306E5],[1 0.5758 1.428E5],0);
T2 = tf([1 0 0],[1 606.06 91827],0);
T3 = tf([1 -delay(i)],[1 delay(i)],0);
Tt = T1*T2*T3;

%Find the gain and delay at 60Hz
[mag,phase] = bode(Tt,2*pi*60);
G(i) = mag;
Phase(i) = phase;
end

%Calculate Required Parameters
PhaseOffset = abs(Phase - 180);
[Phase,i] = min(PhaseOffset);

G = 1/G(delay(i));  %Feedback Final Gain
x = delay(i);       %Feedback Allpass Delay Factor




