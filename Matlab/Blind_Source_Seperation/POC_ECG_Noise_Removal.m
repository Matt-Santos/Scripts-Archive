%Attempts at Removing Floating GND Noise
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

%Display Relevant Source Information
figure(1);
subplot(3,1,1);
plot(T,S_ECG);title('ECG Source');
subplot(3,1,2);
plot(T,A);title('Sensor A');
subplot(3,1,3);
plot(T,B);title('Sensor B');

sources = [S_ECG B-A]';
mixtures = [A B]';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPUTE V AND U.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set short and long half-lives.
shf 		= 1; 
lhf 		= 900000; 	
max_mask_len= 500;
n			= 8; % n = num half lives to be used to make mask.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get masks to be used to find (x_tilde-x) and (x_bar-x)
% Set mask to have -1 as first element,
% and remaining elements sum to unity.

% Short-term mask.
h=shf; t = n*h; lambda = 2^(-1/h); temp = [0:t-1]'; 
lambdas = ones(t,1)*lambda; mask = lambda.^temp;
mask(1) = 0; mask = mask/sum(abs(mask));  mask(1) = -1;
s_mask=mask; s_mask_len = length(s_mask);

% Long-term mask.
h=lhf;t = n*h; t = min(t,max_mask_len); t=max(t,1);
lambda = 2^(-1/h); temp = [0:t-1]'; 
lambdas = ones(t,1)*lambda; mask = lambda.^temp;
mask(1) = 0; mask = mask/sum(abs(mask));  mask(1) = -1;
l_mask=mask; l_mask_len = length(l_mask);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Filter each column of mixtures array.
S=filter(s_mask,1,mixtures); 	L=filter(l_mask,1,mixtures);

% Find short-term and long-term covariance matrices.
U=cov(S,1);		V=cov(L,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find eigenvectors W and eigenvalues d.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[W d]=eig(V,U); W=real(W);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Recover source signals.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ys = mixtures*W;
% Rescale ys to zero-mean and unit variance, for display purposes.
temp=repmat(mean(ys),2,1); 	ys=ys-temp;
temp=repmat(std(ys,1),2,1);	ys=ys./temp;

