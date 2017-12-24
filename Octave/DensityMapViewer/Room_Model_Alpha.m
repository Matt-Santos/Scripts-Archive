% Room Model Creation - Alpha
% Written by Matthew Santos
% ---------------------------
clear;clc;close all;

graphics_toolkit qt;

% Define Globals
global X;
global Y;
global Z;
global DensityMap;

%Room System Limits
x_limits = [-10,10]; %[m]
y_limits = [-20,20]; %[m]
z_limits = [-30,30]; %[m]
model_res = 1; %[m] model resolution

%Build the 3D Model Index Matrix
[X,Y,Z]=meshgrid(x_limits(1):model_res:x_limits(2),y_limits(1):model_res:y_limits(2),z_limits(1):model_res:z_limits(2));

%Create Empty Density Model Map
DensityMap=zeros(size(X));

%Add Walls at Outer Boundary with Perfect Reflectivity
wall_reflectivity=1;
for i=[1,size(DensityMap,1)]
    DensityMap(i,:,:)=wall_reflectivity;
end
for i=[1,size(DensityMap,2)]
    DensityMap(:,i,:)=wall_reflectivity;
end
for i=[1,size(DensityMap,3)]
    DensityMap(:,:,i)=wall_reflectivity;
end

%Add a test line
for i=1:min(size(DensityMap))
    DensityMap(i,i,i)=0.7;
end

%Save the Room Mapping
save('Room_Model_Alpha.mat','X','Y','Z','DensityModelMap');

%[Xi,Yi,Zi] = sphere(100)
%contourslice(X,Y,Z,DensityModelMap,Xi*10,Yi*20,Zi*30)

[Xi,Yi,Zi] = cylinder;
%contourslice(X,Y,Z,DensityModelMap,[],[],[]);

%Display the Model With Viewer
DensityMapViewer(DensityMap,X,Y,Z)

