%% Question 6
param; % load parameters

q_dot = [0.5;1;-0.5;0.5;1;-0.5];

% q=qi
qi=-pi/2*[1,0,1,1,1,1]';
% qi=-pi/2*[1,0,0,0,0,0]'; % singular configuration example
thetai=qi+[0;0;pi/2;0;0;0];
J_i = ComputeJac(angles_alpha,distances_d,thetai,distances_r);
J_v_i=J_i(1:3,:);
twist_i = J_i*q_dot;

% SVD decomposition
[U_i,S_i,V_i] = svd(J_v_i);
sigmas_i=diag(S_i);
[ell_x_i, ell_y_i, ell_z_i] = ellipsoid(DGM_i.trans(1),DGM_i.trans(2),DGM_i.trans(3),sigmas_i(1),sigmas_i(2),sigmas_i(3),30);

% Manipulability
W_i=prod(sigmas_i);




% q=qf
qf=pi/4*[0,1,0,2,2,0]';
thetaf = qf+[0;0;pi/2;0;0;0];
J_f = ComputeJac(angles_alpha,distances_d,thetaf,distances_r);
J_v_f=J_f(1:3,:);
twist_f = J_f*q_dot;

% SVD decomposition
[U_f,S_f,V_f] = svd(J_v_f);
sigmas_f=diag(S_f);
[ell_x_f, ell_y_f, ell_z_f] = ellipsoid(DGM_f.trans(1),DGM_f.trans(2),DGM_f.trans(3),sigmas_f(1),sigmas_f(2),sigmas_f(3),30);

% Manipulability
W_f=prod(sigmas_f);
%% Use Matlab function "rotate" to rotate ellipsoids
%% Where should the origin be?

%% Question 7
DGM;
% ellipse for qi
ell_i=surf(ell_x_i, ell_y_i, ell_z_i);
alpha 0.3
rotate(ell_i, DGM_i.rotvec, DGM_i.rotangle/pi*180, [DGM_i.trans(1),DGM_i.trans(2),DGM_i.trans(3)]);

% ellipse for qf
ell_f=surf(ell_x_f, ell_y_f, ell_z_f);
alpha 0.3
rotate(ell_f, DGM_f.rotvec, DGM_f.rotangle/pi*180, [DGM_f.trans(1),DGM_f.trans(2),DGM_f.trans(3)]);
axis equal
axis padded