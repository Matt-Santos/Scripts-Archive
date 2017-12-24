% UWB_Imaging Parameter Definitions

# Global Settings (Think hard before you change these)
  carrier_frequency = 3500*10^6;  #[Hz] 3500
  message_frequency = 100*10^6;   #[Hz]
  carrier_amplitude = 1;          #[V]
  message_amplitude = 1;          #[V]
  simulationTime = 100/message_frequency;      #[s]
  sampling_frequency =1000*carrier_frequency;  #[Hz]
  #graphics_toolkit("gnuplot");
  #graphics_toolkit("fltk");
  graphics_toolkit("qt");
  
# Fundamental Constants
  permittivity_0 = 8.854187*10^(-12); #[F/m]   "e"
  permeability_0 = 4*pi*10^(-7);      #[H/m]   "u"
  c_0            = 3*10^8;            #[m/s^2] "c"

# EMF Parameters of Air
  r_permittivity_air = 1.00058986;
  r_permeability_air = 1.00000037;
  sigma_air = 3*10^(-15);

# EMF Parameters of Other Materials
  %[impedances,MaterialList] = odsread("MaterialList.ods"); %(e_l,e_h,u_l,u_h,s_l,s_h);
  %MaterialList = MaterialList(:,1);
  %MaterialList = MaterialList(2:end);
  
  