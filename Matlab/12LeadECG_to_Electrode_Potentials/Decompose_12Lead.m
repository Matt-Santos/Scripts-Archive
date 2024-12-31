%Load 12 Lead ECG
load("ecg_data.mat");
fid = fopen("ECG_data.info", 'rt');
fgetl(fid);
fgetl(fid);
fgetl(fid);
[freqint] = sscanf(fgetl(fid), 'Sampling frequency: %f Hz  Sampling interval: %f sec');
interval = freqint(2);
fgetl(fid);
for i = 1:size(val, 1)
    [row(i), signal(i), gain(i), base(i), units(i)]=strread(fgetl(fid),'%d%s%f%f%s','delimiter','\t');
end
fclose(fid);
val(val==-32768) = NaN;
for i = 1:size(val, 1)
    val(i, :) = (val(i, :) - base(i)) / gain(i);
end
x = (1:size(val, 2)) * interval;
fs = 1/(x(2)-x(1));

t = x; %[s]
V1  = val(1,:);%[mV]
V2  = val(2,:);%[mV]
V3  = val(3,:);%[mV]
V4  = val(4,:);%[mV]
V5  = val(5,:);%[mV]
V6  = val(6,:);%[mV]
I   = val(7,:);%[mV]
II  = val(8,:);%[mV]
III = val(9,:);%[mV]

%Perform the seperation
RA = zeros(1,length(t)); %reference assumption
LA = II-III;
LL = II;
v1 = (2*II)/3 - III/3 + V1;
v2 = (2*II)/3 - III/3 + V2;
v3 = (2*II)/3 - III/3 + V3;
v4 = (2*II)/3 - III/3 + V4;
v5 = (2*II)/3 - III/3 + V5;
v6 = (2*II)/3 - III/3 + V6;

%Narrow the viewpoint
xlim = 48;
xlim2= 49.5;

%Plot the Leads
figure(1);
subplot(3,3,1);
plot(t,I);legend('I');
axis([xlim xlim2 -inf inf]);
subplot(3,3,2);
plot(t,II);legend('II');
axis([xlim xlim2 -inf inf]);
subplot(3,3,3);
plot(t,III);legend('III');
axis([xlim xlim2 -inf inf]);
subplot(3,3,4);
plot(t,V1);legend('V1');
axis([xlim xlim2 -inf inf]);
subplot(3,3,5);
plot(t,V2);legend('V2');
axis([xlim xlim2 -inf inf]);
subplot(3,3,6);
plot(t,V3);legend('V3');
axis([xlim xlim2 -inf inf]);
subplot(3,3,7);
plot(t,V4);legend('V4');
axis([xlim xlim2 -inf inf]);
subplot(3,3,8);
plot(t,V5);legend('V5');
axis([xlim xlim2 -inf inf]);
subplot(3,3,9);
plot(t,V6);legend('V6');
axis([xlim xlim2 -inf inf]);
%Plot the Electrodes
figure(2);
subplot(3,3,1);
plot(t,LA);legend('LA');
axis([xlim xlim2 -inf inf]);
subplot(3,3,2);
plot(t,RA);legend('RA');
axis([xlim xlim2 -inf inf]);
subplot(3,3,3);
plot(t,LL);legend('LL');
axis([xlim xlim2 -inf inf]);
subplot(3,3,4);
plot(t,v1);legend('v1');
axis([xlim xlim2 -inf inf]);
subplot(3,3,5);
plot(t,v2);legend('v2');
axis([xlim xlim2 -inf inf]);
subplot(3,3,6);
plot(t,v3);legend('v3');
axis([xlim xlim2 -inf inf]);
subplot(3,3,7);
plot(t,v4);legend('v4');
axis([xlim xlim2 -inf inf]);
subplot(3,3,8);
plot(t,v5);legend('v5');
axis([xlim xlim2 -inf inf]);
subplot(3,3,9);
plot(t,v6);legend('v6');
axis([xlim xlim2 -inf inf]);

%Output Electrode Potentials to PWL Files
file_id = fopen('LA.pwl','w');
for k = 1: length(LA)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,LA(k)); 
end  
fclose(file_id);
file_id = fopen('LL.pwl','w');
for k = 1: length(LL)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs, LL(k)); 
end  
fclose(file_id);
file_id = fopen('Ev1.pwl','w');
for k = 1: length(v1)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs, v1(k)); 
end  
fclose(file_id);
file_id = fopen('Ev2.pwl','w');
for k = 1: length(v2)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs, v2(k)); 
end  
fclose(file_id);
file_id = fopen('Ev3.pwl','w');
for k = 1: length(v3)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs, v3(k)); 
end  
fclose(file_id);
file_id = fopen('Ev4.pwl','w');
for k = 1: length(v4)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs, v4(k)); 
end  
fclose(file_id);
file_id = fopen('Ev5.pwl','w');
for k = 1: length(v5)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs, v5(k)); 
end  
fclose(file_id);
file_id = fopen('Ev6.pwl','w');
for k = 1: length(v6)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs, v6(k)); 
end  
fclose(file_id);
%Output 12 Lead Measurements to PWL Files
file_id = fopen('I.pwl','w');
for k = 1: length(I)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,I(k)); 
end  
fclose(file_id);
file_id = fopen('II.pwl','w');
for k = 1: length(II)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,II(k)); 
end  
fclose(file_id);
file_id = fopen('III.pwl','w');
for k = 1: length(III)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,III(k)); 
end  
fclose(file_id);
file_id = fopen('V1.pwl','w');
for k = 1: length(V1)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,V1(k)); 
end  
fclose(file_id);
file_id = fopen('V2.pwl','w');
for k = 1: length(V2)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,V2(k)); 
end  
fclose(file_id);
file_id = fopen('V3.pwl','w');
for k = 1: length(V3)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,V3(k)); 
end  
fclose(file_id);
file_id = fopen('V4.pwl','w');
for k = 1: length(V4)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,V4(k)); 
end  
fclose(file_id);
file_id = fopen('V5.pwl','w');
for k = 1: length(V5)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,V5(k)); 
end  
fclose(file_id);
file_id = fopen('V6.pwl','w');
for k = 1: length(V6)
   fprintf(file_id, '%6.6fs %6.6fmV \r\n' , (k-1)/fs,V6(k)); 
end  
fclose(file_id);
