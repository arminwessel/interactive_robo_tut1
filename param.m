clear all;
%% Parameter Data
m=1;
d3=0.7*m;
r1=0.5*m;
r4=0.2*m;
global rE;
rE=0.1*m;

%% initialize values
global angles_alpha;
global distances_d;
global distances_r;
angles_alpha=pi/2*[0;1;0;1;-1;1];
distances_d=[0;0;d3;0;0;0];
distances_r=[r1;0;0;r4;0;0];