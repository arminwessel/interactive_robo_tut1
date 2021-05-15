function [q_best, err] = ComputeIGMlimits(X_d, q_0, k_max, eps, qmin, qmax)
global angles_alpha;
global distances_d;
global distances_r;

k=0;
q=q_0;
q_best=q_0;
err=zeros(1,0);
weight_alpha=-0.015;
H_lim=0;
% use cartesian error as stop criterion
% use newton-raphson method with pseudoinverse of J
while(true)
    k=k+1;
    theta=q(:,end)+[0;0;pi/2;0;0;0];
    g_0E=ComputeDGM(angles_alpha,distances_d,theta,distances_r);
    f_q=g_0E(1:3,4);
    
    err=[err norm(X_d-f_q)];
 
    if (k>k_max)% check if max iteration number is reached
        [M,I] = min(err);
        fprintf('Maximum number of iterations reached \n error for final iteration: %f, best result was at iteration %d with %f\n\n',err(end),I,M);
        q_best = q(:,I);
        err = err(1:I);
        return;
    end
    
    if (err(k)<eps) % result found
        %disp('Result found');
        return;
    end
    
	J=ComputeJac(angles_alpha,distances_d,theta,distances_r);
    J_inv = pinv(J);
    J_inv_v = J_inv(:,1:3);
    
    H_new = (    (q(:,end) -(qmax'+qmin')/2) ./ (qmax'-qmin')    ).^2;
    
    q_next = q(:,end) + J_inv_v*(X_d-f_q) + (eye(6)-pinv(J).*J)*weight_alpha*(H_lim-H_new);
    H_lim=H_new;
    
    q = [q q_next];
    q_best = q(:,end);
    
end

end