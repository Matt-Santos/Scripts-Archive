function img = scopePNG(addrs,filename)

% Define Object
visaObj = visa('agilent',addrs);
% Grab the screen from the instrument and display it
visaObj.InputBufferSize = 10000000;
% open the connection
fopen(visaObj);
% send command and get BMP.
fprintf(visaObj,':DISPLAY:DATA? PNG, SCREEN');
screenBMP = binblockread(visaObj,'uint8'); fread(visaObj,1);
% save as a BMP  file
fid = fopen(filename,'w');
fwrite(fid,screenBMP,'uint8');
fclose(fid);
% Delete objects and clear them.
delete(visaObj); clear visaObj;