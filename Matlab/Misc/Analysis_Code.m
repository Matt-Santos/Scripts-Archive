%Electronics II Experiment #0 Analysis with Matlab
%By Matthew Santos
clear all;

%-----------------------------------------
% Derivation of Non-Ideal Model with a Load
%-----------------------------------------
syms R_s R_1 R_2 R_i C R_o R_L A w real;
syms V_i V_o V_m complex;
%Node equations
eqn1 = V_m/R_i == (V_o-V_m)/(R_2/(1+1i*R_2*C*w))+(V_i-V_m)/(R_s+R_1);
eqn2 = (A*V_m-V_o)/R_o == V_o/R_L +(V_o-V_m)/(R_2/(1+1i*R_2*C*w));
%Combine and Simplify
Vm = solve(eqn2,V_m);
eqn1 = subs(eqn1,V_m,Vm);
Vo = solve(eqn1,V_o);
G = Vo/V_i;
G = simplify(G,'Steps', 100)
%G = latex(G); %Complex Output
%Determine Magnitude
G_mag = abs(G);
G_mag = rewrite(G_mag,'sqrt');
G_mag = simplify(G_mag,'Steps', 100)
%G_mag = latex(G_mag); %Magnitude Output
%Determine Phase
phase = atan(imag(G)/real(G));
phase = simplify(phase,'Criterion','preferReal', 'Steps', 100)
%phase = latex(phase) %Phase Relationship
%Check for Consistancy
G_check = limit(G,A,Inf);
G_check = limit(G_check,R_i,0);
G_check = limit(G_check,R_o,Inf);
G_check = limit(G_check,R_s,0)
%G_check = latex(G_check);

%-----------------------------------------
% Ideal Theory World Expectations
%-----------------------------------------

R_1 = 1000; %Ohms
R_2 = 1000; %Ohms
C = 1000E-9; %Farads
R_L = 100; %Ohms

magIdeal = zeros(2000,1);
phseIdeal = zeros(2000,1);
d = 0.0;
for t = 1:200
    d = t*10*2*pi;
    magIdeal(t) = eval(abs(subs(G_check,w,d)));
    phseIdeal(t) = eval(angle(subs(G_check,w,d)));
end


%-----------------------------------------
% Theory World Expectations
%-----------------------------------------

%Theory Values
R_s = 50; %Ohms
R_1 = 1000; %Ohms
R_2 = 1000; %Ohms
C = 1000E-9; %Farads
R_L = 1E10; %Ohms
%Op-amp Realistic Values from Datasheet
R_o = 70; %Ohms (accurate for w<10kHz)
R_i = 8000000; %Ohms (accurate for w<10kHz)
A_o = 200000;
Aw_o = 20*pi;
%A = abs(A_o/(1+1i*w/Aw_o)); %Gain

%Create output arrays
magTheory = zeros(2000,1);
phseTheory = zeros(2000,1);
G_mag = subs(G_mag,A,abs(A_o/(1+1i*w/Aw_o)));
phase = subs(phase,A,abs(A_o/(1+1i*w/Aw_o)));
magTheory_ = eval(G_mag);
phseTheory_ = eval(phase);
for t = 1:200
    d = t*10*2*pi;
    magTheory(t) = eval(subs(magTheory_,w,d));
    phseTheory(t) = eval(subs(phseTheory_,w,d));
end

%-----------------------------------------
% Experiment Expectations
%-----------------------------------------

%Experimentally Recorded Values
R_s = 50; %Ohms
R_1 = 988; %Ohms
R_2 = 991; %Ohms
C = 983E-9; %Farads
R_L = 98.8; %Ohms

%Create output arrays
magReal = zeros(2000,1);
phseReal = zeros(2000,1);
magReal_ = eval(G_mag);
phseReal_ = eval(phase);
for t = 1:200
    d = t*10;
    magReal(t) = eval(subs(magReal_,w,d));
    phseReal(t) = eval(subs(phseReal_,w,d));
end
