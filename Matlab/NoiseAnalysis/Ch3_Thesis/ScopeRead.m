function Data = ScopeReadV2(visaAddress, Xscale, Yscale1, Yscale2, Sig_Ch_Num,Sig_Ch_Num2)
% Connect to the instrument and set the buffer size and instrument timeout
inst = visa('agilent', visaAddress);

inst.InputBufferSize = 10000000; % This may need to be adjusted (depth * 2) + 1 should be enough
inst.Timeout = 100;
inst.ByteOrder = 'littleEndian';

fopen(inst);

Sig_Ch = ['CHAN',num2str(Sig_Ch_Num)];
Sig_Ch2 = ['CHAN',num2str(Sig_Ch_Num2)];

% Set the initial instrument parameters
%fprintf(inst, '*RST');
fprintf(inst, ':stop;:cdis');
fprintf(inst, '*OPC?'); Junk = str2double(fscanf(inst));
fprintf(inst, [':', Sig_Ch, ':DISPLAY ON']);
fprintf(inst, '*OPC?'); Junk = str2double(fscanf(inst));
fprintf(inst, [':TIMebase:SCALe ', num2str(Xscale)]);
fprintf(inst, [':CHANnel',num2str(Sig_Ch_Num),':SCALe ', num2str(Yscale1)]);
fprintf(inst, [':CHANnel',num2str(Sig_Ch_Num2),':SCALe ', num2str(Yscale2)]);
fprintf(inst, ':TRIGGER:EDGE:SLOPE POSITIVE');
fprintf(inst, [':TRIGGER:LEVEL ', Sig_Ch, ',0.0']);
fprintf(inst, ':ACQUIRE:MODE RTIME');
fprintf(inst, '*OPC?'); Junk = str2double(fscanf(inst));
% Get some data.
fwrite(inst, '*cls');
fwrite(inst, ':single');
% Wait for a trigger
ter = 0;
while(ter ~= 1)
    fwrite(inst, ':ter?');
    stringTer = fscanf(inst, '%s');
    ter = str2double(stringTer);
end

% Now unload the ScopeData for first channel
fprintf(inst, ['WAV:SOURCE ', Sig_Ch]);
fprintf(inst, 'WAV:FORMAT WORD');
fprintf(inst, 'WAVEFORM:BYTEORDER LSBFirst');
preambleBlock = query(inst,':WAVEFORM:PREAMBLE?');
fprintf(inst, '*OPC?'); Junk = str2double(fscanf(inst));
fprintf(inst,':WAV:DATA?');
ScopeData.RawData = binblockread(inst,'uint16');
Junk = fread(inst,1,'schar'); % Read the EOF character
maxVal = 2^16;
preambleBlock = regexp(preambleBlock,',','split');
ScopeData.Format = str2double(preambleBlock{1});     % This should be 1, since we're specifying INT16 output
ScopeData.Type = str2double(preambleBlock{2});
ScopeData.Points = str2double(preambleBlock{3});
ScopeData.Count = str2double(preambleBlock{4});      % This is always 1
ScopeData.XIncrement = str2double(preambleBlock{5}); % in Time
ScopeData.XOrigin = str2double(preambleBlock{6});    % in Time
ScopeData.XReference = str2double(preambleBlock{7});
ScopeData.YIncrement = str2double(preambleBlock{8}); % Voltage
ScopeData.YOrigin = str2double(preambleBlock{9});
ScopeData.YReference = str2double(preambleBlock{10});
ScopeData.VoltsPerDiv = (maxVal * ScopeData.YIncrement /8);      % V
ScopeData.Offset = ((maxVal/2 - ScopeData.YReference) * ScopeData.YIncrement + ScopeData.YOrigin);         % V
ScopeData.SecPerDiv = ScopeData.Points * ScopeData.XIncrement/10 ; % seconds
ScopeData.Delay = ((ScopeData.Points/2 - ScopeData.XReference) * ScopeData.XIncrement + ScopeData.XOrigin); % seconds

%Save the Important Scaled Data
Data.Time = (ScopeData.XIncrement.*(1:length(ScopeData.RawData))) - ScopeData.XIncrement;
Data.A = (ScopeData.RawData - ScopeData.YReference) .* ScopeData.YIncrement + ScopeData.YOrigin; 

% Now unload the ScopeData for second channel
fprintf(inst, ['WAV:SOURCE ', Sig_Ch2]);
fprintf(inst, 'WAV:FORMAT WORD');
fprintf(inst, 'WAVEFORM:BYTEORDER LSBFirst');
preambleBlock = query(inst,':WAVEFORM:PREAMBLE?');
fprintf(inst, '*OPC?'); Junk = str2double(fscanf(inst));
fprintf(inst,':WAV:DATA?');
ScopeData.RawData = binblockread(inst,'uint16');
Junk = fread(inst,1,'schar'); % Read the EOF character
maxVal = 2^16;
preambleBlock = regexp(preambleBlock,',','split');
ScopeData.Format = str2double(preambleBlock{1});     % This should be 1, since we're specifying INT16 output
ScopeData.Type = str2double(preambleBlock{2});
ScopeData.Points = str2double(preambleBlock{3});
ScopeData.Count = str2double(preambleBlock{4});      % This is always 1
ScopeData.XIncrement = str2double(preambleBlock{5}); % in Time
ScopeData.XOrigin = str2double(preambleBlock{6});    % in Time
ScopeData.XReference = str2double(preambleBlock{7});
ScopeData.YIncrement = str2double(preambleBlock{8}); % Voltage
ScopeData.YOrigin = str2double(preambleBlock{9});
ScopeData.YReference = str2double(preambleBlock{10});
ScopeData.VoltsPerDiv = (maxVal * ScopeData.YIncrement /8);      % V
ScopeData.Offset = ((maxVal/2 - ScopeData.YReference) * ScopeData.YIncrement + ScopeData.YOrigin);         % V
ScopeData.SecPerDiv = ScopeData.Points * ScopeData.XIncrement/10 ; % seconds
ScopeData.Delay = ((ScopeData.Points/2 - ScopeData.XReference) * ScopeData.XIncrement + ScopeData.XOrigin); % seconds

% Scale the ScopeData
Data.B = (ScopeData.RawData - ScopeData.YReference) .* ScopeData.YIncrement + ScopeData.YOrigin; 

fclose(inst);
delete(inst);