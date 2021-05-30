%% Direct Kinematic Model %%
% clear all;
% close all;
param;
DGM;
%% Q6 : ComputeJac
q_dot = [0.5;1;-0.5;0.5;1;-0.5];

% Initial Configuration
qi=-pi/2*[1,0,1,1,1,1]';
% qi=-pi/2*[1,0,0,0,0,0]'; % singular configuration example
thetai=qi+[0;0;pi/2;0;0;0];
J_i = ComputeJac(angles_alpha,distances_d,thetai,distances_r);
J_v_i=J_i(1:3,:);
v_0E_i = J_i*q_dot;
disp('Linear Velocities Initial Configuration')
disp(v_0E_i);

% Final Configuration
qf=pi/4*[0,1,0,2,2,0]';
thetaf = qf+[0;0;pi/2;0;0;0];
J_f = ComputeJac(angles_alpha,distances_d,thetaf,distances_r);
J_v_f=J_f(1:3,:);
v_0E_f = J_f*q_dot;
disp('Linear Velocities Final Configuration')
disp(v_0E_f);

%% Question 7
%% Q7 : Analysis of velocities' transmissions and manipulabilities
% SVD decomposition
% Initial Configuration
[U_i,S_i,V_i] = svd(J_v_i);
disp('Sigma Matrix Initial Configuration')
disp(S_i);

%Final Configuration
[U_f,S_f,V_f] = svd(J_v_f);
disp('Sigma Matrix Final Configuration')
disp(S_f);

% Manipulability
% Initial Configuration
sigmas_i=diag(S_i);
W_i=prod(sigmas_i);
disp('Manipulability Initial Configuration')
disp(W_i);

% Final Configuration
sigmas_f=diag(S_f);
W_f=prod(sigmas_f);
disp('Manipulability Final Configuration')
disp(W_f);

figure();
PlotFrame(qi);
PlotFrame(qf);

% Ellipse for Initial Configuration
[ell_x_i, ell_y_i, ell_z_i] = ellipsoid(DGM_i.trans(1),DGM_i.trans(2),DGM_i.trans(3),sigmas_i(1),sigmas_i(2),sigmas_i(3),30);
ell_i=surf(ell_x_i, ell_y_i, ell_z_i);
P1_i=[1;0;0];
P2_i=U_i(:,1);
a_i = acosd(dot(P1_i,P2_i)/(norm(P1_i)*norm(P2_i)));
rotate(ell_i,P1_i,a_i,DGM_i.trans);

% Ellipse for Final Configuration
[ell_x_f, ell_y_f, ell_z_f] = ellipsoid(DGM_f.trans(1),DGM_f.trans(2),DGM_f.trans(3),sigmas_f(1),sigmas_f(2),sigmas_f(3),30);
ell_f=surf(ell_x_f, ell_y_f, ell_z_f);
P1_f=[1;0;0];
P2_f=U_f(:,1);
a_f = acosd(dot(P1_f,P2_f)/(norm(P1_f)*norm(P2_f)));
rotate(ell_f,P1_f,a_f,DGM_f.trans);