% Octave Code to Simulate Analyize Rotating Pendulum
% Control Systems I 
% Written by Matthew Santos

pkg load symbolic
pkg load control
clear all;%close all;
graphics_toolkit('gnuplot')
%pkg load signal
% Symbols
syms s T1_IO T2_IO;
syms T1_I T2_I T1_N T2_N G_N G1_I G2_I R;
syms Kp Kd Ki Kp1 Kd1 Ki1 Kp2 Kd2 Ki2;
syms k_sys k_enc1 k_enc4;
syms A B C D E F;

% Given Transfer Functions
T1_I = k_sys*k_enc1*(A*s^2-B)/(s^4+D*s^3-E*s^2-F*s);
T2_I = k_sys*k_enc4*(-C)/(s^3+D*s^2-E*s-F);
T1_N = k_sys*k_enc1*(A*s^2+B)/(s^4+D*s^3+E*s^2+F*s);
T2_N = k_sys*k_enc4*(C)/(s^3+D*s^2+E*s+F);

% Create PID Controllers
G_N=Kp+Kd*s+Ki/s;
G_I1=Kp1+Kd1*s+Ki1/s;
G_I2=Kp2+Kd2*s+Ki2/s;

% Non-Inverting Controller Feedback System with Controller
[T1_N_num,T1_N_den] = numden(simplify((G_N*T1_N*R)/(1+G_N*T1_N+G_N*T2_N)));
[T2_N_num,T2_N_den] = numden(simplify((G_N*T2_N*R)/(1+G_N*T1_N+G_N*T2_N)));
[T1_N_Charaistic,b] = coeffs(T1_N_den,s);
[T2_N_Charaistic,b] = coeffs(T2_N_den,s);

% Inverting Controller Feedback System
eq1 = ((1+G_I2*(T2_I-T1_I))*G_I1*T1_I*R)/(1+G_I1*T1_I+G_I2*T2_I);
eq2 = (R*G_I1*T1_I*(1+G_I1*T1_I+G_I2*T2_I)-G_I1^2*T2_I*T1_I*R*(1+G_I2*(T2_I-T1_I)))/((1+G_I2*T2_I)*(1+G_I1*T1_I+G_I2*T2_I));
sys1 = simplify(eq1);
sys2 = simplify(eq2);

Y1_I = subs(sys1,{A B C D E F k_sys k_enc1 k_enc4 R},{112.25 3589.57 91.37 1.1242 47.586 35.948 0.00338 2546 2608 1/s});
Y2_I = subs(sys2,{A B C D E F k_sys k_enc1 k_enc4 R},{112.25 3589.57 91.37 1.1242 47.586 35.948 0.00338 2546 2608 1/s});

Y1_I = vpa(simplify(Y1_I),3);
Y2_I = vpa(simplify(Y2_I),3);

[T1_I_num,T1_I_den] = numden(Y1_I);
[T2_I_num,T2_I_den] = numden(Y2_I);
T1_I_num = coeffs(T1_I_num,s);
T1_I_den = coeffs(T1_I_den,s);
T2_I_num = coeffs(T2_I_num,s);
T2_I_den = coeffs(T2_I_den,s);

poles1=[];
zeros1=[];
poles2=[];
zeros2=[];
Lpoles1={};
Lzeros1={};
Lpoles2={};
Lzeros2={};
i=1;
for n=-1:0.1:1
  Kp1_=0.01;
  Kd1_=0;
  Ki1_=0;
  Kp2_=n;
  Kd2_=0;
  Ki2_=0;
