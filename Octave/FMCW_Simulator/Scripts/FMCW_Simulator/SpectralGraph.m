function [f,t] = SpectralGraph(x,sf); %todo
  window = 10000; %this needs to be fixed to something stable
  if (nargout==0)
    specgram(x,2^nextpow2(window),sf);
    colorbar('EastOutside');
    caxis([20 60]);
  else
    [tmp_s,tmp_f,t] = specgram(x,window,sf);
    for i=1:size(tmp_s,2)
      [val,index] = max(real(tmp_s(:,i)));
      f(i)=tmp_f(index);
    end
  end
end