%% execute param file
param

%% Question 4
% a)
qi=-pi/2*[1,0,1,1,1,1]';
thetai=qi+[0;0;pi/2;0;0;0];

disp('g_0E(qi)')
g_0E = ComputeDGM(angles_alpha,distances_d,thetai,distances_r);

disp('Translations')
disp(g_0E(1:3,4));

rotparam = rotm2axang(g_0E(1:3,1:3));
disp('Rotation Vector')
rotvec = [rotparam(1);rotparam(2);rotparam(3)];
disp(rotvec)
disp('Rotation angle')
rotangle= rotparam(4);
disp(rotangle)

% b)
qf=pi/4*[0,1,0,2,2,0]';
thetaf = qf+[0;0;pi/2;0;0;0];

disp('g_0E(qf)')
g_0E = ComputeDGM(angles_alpha,distances_d,thetaf,distances_r);

disp('Translations')
disp(g_0E(1:3,4));

rotparam = rotm2axang(g_0E(1:3,1:3));
disp('Rotation Vector')
rotvec = [rotparam(1);rotparam(2);rotparam(3)];
disp(rotvec)
disp('Rotation angle')
rotangle= rotparam(4);
disp(rotangle)

%% Plot
figure(1)
PlotFrame(qi);
PlotFrame(qf);