function filename = FindECG(RecordIndex,database)
  directory = strcat('Data/',database,'/');
  fid = fopen(strcat(directory,'RECORDS'));
  for i=0:RecordIndex
    filename = strcat(directory,fgetl(fid),'.dat');
  end
  fclose(fid);
end