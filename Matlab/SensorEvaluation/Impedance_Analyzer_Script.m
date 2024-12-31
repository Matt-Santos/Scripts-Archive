%Impedance Analyzer Script
clear;clc;close all;

for V=1:5
    figure(V);
    for S=5:7
        %Read the input Impedance file for Input/Output
        try
            Data = csvread(['S' num2str(S) '/IMPEDANCE_PM' num2str(V) 'V.CSV'],5,0,[5,0,1605,2]);
        catch
            Data = zeros(1601);disp(['IO Error S' num2str(S) 'V' num2str(V)]);
        end
        F{S,V} = Data(:,1);                                   %Frequency [Hz]
        Z_IO{S,V} = Data(:,2);                                %|Impedance| [Ohms]
        P_IO{S,V} = rad2deg(wrapToPi(deg2rad(Data(:,3))));    %Phase [degrees]
        %Read the input Impedance file for GND Injection
        try
            Data = csvread(['S' num2str(S) '/E_PM' num2str(V) 'V.CSV'],5,0,[5,0,1605,2]);
        catch
            Data = zeros(1601);disp(['GND Error S' num2str(S) 'V' num2str(V)]);
        end
        Z_GND{S,V} = Data(:,2);                               %|Impedance| [Ohms]
        P_GND{S,V} = rad2deg(wrapToPi(deg2rad(Data(:,3))));   %Phase [degrees]
        clear Data;
        
        %Plot the Impedance Data
        subplot(2,2,1);yyaxis left;
        semilogx(F{S,V},Z_IO{S,V},'-');hold on;
        title(['I/O Impedance Measurement ' num2str(V) 'V']);
        xlabel('Frequency [Hz]');
        ylabel('|Z| [Ohms]');
        %legend('1','2','3','4','5','6','7');
        yyaxis right;
        semilogx(F{S,V},P_IO{S,V},'-');hold on;
        ylabel('Phase [deg]');
        subplot(2,2,2);yyaxis left;
        semilogx(F{S,V},Z_GND{S,V},'-');hold on;
        title(['GND Impedance Measurement ' num2str(V) 'V']);
        xlabel('Frequency [Hz]');
        ylabel('|Z| [Ohms]');
        %legend('1','2','3','4','5','6','7');
        yyaxis right;
        semilogx(F{S,V},P_GND{S,V},'-');hold on;
        ylabel('Phase [deg]');

        %Convert Impedance to Transfer Function
        Rref = 1E6; %Assume input impedance of 1MOhm
        T_IO{S,V} = Rref./(Z_IO{S,V}.*cos(deg2rad(P_IO{S,V}))+1i*Z_IO{S,V}.*sin(deg2rad(P_IO{S,V}))+Rref);
        T_GND{S,V} = Rref./(Z_GND{S,V}.*cos(deg2rad(P_GND{S,V}))+1i*Z_GND{S,V}.*sin(deg2rad(P_GND{S,V}))+Rref);
        
        %Plot Bode of Transfer Function
        subplot(2,2,3);yyaxis left;
        semilogx(F{S,V},20*log10(abs(T_IO{S,V})),'-');hold on;
        title(['I/O Bode Plot ' num2str(V) 'V']);
        xlabel('Frequency [Hz]');
        ylabel('Gain [dB]');
        %legend('1','2','3','4','5','6','7');
        yyaxis right;
        semilogx(F{S,V},angle(T_IO{S,V}),'-');hold on;
        ylabel('Phase [deg]');
        subplot(2,2,4);yyaxis left;
        semilogx(F{S,V},20*log10(abs(T_GND{S,V})),'-');hold on;
        title(['GND Bode Plot ' num2str(V) 'V']);
        xlabel('Frequency [Hz]');
        ylabel('Gain [dB]');
        %legend('1','2','3','4','5','6','7');
        yyaxis right;
        semilogx(F{S,V},angle(T_GND{S,V}),'-');hold on;
        ylabel('Phase [deg]');
        
    end
end

