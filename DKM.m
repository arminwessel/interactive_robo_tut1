%% Question 6
param; % load parameters

q_dot = [0.5;1;-0.5;0.5;1;-0.5];

% q=qi
qi=-pi/2*[1,0,1,1,1,1]';
thetai=qi+[0;0;pi/2;0;0;0];
J_i = ComputeJac(angles_alpha,distances_d,thetai,distances_r);
J_v_i=J_i(1:3,:);
twist_i = J_i*q_dot;
[U_i,S_i,V_i] = svd(J_v_i);
sigmas_i=diag(S_i);
[x, y, z] = ellipsoid(0,0,0,sigmas_i(1),sigmas_i(2),sigmas_i(3),30);
figure(2)
surf(x, y, z);
axis equal


% q=qf
qf=pi/4*[0,1,0,2,2,0]';
thetaf = qf+[0;0;pi/2;0;0;0];
J_f = ComputeJac(angles_alpha,distances_d,thetaf,distances_r);
J_v_f=J_f(1:3,:);
twist_f = J_f*q_dot;
[U_f,S_f,V_f] = svd(J_v_f);
sigmas_f=diag(S_f);
[x, y, z] = ellipsoid(0,0,0,sigmas_f(1),sigmas_f(2),sigmas_f(3),30);
figure(3)
surf(x, y, z)
axis equal

%% Use Matlab function "rotate" to rotate ellipsoids
%% Where should the origin be?