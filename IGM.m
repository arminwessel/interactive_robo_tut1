%% Question 8
param; % load parameters
close all


%% Q8/1
X_d_i = [-0.1;-0.7;0.3];
q_0_i=[-1.57;0;-1.47;-1.47;-1.47;-1.47];
k_max=100;
eps=0.0001;

[q_i, err_i] = ComputeIGM(X_d_i, q_0_i, k_max, eps);
figure(1)
p1=plot(linspace(1,length(err_i),length(err_i)), err_i);
p1.LineWidth = 2;
p1.Marker = 'o';
title('Inverse calculation of q_i')
xlabel('Iteration')
ylabel('Cartesian Error')


theta_i=q_i+[0;0;pi/2;0;0;0];
g_0E_i=ComputeDGM(angles_alpha,distances_d,theta_i,distances_r);
f_q_i=g_0E_i(1:3,4)
    
err_i=X_d_i-f_q_i

%% Q8/2
X_d_f = [0.64;-0.1;1.14];
q_0_f = [0;0.8;0;1;2;0];
k_max=100;
eps=0.001;

[q_f, err_f] = ComputeIGM(X_d_f, q_0_f, k_max, eps);
figure(2)
p1=plot(linspace(1,length(err_f),length(err_f)), err_f);
p1.LineWidth = 2;
p1.Marker = 'o';
title('Inverse calculation of q_f')
xlabel('Iteration')
ylabel('Cartesian Error')


theta_f=q_f+[0;0;pi/2;0;0;0];
g_0E_f=ComputeDGM(angles_alpha,distances_d,theta_f,distances_r);
f_q_f=g_0E_f(1:3,4)
    
err_f=X_d_f-f_q_f
