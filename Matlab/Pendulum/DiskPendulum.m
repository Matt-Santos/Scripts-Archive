% Octave Code to Simulate Inverted Pendulum
% Control Systems I 
% Written by Matthew Santos

pkg load control
pkg load symbolic
pkg load signal
clear all;close all;
graphics_toolkit('gnuplot')

% System Constants
k_sys = 0.00338; %[Nm/count]
k_encoder1 = 2546; %[counts/radian]
k_encoder4 = 2608; %[counts/radian]

% Given System Transfer Equations
%T_1_Inverted = tf([112.25,0,-3589.57],[1,1.1242,-47.586,-35.948,0]); %Theta1/T1
%T_2_Inverted = tf([-91.47,0],[1,1.1242,-47.586,-35.948]); %Theta2/T1
T_1_NonInverted = tf([112.25,0,3589.57],[1,1.1242,47.586,35.948,0]); %Theta1/T1
T_2_NonInverted = tf([91.47,0],[1,1.1242,47.586,35.948]); %Theta2/T1

% Combine System Gains with Transfer Functions to create Plants
%Plant1_I = series(k_sys*k_encoder1,T_1_Inverted);
%Plant2_I = series(k_sys*k_encoder4,T_2_Inverted);
%Plant_I = [Plant1_I;Plant2_I];
%Plant_I.InputName = 'X_I(s)';
%Plant_I.OutputName = {'Theta1_I(s)','Theta2_I(s)'};

Plant1_N = series(k_sys*k_encoder1,T_1_NonInverted);
Plant2_N = series(k_sys*k_encoder4,T_2_NonInverted);
Plant_N = [Plant1_N;Plant2_N];
Plant_N.InputName = 'X_N(s)';
Plant_N.OutputName = {'Theta1_N(s)','Theta2_N(s)'};

% Non Inverted Controller Designing
%----------------------------------------------------

% Examine the Step Response over 30s
StepRange = 0:0.01:30;
i=1;
%for n=0:.1:0.3
  %for m =1:1:1
    for o=0:0.1:0.1
    % NonInverting PID Controller Design
    Kp_N = o;
    Ki_N = 0.005;
    Kd_N = 0.1;
    PID_N = pid(Kp_N,Ki_N,Kd_N);
    PID_N.InputName = 'E_N(s)';
    PID_N.OutputName = 'X_N(s)';
    % Connect the NonInverting System
    PID_Plant_N = series(PID_N,Plant_N);
    SumBlock_N = sumblk('E_N(s) = R(s) - Theta1_N(s) - Theta2_N(s)');
    N_System = tf(connect(PID_Plant_N,SumBlock_N,'R(s)',{'Theta1_N(s)';'Theta2_N(s)'}));
    % Examine Step Response of the NonInverting System
    [yn,tn(i,:)]= step(N_System,StepRange);
    yn1(i,:)=yn(:,1);
    yn2(i,:)=yn(:,2);
    K(i,:)=o*ones(length(yn),1);
    % Calculate Performance Criteria
 %   ISE1(i) = trapz((1-yn(:,1)).^2,tn);
 %   ISE2(i) = trapz((yn(:,2)).^2,tn);
 %   IAE1(i) = trapz(abs(1-yn(:,1)),tn);
 %   IAE2(i) = trapz(abs(yn(:,2)),tn);
    % Save Controller Settings 
 %   Param(i,:) = [Kp_N,Kd_N,Ki_N];
    i=i+1;
end
%end
%end
figure
title('Theta1 Non-Inverting')
surf(tn',K',yn1')
xlabel('Time')
ylabel('Gain')
zlabel('Response')
print('SR_Sweep_Theta1_N_feedback',"-dpng","-r300");
figure
title('Theta2 Non-Inverting')
surf(tn',K',yn2')
xlabel('Time')
ylabel('Gain')
zlabel('Response')
print('SR_Sweep_Theta2_N_feedback',"-dpng","-r300");






%{
% Start of Inverting Controller Design
%-----------------------------------------

% Inverting Dual PID Controller Design
Kp_I1 = 0.01;
Ki_I1 = 0;
Kd_I1 = 0;

Kp_I2 = -0.3;
Ki_I2 = -0.1;
Kd_I2 = -0.05;

PID_I1 = pid(Kp_I1,Ki_I1,Kd_I1);
PID_I1.InputName = 'E_I1(s)';
PID_I1.OutputName = 'X_I1(s)';
PID_I2 = pid(Kp_I2,Ki_I2,Kd_I2);
PID_I2.InputName = 'E_I2(s)';
PID_I2.OutputName = 'X_I2(s)';
% Connect the Inverting System
SumBlock_I1 = sumblk('E_I1(s) = R(s) - Theta1_I(s)');
SumBlock_I2 = sumblk('E_I2(s) = - Theta2_I(s)');
SumBlock_IPID = sumblk('X_I(s) = X_I1(s) + X_I2(s)');
I_System = tf(connect(PID_I1,PID_I2,SumBlock_I1,SumBlock_I2,SumBlock_IPID,Plant_I,'R(s)',{'Theta1_I(s)';'Theta2_I(s)'}))
step(I_System)
%}


