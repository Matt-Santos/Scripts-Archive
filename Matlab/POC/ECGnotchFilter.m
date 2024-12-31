%Notch Filter Function
function [T,P]= ECGnotchFilter(f)
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
           
           
P = ones(1,5);



end