%Attemp to utilize twin-t-notch filter for implementation

%Define the varriables
syms R1 R2 R3;
syms C1 C2 C3;

%Define the desired transfer function coeficients
a = [210 2.59e+04 5.98e+04];
b = [19.9 1.18e+05 1.53e+03];

%Define the calculated transfer function coeficients
G= 1.09;
a_c = G*[(1/C1)*(1/R1+1/R2) 1/(C1*R1*R2)*(1/C3+1/C2) 1/(C1*C2*C3*R1*R2*R3)];
b_c = [(1/(C1*R1)+1/(C1*R2)+1/(C2*R2)+1/(C2*R3)+1/(C3*R2)) (1/(C2*R3*C1*R1)+1/(C2*R3*C1*R2)+1/(C3*C1*R1*R2)+1/(C2*C1*R1*R2)+1/(C2*C3*R3*R2)) 1/(C1*C2*C3*R1*R2*R3)];

%Construct the constrain equations
constraints = [a_c==a b_c==b];
%Quick Solve? ... no not that easy
% vpasolve(constraints)


%Manual Calculations
R1 = 100;
R2 = 100;
R3 = 1000;
C1 = 1e-2;
C2 = 1e-5;
C3 = 1e-5;
a_c = G*[(1/C1)*(1/R1+1/R2) 1/(C1*R1*R2)*(1/C3+1/C2) 1/(C1*C2*C3*R1*R2*R3)];
b_c = [(1/(C1*R1)+1/(C1*R2)+1/(C2*R2)+1/(C2*R3)+1/(C3*R2)) (1/(C2*R3*C1*R1)+1/(C2*R3*C1*R2)+1/(C3*C1*R1*R2)+1/(C2*C1*R1*R2)+1/(C2*C3*R3*R2)) 1/(C1*C2*C3*R1*R2*R3)];
plot([a_c-a b_c-b]);

