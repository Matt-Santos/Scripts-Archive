function [x,y] = Get_FFT(signal,sf);
  mag = abs(fftshift(fft(signal)/length(signal)));
  y=20*log10(mag/max(mag));
  x = sf*(-length(y)/2:length(y)/2-1)/length(y);
  if (nargout==0)
    plot(x,y);
    xlabel("Frequency [Hz]");
    ylabel("Magnitude [dB]");
    limit = -80;
    tmp = find(y >= limit);
    axis([x(tmp(1)) x(tmp(length(tmp))) limit 0]);
  end
end