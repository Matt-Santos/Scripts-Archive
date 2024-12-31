%Basic Kalman Filter Implementation
clear;clc;

%Load the output waveform
load('POC_1Vpp_FG_Noise.mat');

%Perform Resampling Procedure (correct orcad)
[S_ECG,T] = resample(S_ECG,Time,100);
[CCE1_Out,T] = resample(CCE1_Out,Time,100);
[CCE2_Out,T] = resample(CCE2_Out,Time,100);

%Specify Sensors for Blind Source Seperation
A = CCE1_Out;
B = CCE2_Out;
C = CCE2_Out-CCE1_Out;

NoisySen = C(150:end);
length = length(NoisySen);
Q = 1;
R = 2; %Adjust R for Degree of Damping

for n = 1: 1: length;

   z(n) = NoisySen(n);

end;

length
Q
R

for n = 1: 1: length;

   index(n) = n;

end;

Pmin1 = 0;

Pmin1


K = Pmin1/(Pmin1+R)

X_hat(1) = NoisySen(1) + K*(z(1) - NoisySen(1))
	
P = (1-K)*Pmin1

Pmin = P + Q

X_hat_min(1) = X_hat(1)


for n = 2: 1: length;

   K = Pmin/(Pmin+R);

   X_hat(n) = X_hat_min(n-1) + K*(z(n) - X_hat_min(n-1));
	
   P = (1-K)*Pmin;

   Pmin = P + Q;

   X_hat_min(n) = X_hat(n);

end;

figure(1);clf;
subplot(3,1,1);
plot(S_ECG(150:end));title('True');
subplot(3,1,2);
plot(C(150:end));title('Input');
subplot(3,1,3);
plot(X_hat);title('Output');
return;
plot(index,z,'g-',index,z,'gx',index,X_hat,'b--',index,X_hat,'b*')
legend('Z','Z','X^','X^')
title(['1st Order Kalman Filter Results; R = ',num2str(R)])