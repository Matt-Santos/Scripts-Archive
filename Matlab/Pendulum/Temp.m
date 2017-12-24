% Octave Code
% Control Systems I 
% Written by Matthew Santos

pkg load control
pkg load symbolic
pkg load signal
clear all;close all;
graphics_toolkit('gnuplot')


% Symbols
syms s;
syms T1_I T2_I T1_N T2_N G_N G1_I G2_I R;
syms Kp Kd Ki;
syms k_sys k_enc1 k_enc4;
syms A B C D E F;

% Given Transfer Functions
T1_I = k_sys*k_enc1*(A*s^2-B)/(s^4+D*s^3-E*s^2-F*s);
T2_I = k_sys*k_enc4*(-C)/(s^3+D*s^2-E*s-F);
T1_N = k_sys*k_enc1*(A*s^2+B)/(s^4+D*s^3+E*s^2+F*s);
T2_N = k_sys*k_enc4*(C)/(s^3+D*s^2+E*s+F);

% Create PID Controller
G_N=Kp+Kd*s+Ki/s;

% Get Characteristic
[T1_N_num,TN_Delta] = numden(simplify((G_N*T1_N*R)/(1+G_N*T1_N+G_N*T2_N)));

TN_Delta = subs(TN_Delta ,{A B C D E F k_sys k_enc1 k_enc4},{112.25 3589.57 91.37 1.1242 47.586 35.948 0.00338 2546 2608});
TN_Delta_ = vpa(TN_Delta ,3);

% Root Locas PID Scanner
%{
n=1;
for x=0:0.1:10
  
  Kp_N = x;
  Ki_N = 0;
  Kd_N = 0;

  TN_Delta = subs(TN_Delta_,{Kp,Kd,Ki},{Kp_N,Kd_N,Ki_N});
  [TN_Delta,b] = coeffs(TN_Delta,s);
  TN_Delta = double(TN_Delta);
  Zeros = roots(TN_Delta');

  for i=1:length(Zeros)
    RealRoots(n,i)=real(Zeros(i));
    ImagRoots(n,i)=imag(Zeros(i));
  end
  n=n+1;
end
scatter(RealRoots,ImagRoots)
%}

% Stability Checker
n=1;
for x=-10:1:10
for y=-10:1:10
  
  Kp_N = x;
  Kd_N = y;
  Ki_N = 0;

  TN_Delta = subs(TN_Delta_,{Kp,Kd,Ki},{Kp_N,Kd_N,Ki_N});
  [TN_Delta,b] = coeffs(TN_Delta,s);
  TN_Delta = double(TN_Delta);
  Zeros = roots(TN_Delta');
  Stable=1;
  for i=1:length(Zeros)
    if real(Zeros(i))>=0
      Stable=0;
    endif
  end
  if Stable==0
    DataKp(n)=Kp_N;
    DataKd(n)=Kd_N;
    DataKi(n)=Ki_N;
  endif
  n=n+1;
end
end
scatter(DataKp,DataKd)

