%% execute param file
param

%% Question 4
% a)
qi=-pi/2*[1,0,1,1,1,1]';

disp('g_0E(qi)')
g_0E = ComputeDGM(angles_alpha,distances_d,qi,distances_r)


disp('Rotations')
disp(g_0E(1:3,1:3))

disp('Translations')
disp(g_0E(1:3,4))

% b)
qf=pi/4*[0,1,0,2,2,0]';

disp('g_0E(qi)')
g_0E = ComputeDGM(angles_alpha,distances_d,qf,distances_r)


disp('Rotations')
disp(g_0E(1:3,1:3))

disp('Translations')
disp(g_0E(1:3,4))
