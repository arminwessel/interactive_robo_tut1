function qdk = ComputeIKMlimits(X_d_i, X_d_f, V, Te, q_i, qmin, qmax)
    qdk = q_i;
    num_steps = round(norm(X_d_f-X_d_i)/(V*Te))+1;
    X_d_k = [linspace(X_d_i(1),X_d_f(1),num_steps);...
        linspace(X_d_i(2),X_d_f(2),num_steps);...
        linspace(X_d_i(3),X_d_f(3),num_steps)];
    
    k_max=100;
    eps=0.001;
    
    for i=1:length(X_d_k)
        [q, ~] = ComputeIGMlimits(X_d_k(:,i), qdk(:,end), k_max, eps, qmin, qmax);
        
        qdk = [qdk q];
    end
    
end

