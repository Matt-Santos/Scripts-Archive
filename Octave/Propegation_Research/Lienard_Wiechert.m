clear;clc;clf;
pkg load symbolic

c = 3E8;  %Speed of Light [m/s]
q = 1E-6; %Charge of Charged Particle [C]
e0= 8.854E-12; %Permitivity of Free Space]

syms x y t;

%Spacial Domain is the 2D XY Plane
vx = 1500; vy= 0;
%v = [vx;vy]; %Speed of Charged Particle [m/s]
%r = [x;y];

%Lienard-Wiechert Potential for Point Charge
%V(x,y,t) = q*c/(4*pi*e0)*((dot(r,v)-c^2*t)^2-(c^2-v^2)*(c^2*t^2-r^2))^(-1/2);
V(x,y,t) = q*c/(4*pi*e0)*((x*vx+y*vy-c^2*t)^2-(c^2-vx^2-vy^2)*(c^2*t^2-x^2-y^2))^(-1/2);

%Compute 2D Contour Map
##xi = -10:1:10;
##yi = xi;
##ti = 0:0.0001:1;
##[xx,yy] = meshgrid(xi,yi);
##ii=1;
##for i=ti;
##  tn = i*ones(length(xi));
##  figure(ii);
##  contourf(xx,yy,real(double(V(xx,yy,tn))));
##  pause;
##  ii = ii+1;
##end

%Compute Key Potentials
%----------------------
deltaBody = 0.5;  %[m]
deltaElectrode = 0.05; %[m]
A = -0.5*deltaBody-deltaElectrode;
B = -0.5*deltaBody;
C = 0.5*deltaBody;
D = 0.5*deltaBody+deltaElectrode;

ti = 0:1E-6:0.3E-3;

psiA = real(double(V(A,0.01,ti)));
psiB = real(double(V(B,0.01,ti)));
psiC = real(double(V(C,0.01,ti)));
psiD = real(double(V(D,0.01,ti)));

figure(1);clf;
hold on;
plot(ti,psiA,"color","red");  %A
plot(ti,psiB,"color","blue"); %B
plot(ti,psiC,"color","green"); %C
plot(ti,psiD,"color","black"); %D
legend("A","B","C","D");
title("Electrodynamic Scaler Potential of Lienard Wiechert Particle");
xlabel("Time [s]");
ylabel("Potential [tbd]");

figure(2);clf;
hold on;
plot(ti,psiB-psiA,"color","red");  %VBA
plot(ti,psiC-psiD,"color","blue"); %VCD
plot(ti,psiB-psiC,"color","green"); %VBC
plot(ti,psiA-psiD,"color","black"); %VAD
legend("Vab","Vcd","Vbc","Vad");
title("Potential Difference of Lienard Wiechert Particle");
xlabel("Time [s]");
ylabel("Voltage [V]");

figure(3);clf;
plot(ti,psiC-psiD);
hold on;
plot(ti,psiC-psiB);
legend("Vcd","Vcb");
title("Comparision of Differential Signal to Single Ended Signal");

figure(4);clf;
hold on;
delta = 50;
Xn = psiC-psiB; %True Differential
Yn = (psiC-psiD)-(psiB-psiA); %Measured Single  Differential Signal

%Forward Filter
%signal_filtered = Xn - [zeros(1,delta) Xn(1:end-delta)];
a = 1;b = [1 zeros(1,49) -1];
signal_filtered = filter (b, a, Xn);

%Reverse Filter
signal_reversed = filter(a,b,Yn);

plot(ti,Xn,"color","black"); %True Differential Signal
plot(ti,Yn,"color","blue"); %Inferred Differential Signal
plot(ti,signal_filtered,"color","red"); %Compensated Signal
plot(ti,signal_reversed,"color","green"); %Filtered Single -> Differential
title("Comparision of Single Ended Differential vs True Differential Signal");
legend("True Differential (X[n])","Inferred Differential (y[n])","Reverse Filtered","Forward Filtered");


