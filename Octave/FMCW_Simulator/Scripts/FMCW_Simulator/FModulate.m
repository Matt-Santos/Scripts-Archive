function x = FModulate(msg,fc,t,fdev);
  intm = cumsum(msg)/(length(t)/max(t));
  x = cos(2*pi*fc*t + 2*pi*intm*fdev);
  if (nargout==0)
    plot(t,x,t,message);
  end
end