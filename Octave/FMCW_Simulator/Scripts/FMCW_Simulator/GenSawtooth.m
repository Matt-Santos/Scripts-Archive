function x = GenSawtooth(f,t);
  x=zeros(1,round(length(t)/(f*max(t)*2)));
  x=[x linspace(0,1,length(t)/(f*max(t)*2))];
  x=repmat(x,1,round(max(t)*f));
  if (length(x) < length(t))
    x=[0 x];
  elseif (length(x) > length(t))
    x(length(x))=[];
  end
end