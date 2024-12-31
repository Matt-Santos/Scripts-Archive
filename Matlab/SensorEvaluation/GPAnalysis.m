function [Gain,GainVar,Phase] = GPAnalysis(x1,x2,Freq,Tx)
A = x1-mean(x1);
B = x2-mean(x2);
Ah = hilbert(x1);
Bh = hilbert(x2);
c = corrcoef(Ah,Bh);
Phase = rad2deg(angle(c(2)));
if Phase<0
    PhaseDelay = (-Phase)/(360*Freq);
else
    PhaseDelay = (360-Phase)/(360*Freq);
end
SampleDelay = (PhaseDelay/(Tx(2)-Tx(1)));
%subplot(2,1,1);plot(A);hold on;plot(B);hold off;
A = A(SampleDelay:end);
B = B(1:end-SampleDelay+1);
Gain = mean(B./A);
GainVar = var(B./A);
%subplot(2,1,2);plot(A);hold on;plot(B);hold off;
Phase = wrapTo360(Phase);
end