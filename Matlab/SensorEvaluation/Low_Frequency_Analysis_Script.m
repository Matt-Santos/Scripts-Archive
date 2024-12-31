%Low Frequency Analysis Script
clear;clc;close all;


for y=5:5       %Voltage
    for i=7:7   %Sensor
        %Read the input data
        Data{i,y,1} = csvread(['S' num2str(i) '/lf_' num2str(y) 'v_0_1.csv'],4,0,[4 0 500000 1]);
        Data{i,y,2} = csvread(['S' num2str(i) '/lf_' num2str(y) 'v_0_2.csv'],4,0,[4 0 500000 1]);
    end
end

        Time = min(Data(:,1)):abs((Data(100)-Data(101))/2):max(Data(:,1));
        Input  = interp1(Data(:,1),Data(:,2),Time);
        Output = interp1(Data(:,1),Data(:,3),Time);
        data = iddata(Data(:,3),Data(:,2),abs((Data(100)-Data(101))/2));
        Ts = abs((Data(100)-Data(101))/2);
        clear Data;

        plot(F{i,y},Z{i,y});hold on;
        title([num2str(y) 'Voltage']);
        legend('1','2','3','4','5','6','7');
        set(gca, 'XScale', 'log')
        axis([20*2*pi 50000*2*pi -inf 3E5]);

Data = csvread(['S7/LF_IO_5V_HighAcc.csv'],4,0,[4 0 40000 2]);
Time = min(Data(:,1)):abs((Data(100)-Data(101))/2):max(Data(:,1));
Input  = interp1(Data(:,1),Data(:,2),Time);
Output = interp1(Data(:,1),Data(:,3),Time);
data = iddata(Data(:,3),Data(:,2),abs((Data(100)-Data(101))/2));
Ts = abs((Data(100)-Data(101))/2);

[txy,w] = tfestimate(Input,Output);
figure();
subplot(2,1,1);
semilogx(w,20*log10(abs(txy)));
subplot(2,1,2);
semilogx(w,wrapToPi(angle(txy))*360/(2*pi));