T1_I_numTest = subs(T1_I_num,{Kp1,Kd1,Ki1,Kp2,Kd2,Ki2},{Kp1_,Kd1_,Ki1_,Kp2_,Kd2_,Ki2_});
T1_I_denTest = subs(T1_I_num,{Kp1,Kd1,Ki1,Kp2,Kd2,Ki2},{Kp1_,Kd1_,Ki1_,Kp2_,Kd2_,Ki2_});
T2_I_numTest = subs(T2_I_num,{Kp1,Kd1,Ki1,Kp2,Kd2,Ki2},{Kp1_,Kd1_,Ki1_,Kp2_,Kd2_,Ki2_});
T2_I_denTest = subs(T2_I_den,{Kp1,Kd1,Ki1,Kp2,Kd2,Ki2},{Kp1_,Kd1_,Ki1_,Kp2_,Kd2_,Ki2_});
[pn1,zn1] = pzmap(tf(double(T1_I_numTest),double(T1_I_denTest)));
[pn1,zn1] = pzmap(tf(double(T1_I_numTest),double(T1_I_denTest)));
[pn2,zn2] = pzmap(tf(double(T2_I_numTest),double(T2_I_denTest)));
[pn2,zn2] = pzmap(tf(double(T2_I_numTest),double(T2_I_denTest)));
poles1 = [poles1;pn1];
zeros1 = [zeros1;zn1];
poles2 = [poles2;pn2];
zeros2 = [zeros2;zn2];
Lpoles1{i} = pn1;
Lzeros1{i} = zn1;
Lpoles2{i} = pn2;
Lzeros2{i} = zn2;
i=1+i;
%pause(1);
end
% Plot All Poles and Zeros
figure(1)
zplane(zeros1,poles1);
xlabel('Re');
ylabel('Imag');
figure(2)
zplane(zeros2,poles2);
xlabel('Re');
ylabel('Imag');
% Plot the Root Locus (this is gona be fun...)
for i=1:length(Lpoles1)
  %Theta1
  for ii=1:length([Lpoles1(i){1}])
    RLineXP1(ii,i)=real(Lpoles1(i){1}(ii));
    RLineYP1(ii,i)=imag(Lpoles1(i){1}(ii));
  end
  for ii=1:length([Lzeros1(i){1}])
    RLineXZ1(ii,i)=real(Lzeros1(i){1}(ii));
    RLineYZ1(ii,i)=imag(Lzeros1(i){1}(ii));
  end
  %Theta2
    for ii=1:length([Lpoles2(i){1}])
    RLineXP2(ii,i)=real(Lpoles2(i){1}(ii));
    RLineYP2(ii,i)=imag(Lpoles2(i){1}(ii));
  end
  for ii=1:length([Lzeros2(i){1}])
    RLineXZ2(ii,i)=real(Lzeros2(i){1}(ii));
    RLineYZ2(ii,i)=imag(Lzeros2(i){1}(ii));
  end
end
%Theta1 RL
figure(3)
for i=size(RLineYP1)(1)
  plot(RLineXP1(i,:),RLineYP1(i,:))
  hold on
end
for i=size(RLineYZ1)(1)
  plot(RLineXZ1(i,:),RLineYZ1(i,:))
end
hold off
%Theta2 RL
figure(4)
for i=size(RLineYP2)(1)
  plot(RLineXP2(i,:),RLineYP2(i,:))
  hold on
end
for i=size(RLineYZ2)(1)
  plot(RLineXZ2(i,:),RLineYZ2(i,:))
end



%{
assume Kp1 Kd1 Ki1 positive;
for i=1:length(T1_I_den)
  conds(i) = T1_I_den(i)<0;
end
%}

%Compute the Error Function and Performance Indexes
%E_N = 1 - T1_N_num/(T1_N_den*R)-T2_N_num/(T2_N_den*R);
%E_N = subs(E_N,{A B C D E F k_sys k_enc1 k_enc4 R},{112.25 3589.57 91.37 1.1242 47.586 35.948 0.00338 2546 2608 1/s});



% Routh Stability Check for Region of Stability
%{
T1_N_Charaistic = subs(T1_N_Charaistic,{A B C D E F k_sys k_enc1 k_enc4},{112.25 3589.57 91.37 1.1242 47.586 35.948 0.00338 2546 2608});
T1_N_Charaistic = vpa(T1_N_Charaistic,3);
syms EPS;
RA=routh(T1_N_Charaistic,EPS);
RA1=RA(1,1)>=0;
RA2=RA(2,1)>=0;
RA3=RA(3,1)>=0;
RA4=RA(4,1)>=0;
RA5=RA(5,1)>=0;
RA6=RA(6,1)>=0;
assume Kp Kd Ki positive;
sol = solve(RA2,RA3,Kp)
%}





% Contant Values
%A = 112.25;
%B = 3589.57;
%C = 91.37;
%D = 1.1242;
%E = 47.586;
%F = 35.948;
%k_sys = 0.00338;
%k_enc1 = 2546;
%k_enc4 = 2608;
