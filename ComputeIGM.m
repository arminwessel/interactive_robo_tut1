function [q_best, err] = ComputeIGM(X_d, q_0, k_max, eps)
global angles_alpha;
global distances_d;
global distances_r;

k=0;
q=q_0;
q_best=q_0;
err=zeros(1,0);
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
        q_best = q(:,I+1);
        err = err(1:I);
        return;
    end
    
    if (err(k)<eps) % result found
        %disp('Result found');
        return;
    end
    
	J=ComputeJac(angles_alpha,distances_d,theta,distances_r);
    J_inv = pinv(J);
    J_inv = J_inv(:,1:3);
    q_next = wrapTo2Pi(q(:,end) + J_inv*(X_d-f_q));
    q = [q q_next];
    q_best = q(:,end);
    
end

end