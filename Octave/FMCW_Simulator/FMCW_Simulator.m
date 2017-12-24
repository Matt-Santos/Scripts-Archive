# FMCW Simulator
# Written by Matthew Santos
# ---------------------------
clear;clc;close all

# Includes
pkg load io;
pkg load signal;
Parameters;
Functions;

#Create the input Signals
  t=[0:1/sampling_frequency:simulationTime];
  message = message_amplitude*sin(2*pi*message_frequency*t);#GenSawtooth(message_frequency,t); #manually created/synthesized
  carrier = carrier_amplitude*sin(2*pi*carrier_frequency*t); 
#Perform Modulation
  FMCW = FModulate(message,carrier_frequency,t,carrier_frequency/10); #created by VCO
  figure();
  plot(t,FMCW,t,message);
  axis([0 2/message_frequency]);
  
#Perform Filtering
  figure();
  Get_FFT(FMCW,sampling_frequency);
  axis([0 2*carrier_frequency]);
  specgram(FMCW,10000,sampling_frequency);
  
#Amplification and Filtering




#Calculate Antenna Output

#Determine return signals (multiple targets the angled wall idea)

#Calculate the resulting range and position

#blaw blaw blaw

#Antenna Design



#Target Definition


#Antenna Motion



#Surface Recovery
  #Surface descretised with material and angle properties
  
  
  