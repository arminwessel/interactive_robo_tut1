function [q, err] = ComputeIGM(X_d, q_0, k_max, eps)
global angles_alpha;
global distances_d;
global distances_r;

k=0;
q=q_0;
err=zeros(1,0);
% use cartesian error as stop criterion
% use newton-raphson method with pseudoinverse of J
while(true)
    k=k+1;
    theta=q+[0;0;pi/2;0;0;0];
    g_0E=ComputeDGM(angles_alpha,distances_d,theta,distances_r);
    f_q=g_0E(1:3,4);
    
    err=[err norm(X_d-f_q)];
    if (err(k)<eps) % result found
        disp('Result found');
        return;
    end
    if (k>k_max)% check if max iteration number is reached
        disp('Maximum number of iterations reached');
        return;
    end
	J=ComputeJac(angles_alpha,distances_d,theta,distances_r);
    J_inv = pinv(J);
    J_inv = J_inv(:,1:3);
    
    q = q + J_inv*(X_d-f_q);
    
end

end