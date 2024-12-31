%Thermal Noise Modeling
clear;clc;clf;
k=1.38E-23;%J/K
T=[10,100,300,600,1000]; %K
T=round(T);
T=flip(T);
R=logspace(0,3,1000);
%Plot Resistance vs Noise Power, Steping through temperature
for x=T
    S=sqrt(4*k*R*x*1e6)*1e6;
    h=plot(R,S,'LineWidth',2);
    h.YData(1000)
    label = strcat(num2str(x)," K");
    text2line(h,0.9,0,label);
    hold on;
    
    % Inserts text T in/near line with handle h
%  ksi - relative distance from the beginning of curve,
%  z - shift along normal to curve
end
grid on;
axis([1 1000 -inf inf]);
xlabel("Resistance [M\Omega]");
ylabel("Spectral Noise Density [uV/\surdHz]");
