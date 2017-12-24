# FMCW sub-Function Definitions

1;  #force script

function [x,y] = Get_FFT(signal,sf);
  mag = abs(fftshift(fft(signal)/length(signal)));
  y=20*log10(mag/max(mag));
  x = sf*(-length(y)/2:length(y)/2-1)/length(y);
  if (nargout==0)
    plot(x,y);
    xlabel("Frequency [Hz]");
    ylabel("Magnitude [dB]");
  end
end

function x = FModulate(msg,fc,t,fdev);
  intm = cumsum(msg)/(length(t)/max(t));
  x = cos(2*pi*fc*t + 2*pi*intm*fdev);
  if (nargout==0)
    plot(t,x,t,message);
  end
end

function [f,t] = SpectralGraph(x,sf); #todo
  window=0.01*sf/carrier_frequency;
  step=window/5;
  f=0;
  t=0;
  if (nargout==0)
    specgram(x,2^nextpow2(window),sf,window,window-step);
    colorbar('EastOutside');
    caxis([20 60]);
  end
end

function x = GenSawtooth(f,t);
  x=linspace(-1,1,length(t)/(f*max(t)));
  x=repmat(x,1,max(t)*f);
  x=[0 x];
end