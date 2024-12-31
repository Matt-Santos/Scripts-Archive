%Scanning System Test
%--------------------
clear;clc;

%Equations
% v0 = sqrt(GM/r);    %Orbital Velocity
% ve = >sqrt(2*GM/r); %Escape Velocity
% g = GM/(r^2);       %Local Gravity
% Flight path angle

G = 6.67408E-11;      %[N*m^2/kg^2] Gravitational Constant

%Scan Extent Setup
scanresolution = 2;
m = 10;     %[kg]

%Target Properties
M = 6E24;   %[kg]
GM = G*M;   %[]

%Scan Progress Plot
%figure(2);clf;
figure(1);clf;
grid on;
hold on;
xlabel("x");
ylabel("y");
zlabel("z");
%axis([0 360 0 180]);

%Main Calculation (cartisian cordinates)
R = 6.4e6;
r = [R,0,0];
v = [0,1,0]*sqrt(GM/norm(r));
a = r/norm(r)*(-GM/(norm(r)^2));
tmax = 1E4;
dt = tmax/100;


%Forward Difference Evaluation



for t = 0:dt:tmax
  %Additonal Calculations
  h = cross(r,v);
  %A = GM*norm(r)/(2*GM-norm(r)*dot(v,v'));
  %e = norm(r)*dot(v,v')/GM - 1;

  %Kinematic Calculation Using Symplectic Integration Method
  v_prime = v + a*dt;
  r_prime = r + v_prime*dt;
  a_prime = r_prime/norm(r_prime)*(-GM/(norm(r_prime)^2));

  h_prime = cross(r_prime,v_prime);
  a_prime = a_prime + 0.5*h_prime/norm(h_prime)*r_prime(1)/norm(r_prime);

  %Plot Progress
  figure(1);
  scatter3(r(1),r(2),r(3),".");
  %scatter3(v(1),v(2),v(3));
  %scatter3(a(1),a(2),a(3));

  %Error Checking
  figure(2);hold on;
  plot(t,norm(r) - R);

  %Scan Progress
##  figure(3);hold on;
##  [r_polar(1),r_polar(2),r_polar(3)] = cart2sph(r(1),r(2),r(3));
##  plot(r,r_polar(3));

  %Step Update
  r = r_prime;
  v = v_prime;
  a = a_prime;
end




