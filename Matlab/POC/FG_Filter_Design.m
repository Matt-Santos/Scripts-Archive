%Matlab Code used to establish the proper 60Hz Elimination Filter 
%and gain insight to the required GND Elimination Post Filter
%--------------------------------------------------------------------------
clear;clc;

%Define Global Varriables
f = logspace(-2,3,5000); %frequency range of interest


%Design the Notch Filter
%--------------------------------------------------------------------------
%Notch Filter Consists of Multiple Feedback Lowpass Filter in cascade with
%a simple HPF, influence of GND noise injection carefully accounted for

%Overall Requirements
%   -Unity gain at 60Hz
%   -60dB gain at 30Hz
%   -60dB gain at 100Hz
%   -use a cascade MFLPF and HPF
%   -minimize GND effect in ECG band

%Define Target Parameters
f_notch= 60;
G_IA = 500;

%Define the intermediate Transfer Functions (hand calculated)
syms R1 C2 R3 R4 C5 C6 C7 R8 R9 s; %see Appendix A sheet for component definitions
T_N1I(s) = (-1/(R1*R3*C2*C5))/(s^2+s*(1/C2)*(1/R1+1/R3+1/R4)+1/(R3*R4*C2*C5));
T_N1G(s) = (1-R1*(1+s*R3*C2)/(R1+R3+s*R1*R3*C2))*((R4*s*C5*(s*R3*R1*C2+R3+R1))/((1+s*C5*R4)*(s*R3*R1*C2+R3+R1)+s*C5*R3*R1));
T_N2I(s) = -(R9/R8)*((1+s*R8*C6)/(1+s*R9*C7));
T_N2G(s) = 1 +(R9/R8)*((1+s*R8*C6)/(1+s*R9*C7));
%Define I->O Transfer Function
T_NI_(s)=T_N1I*T_N2I;
%Define G->O Transfer Function
T_NG_(s)=T_N2G+T_N1G*T_N2I;


%Design the Input Delay Filter
%--------------------------------------------------------------------------
%Delay Filter Consists of a simple first order all pass filter type II
%which is used to match the delay imposed by the above notch filter
%framework at 60Hz

%Overall Requirements
%   -Unity gain in pass band
%   -Unity gain at 60Hz
%   -constant phase in ECG band (or at least linear)
%   -minimize GND phase changes in ECG band

%Define the intermediate Transfer Functions (hand calculated)
syms RD CD s; %see Appendix A sheet for component definitions
%Define I->O Transfer Function
T_DI_(s)=(1-s*RD*CD)/(1+s*RD*CD);
%Define G->O Transfer Function
T_DG_(s)=(2*s*RD*CD)/(1+s*RD*CD);


%Establish Notch Filter Component values
%---------------------------------------
NFvalues = {70e3*(1-0.0544),150e-6,40.2e3,70e3*(0.0544),300e-12,100e-9,100e-12,560e3,2.52e3};

%Establish Delay Filter Component values
%---------------------------------------
DFvalues = {40.2e3,1e-9};

%Evaluate the Notch Filter
%---------------------------------------
T_NI(s) = subs(T_NI_(s),[R1,C2,R3,R4,C5,C6,C7,R8,R9],NFvalues);
T_NG(s) = subs(T_NG_(s),[R1,C2,R3,R4,C5,C6,C7,R8,R9],NFvalues);

%Evaluate the Delay Filter
%---------------------------------------
T_DI(s) = subs(T_DI_(s),[RD CD],DFvalues);
T_DG(s) = subs(T_DG_(s),[RD CD],DFvalues);

%Plot the frequency response of Notch and Delay Lines
f1=figure(1);clf
subplot(2,2,1);
semilogx(f,20*log10(abs(eval(T_NI(1i*2*pi*f)))),'r');hold on;
semilogx(f,20*log10(abs(eval(T_DI(1i*2*pi*f)))),'g');
legend({'Notch','Delay'});
title('Signal Gain Response');xlabel('[Hz]');ylabel('[dB]');
subplot(2,2,3);
semilogx(f,rad2deg(angle(eval(T_NI(1i*2*pi*f)))),'r');hold on;
semilogx(f,rad2deg(angle(eval(T_DI(1i*2*pi*f)))),'g');
title('Signal Phase Response');xlabel('[Hz]');ylabel('[deg]');
subplot(2,2,2);
semilogx(f,20*log10(abs(eval(T_NG(1i*2*pi*f)))),'r');hold on;
semilogx(f,20*log10(abs(eval(T_DG(1i*2*pi*f)))),'g');
title('Ground Gain Response');xlabel('[Hz]');ylabel('[dB]');
subplot(2,2,4);
semilogx(f,rad2deg(angle(eval(T_NG(1i*2*pi*f)))),'r');hold on;
semilogx(f,rad2deg(angle(eval(T_DG(1i*2*pi*f)))),'g');
title('Ground Phase Response');xlabel('[Hz]');ylabel('[deg]');

