function [y t]=ReadECG(filename,sampleRate,duration)
  fid=fopen(filename,'r');
  if fid==-1
    disp('Error Reading File');  
    y=0;t=0;
    fclose(fid);
    return;
  end
  y=fread(fid,[2,duration*sampleRate],'*int16');
  t=0:1/sampleRate:length(y)/sampleRate;
  if length(t)>length(y)
    t = t(1:length(y));
  elseif length(y)>length(t)
    y = y(1:length(t));
  end
  fclose(fid);
end