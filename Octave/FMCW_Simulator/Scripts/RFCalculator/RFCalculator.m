% RFCalculator
% Written by Matthew Santos
% ---------------------------
clear;clc;close all;
if (exist('OCTAVE_VERSION', 'builtin')~=0)
    pkg load io;
end
%graphics_toolkit("gnuplot");

% TODO
% -add in antenna properties and their effects
% -double check reflection coeficient on result phase
% -add in realistic angle calculations

%Constants
permittivity_0 = 8.854187*10^(-12); %[F/m] "e"
permeability_0 = 4*pi*10^(-7);      %[H/m] "u"
r_permittivity_air = 1.00058986;
r_permeability_air = 1.00000037;
sigma_air = 3*10^(-15);

%Evaluation Settings [min,max,res]
distance_limits = [1,2,1]; %[m]
frequency_limits = [8,9,100]; %[Hz] this case min/max=decades, res = number of divisions
angle_factor = 1; %[1=normal, 0=parallel]

%Antenna Properties
directivity = 0;
efficiency = 0;
gain = 0;
antenna_diameter = 0.01;      %[m]


% Script Start
%-------------------------------------------

Transmit_Power = 1;                 %[Watts]
% Get Material Data
[impedances,MaterialList] = odsread("MaterialList.ods"); %(e_l,e_h,u_l,u_h,s_l,s_h);
MaterialList = MaterialList(:,1);
MaterialList = MaterialList(2:end);
% Sweep Arrays
frequencies = logspace(frequency_limits(1),frequency_limits(2),frequency_limits(3));
distances = [distance_limits(1):distance_limits(3):distance_limits(2)];

matID=1;
for imp=impedances'
  % Result Arrays
  Result_frequency=[];
  Result_distance=[];
  Result_Mag=[];
  Result_Phase=[];
  for f=frequencies
     % air impedance calculation
     gamma_air = sqrt(1i*2*pi*f*permeability_0*r_permeability_air*(sigma_air+2i*pi*f*permittivity_0*r_permittivity_air));  %propigation constant
     eta_air = sqrt(1i*2*pi*f*permeability_0*r_permeability_air/(sigma_air+2i*pi*f*permittivity_0*r_permittivity_air)); %intrinsic impedance
     % medium impedance calculation
     eta_medium = sqrt(2i*pi*f*permeability_0*impedances(matID,3)/(impedances(matID,5)+2i*pi*f*permittivity_0*impedances(matID,1)));
     % interface calculation
     reflection_coeficient = (eta_medium-eta_air)/(eta_medium+eta_air);
     for d=distances
       %Return Calculation (there and back again)
       Result_frequency = [Result_frequency;f];
       Result_distance = [Result_distance;d];
       Result_Mag = [Result_Mag;(-Transmit_Power/abs(eta_air))*e^(-2*real(gamma_air)*d)*real(reflection_coeficient)*angle_factor];
       Result_Phase = [Result_Phase;2*imag(gamma_air)*d+angle(eta_air)+imag(reflection_coeficient)];  
     end
  end
  %figure(matID);
  tri=delaunay(Result_frequency,Result_distance);
  trisurf(tri,Result_frequency,Result_distance,Result_Mag);
  title(MaterialList(matID));
  xlabel("Frequency [Hz]");
  ylabel("Distance [m]");
  zlabel("Return Power [Watts]");
  hold on;
  matID = matID + 1;
end
lgnd = legend(MaterialList);
set(lgnd,'color','none');
set(lgnd,'Box','off');
