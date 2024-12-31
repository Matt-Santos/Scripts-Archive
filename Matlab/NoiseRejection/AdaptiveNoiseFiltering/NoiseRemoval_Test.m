%Adaptive Filters Echo Cancellation Project
%Applications of DSP 06-88-590-08
%Written by Matthew Santos
%Modified by Matthew Santos for GRP

%Load ECG
load('ecg_data.mat');
S = highpass(S,1,500);
S = [S;S;S;S;S;S];
S = lowpass(S,30,500,'ImpulseResponse','iir','Steepness',0.95);

%Global Parameters
n = length(S);
N = 5;    %Number of iterations
u = 0.005;   %Convergence factor
NP = 0.05;    %Noise Power
SP = 1;   %Signal Power
L = 10;     %Adaptive Filter Length

%Preallocate the Error Storage
Error = zeros(N,n);
H_Data = zeros(n,L);
    
%Iterate through Instances
for i=1:N
%Define the Desired Response
DR = normalize(S,'range');
%Define the noise vector
noise = sqrt(NP)*(randn(n,1)-0.5);  %Normally distributed white noise
%Obtain the input signal
x = DR+noise;
%Initalize the Adaptive Filters
H     = zeros(L,1);
%Reset the Intermediate Storage Varriables
y     = zeros(n,1);
temp  = zeros(L,1);
%Peform the Analysis
for j=1:n
    temp(1) = x(j);
    %Calculate the Adaptive Filter Output
    y(j)     = temp'*H;
    %Calculate Measured Error
    E     = DR(j)- y(j);
    Error(i,j) = E;
    %Update the Filter Coeficients
    for k=1:(j*(j<=L)+L*(j>L))
        H(k)    = H(k)+u*E*temp(k)/(temp'*temp);
    end
    %Update the Temp Vector
    temp = circshift(temp,1);
    %Store Filter Coeficients
    H_Data(j,:) = H;
end
end

%Examine the Echo Path
figure(1);
subplot(2,1,1);plot(y);title('Adaptive Output');
subplot(2,1,2);plot(x);title('Corrupted Input');

figure(2);
Error = squeeze(mean(Error.^2));
plot(20*log10(abs(Error)));
legend('NLMS');
title('LMS Filter Error');
xlabel('Samples');ylabel('Error [dB]');

figure(3);
H_data = squeeze(mean(H_Data(L:n,:)));
freqz(H_data');hold on;freqz(H_Data(n,:)');
title('Optimum Steady State Filter');
figure(4);
[X,Y] = meshgrid(1:n,1:L);
title('LMS Algorithm Filter Coeficient Convergence')
xlabel('Time');ylabel('Filter Coeficients');
contourf(X,Y,H_Data',10);colormap(jet);colorbar;

%Apply the best case static Filter (Average Filter)
figure(5);
subplot(2,1,1);
plot(DR);title('Perfect Input');axis([n-1500 n -0.2 1.2]);
subplot(2,1,2);
plot(filter(H_data,1,x));title('Filtering Using Best Fit LMS Method');
axis([n-1500 n -0.2 1.2]);

figure(6);
subplot(2,1,1);
plot(x);title('Corrupted Input');axis([n-1500 n -0.2 1.2]);
subplot(2,1,2);
plot(filter(H_data,1,x));title('Filtering Using Best Fit LMS Method');
axis([n-1500 n -0.2 1.2]);

%SNR
disp('SNR=');
disp(snr(DR,noise));
disp('MSE [dB]=');
disp(20*log10(abs(mean(DR-filter(H_data,1,x)))));


%Prep
figure();
subplot(2,1,1);
plot(DR);axis([1E4 1.3E4 -inf inf]);
title('ECG Input')
xlabel('Samples');ylabel('Magnitude');
subplot(2,1,2);
plot(noise);axis([1E4 1.3E4 -inf inf]);
title('Normally Distributed White Noise')
xlabel('Samples');ylabel('Magnitude');

figure();
subplot(2,1,1);
plot(x);axis([1E4 1.3E4 -inf inf]);
title('ECG Signal Corrupted with White Noise (SNR=0.97)')
xlabel('Samples');ylabel('Magnitude');
subplot(2,1,2);
plot(y);axis([1E4 1.3E4 -inf inf]);
title('Recovered ECG Signal using LMS Method')
xlabel('Samples');ylabel('Magnitude');


