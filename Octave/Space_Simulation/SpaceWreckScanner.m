%----------------------------
%Space Wreck Scanning Script
%----------------------------

%Octave Simulation Varriables
t_step = 1;                 %Timestep [s]
t_max = 1;               %TimeMax [s]

%Global Varriables (Constants)
radarRange = 2;             %[SU]
ScanRadiusMin = 4;          %[SU]
ScanRadiusMax = 12;         %[SU]

%Startup Varriables (Specified at Runtime
CentralBodyID = 0;          %Atlas.lua Index
PlanetRadius = 2;           %[SU]
PlanetGravity = 0.5;        %[m/s^2]
PlanetPosition = [0 0 0];   %[m]
ReferencePlane = 0;
StartPosition = [8 4 1];    %[m]
StartVelocity = [0 0 0];    %[m/s^2]

function [x,y,z] = Sphere(radius)
  [x,y,z] = sphere();
  x = x*radius;
  y = y*radius;
  z = z*radius;
endfunction



%Stage - Approach Node
%---------------------------
clf;figure(1);hold all;
scatter3(StartPosition(1),StartPosition(2),StartPosition(3),"green"); %Plot Starting Position
scatter3(Target(1),Target(2),Target(3));                              %Target Node
[xP,yP,zP] = Sphere(PlanetRadius); surf(xP,yP,zP);
[xS,yS,zS] = Sphere(ScanRadiusMin); mesh(xS,yS,zS);hidden off;

Target = [xS yS zS];




%Main Loop
%---------------------------
i = 0;
for t = 0:t_step:t_max

%Stage - Normalize Orbit
%---------------------------

%Stage - Initiate Scan
%---------------------------

%SubStage - Scan Next Layer
%---------------------------

%Stage - Shutdown (What to do here?)
%---------------------------




%Orbit Varriables
e = 0;  %Eccentricity
i = 0;  %Inclination
%periapsis
%apoapsis
%apocenter
%meanAnomaly
%TrueAnomaly


%Construct Parameters
r = [0 0 0]; %Position Vector
v = [0 0 0]; %Velocity Vector
a = [0 0 0]; %Acceleration
O = [0 0 0]; %Orrientation


%Status
ScanPercent = 0;

%Progress Plot
%plot(0,0);


end









%Animated 3D Plot
%----------------------------
##[xP,yP,zP] = Sphere(PlanetRadius);hold on;
##[xS,yS,zS] = Sphere(ScanRadius);
##
##surf(xP,yP,zP);
##mesh(xS,yS,zS);



























