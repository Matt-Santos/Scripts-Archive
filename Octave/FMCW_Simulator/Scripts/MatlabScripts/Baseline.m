% Script 
% Writen by Matthew Santos
%----------------------------

% Script Controls
data_collection = false;
testing_ground = true;


% Varriables
eta_1 = 377; % Air 


% Script Start
%----------------------------

% Data Collection
if data_collection
  imu_data = [];
  pulse_data = [];
  
  
endif

% Testing Ground
if testing_ground
  % Permitivity Calculation
  % Assumes no attinuation
  % Neglects directivity and Gain
  % No Travel Time Calculations Yet
  E_incident = 1; %[V/m]
  freq = 1000; %[Hz]
  distance = 1; %[m]
  E_reflect = 1; %[V/m]
  eta_2 = eta_1*(E_incident+E_reflect)/(E_incident-E_reflect); %[Ohms]
  reflection_coeficient = (eta_2-eta_1)/(eta_2+eta_1);
  transmission_coeficient = (2*eta_2)/(eta_2+eta_1);
  
endif
