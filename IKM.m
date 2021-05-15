%% execute param file
param
close all;

%% Question 9
DGM;
X_d_i = [-0.1;-0.7;0.3];
X_d_f = [0.64;-0.1;1.14];
q_i=-pi/2*[1,0,1,1,1,1]';
V=1;
Te=0.001;
num_steps = 50;
X_d_k = [linspace(X_d_i(1),X_d_f(1),num_steps);...
        linspace(X_d_i(2),X_d_f(2),num_steps);...
        linspace(X_d_i(3),X_d_f(3),num_steps)];
hold on
plot3(X_d_k(1,:),X_d_k(2,:),X_d_k(3,:));
qdk = ComputeIKM(X_d_i, X_d_f, V, Te, q_i);
downsample_qdk = qdk(:,1:380:end);
for i=1:length(downsample_qdk(1,:))
   PlotFrame(downsample_qdk(:,i)); 
end

%% Question 10
qmin=pi*[-1,-0.5,-1,-1,-0.5,-1];
qmax=pi/2*[1,1,0,1,1,1];

if (true)
plot_q(qdk,qmin,qmax, 'IKM_Question_10', true);
end

%% Check trajectory
if (false)
Traj = zeros(3,length(qdk));
for i=1:length(qdk)
    theta = qdk(:,i) + [0;0;pi/2;0;0;0];
    dgm = ComputeDGM(angles_alpha,distances_d,theta,distances_r);
    Traj(:,i) = dgm(1:3,4);
end

figure(3)
plot3(Traj(1,:),Traj(2,:),Traj(3,:))
end

%% Question 11
X_d_i = [-0.1;-0.7;0.3];
X_d_f = [0.64;-0.1;1.14];
q_i=-pi/2*[1,0,1,1,1,1]';
V=1;
Te=0.001;
qmin=pi*[-1,-0.5,-1,-1,-0.5,-1];
qmax=pi/2*[1,1,0,1,1,1];

qdk = ComputeIKMlimits(X_d_i, X_d_f, V, Te, q_i, qmin, qmax);

if (true)
plot_q(qdk,qmin,qmax, 'IKM_Question_11', false);
end

%% Check trajectory
if (false)
Traj = zeros(3,length(qdk));
for i=1:length(qdk)
    theta = qdk(:,i) + [0;0;pi/2;0;0;0];
    dgm = ComputeDGM(angles_alpha,distances_d,theta,distances_r);
    Traj(:,i) = dgm(1:3,4);
end

figure(4)
plot3(Traj(1,:),Traj(2,:),Traj(3,:))
end