%Plot the overall system output response assuming realistic IA (GND effect)
f2=figure(2);clf
subplot(2,2,1);
semilogx(f,20*log10(abs(G_IA*(eval(T_DI(1i*2*pi*f))-eval(T_NI(1i*2*pi*f))))),'r');
title('Overall Signal Gain Response');xlabel('[Hz]');ylabel('[dB]');
subplot(2,2,3);
semilogx(f,rad2deg(angle(G_IA*(eval(T_DI(1i*2*pi*f))-eval(T_NI(1i*2*pi*f))))),'r');
title('Overall Signal Phase Response');xlabel('[Hz]');ylabel('[deg]');
subplot(2,2,2);
semilogx(f,20*log10(abs(1+G_IA*(eval(T_DG(1i*2*pi*f))-eval(T_NG(1i*2*pi*f))))),'r');
title('Overall Ground Gain Response');xlabel('[Hz]');ylabel('[dB]');
subplot(2,2,4);
semilogx(f,rad2deg(angle(1+G_IA*(eval(T_DG(1i*2*pi*f))-eval(T_NG(1i*2*pi*f))))),'r');
title('Overall Ground Phase Response');xlabel('[Hz]');ylabel('[deg]');

%Define ideal Tx Filter
T_XG(s) = T_NG(s)-T_DG(s)-1/G_IA; %Super ideal but hard to synthisize
%T_XG(s) = T_NG(s)-T_DG(s);        %Ignores the Instrumental Amplifier Effects
%T_XG(s) = 1-T_DG(s);              %Approximate Notch as a unity filter
%T_XG(s) = 1+0*s;                  %Approximate as a unity filter
T_XI(s) = 1+0*s; %Need unity gain signal response

%Plot the ideal Tx GND cancelation Filter responce
f3=figure(3);clf;
subplot(2,2,1);
semilogx(f,20*log10(abs(eval(T_XG(1i*2*pi*f)))),'r');
title('Tx Ground Gain Response');xlabel('[Hz]');ylabel('[dB]');
subplot(2,2,3);
semilogx(f,rad2deg(angle(eval(T_XG(1i*2*pi*f)))),'r');
title('Tx Ground Phase Response');xlabel('[Hz]');ylabel('[deg]');
subplot(2,2,2);
semilogx(f,20*log10(abs(1+G_IA*(eval(T_DG(1i*2*pi*f)).*eval(T_XI(1i*2*pi*f))+eval(T_XG(1i*2*pi*f))-eval(T_NG(1i*2*pi*f))))),'r');
title('Overall Ground Gain Response with Tx');xlabel('[Hz]');ylabel('[dB]');
subplot(2,2,4);
semilogx(f,rad2deg(angle(1+G_IA*(eval(T_DG(1i*2*pi*f)).*eval(T_XI(1i*2*pi*f))+eval(T_XG(1i*2*pi*f))-eval(T_NG(1i*2*pi*f))))),'r');
title('Overall Ground Phase Response with Tx');xlabel('[Hz]');ylabel('[deg]');

return;






%Part selection Area


%Solve for the Multiple Feedback Lowpass Filter Parts and Transfer Function
%Values are output in the following Order P = R1,C2,R3,R4,C5
%Input the desired notch Frequency

syms R1 C2 R3 R4 C5 s;
f= 60;
%Basic Component Assumptions
%assume(1<R1 & R1<10e6);assumeAlso(R1,'real');
%assume(1e-12<C2 & C2<470e-6);assumeAlso(C2,'real');
%assume(1<R3 & R3<10e6);assumeAlso(R3,'real');
%assume(1<R4 & R4<10e6);assumeAlso(R4,'real');
%assume(1e-12<C5 & C5<470e-6);assumeAlso(C5,'real');

%Define the Transfer Function
T(s) = (1/(R1*R3*C2*C5))/(s^2+s*(1/C2)*(1/R1+1/R3+1/R4)+1/(R3*R4*C2*C5));

%Define contraints
%Gain at 60Hz= 1, abs(T(2*1i*pi*f)) == 1;
%Gain at 30Hz <0.01

constraints = [abs(T(2*1i*pi*f)) == 1,...
               abs(T(2*1i*pi*30)) == 0.1];
           
A = solve(constraints,'ReturnConditions', true)




