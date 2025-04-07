% FMCW Simulator
% Written by Matthew Santos
% ---------------------------
clear;clc;close all

% Includes
Parameters;

%Create the input Signals
  t=[0:1/sampling_frequency:simulationTime];
  message = GenSawtooth(message_frequency,t); %manually created/synthesized
  carrier = carrier_amplitude*sin(2*pi*carrier_frequency*t);
  
%Perform Modulation
  FMCW = FModulate(message,carrier_frequency,t,frequency_deviation); %created by VCO
  figure();plot(t,FMCW,t,message);axis([0 2/message_frequency]);
  figure();Get_FFT(FMCW,sampling_frequency);axis([0 2*carrier_frequency]);
  clear message carrier;
  
%Perform Filtering? (Not sure I need to bother at this stage)
%Amplification (do a power analysis later and include this)
%Calculate Antenna Output (antenna gain, directionality ect...todo)

%Calculate Return Signal (improve later, multiple targets, ect)
  multi_target = 0:1:10; %[m]
  multi_target_amp = ones([1,10]);
  FMCW_Return = zeros(1,length(t));
  for i=1:length(multi_target)-1;
    FMCW_Ri = [zeros(1,round(multi_target(i)*sampling_frequency/(c_0))),multi_target_amp(i)*FMCW(1:length(FMCW)-multi_target(i)*sampling_frequency/(c_0))];
    if (length(FMCW_Ri) < length(t))
      FMCW_Ri = [0 FMCW_Ri];
    end
    FMCW_Return = FMCW_Return + FMCW_Ri;
  end
  clear FMCW_Ri multi_target;
  [f1_spec,t1_spec]=SpectralGraph(FMCW,sampling_frequency);
  [f2_spec,t2_spec]=SpectralGraph(FMCW_Return,sampling_frequency);
  figure();plot(t1_spec,f1_spec,'b',t2_spec,f2_spec,'r');
    
%Pre Amplification (do power analysis later on)

%Calculate Mixer Output
  MIX_out = FMCW.*FMCW_Return;
  figure();plot(t,MIX_out);
  figure();Get_FFT(MIX_out,sampling_frequency);
  clear FMCW FMCW_Return;
  
%Low Pass Filter (large gap so butterworth seems like a good choice)
  cutoff = 0.1*10^6; %[Hz]
  order = 1;
  [b,a] = butter(order,cutoff/(sampling_frequency));
  figure();[h,w]=freqz(b,a,512,sampling_frequency);freqz_plot(w,h);
  LPF_out = filter(b,a,MIX_out);
  figure();plot(t,LPF_out);
  figure();Get_FFT(LPF_out,sampling_frequency);

%Calculate the resulting range and position