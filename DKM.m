%% Question 6
param; % load parameters

q_dot = [0.5;1;-0.5;0.5;1;-0.5];

% q=qi
qi=-pi/2*[1,0,1,1,1,1]';
thetai=qi+[0;0;pi/2;0;0;0];
J_i = ComputeJac(angles_alpha,distances_d,thetai,distances_r);
twist_i = J_i*q_dot

% q=qf
qf=pi/4*[0,1,0,2,2,0]';
thetaf = qf+[0;0;pi/2;0;0;0];
J_f = ComputeJac(angles_alpha,distances_d,thetaf,distances_r);
twist_f = J_f*q_dot