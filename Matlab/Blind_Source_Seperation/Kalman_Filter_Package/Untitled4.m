%Basic Kalman Filter Implementation
clear;clc;


%Define Perfect Signal
fs = 100;
t = 1:1/fs:10;
x = sin(30*t);

%Define Noisy Signal
y = x + 0.5*randn(1,length(x));

NoisySen = y;
length = length(NoisySen);
Q = 1;
R = 100; %Adjust R for Degree of Damping

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

figure(2);clf;
plot(index,z,'g-',index,z,'gx',index,X_hat,'b--',index,X_hat,'b*')
legend('Z','Z','X^','X^')
title(['1st Order Kalman Filter Results; R = ',num2str(R)])