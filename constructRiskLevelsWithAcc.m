function [riskLevelsMap] = constructRiskLevels(Q, x_list, xdot_list, xddot_list, sigma_list, alpha_vel, alpha_acc)
%constructRiskLevels
% constructing risk levels for given environment Q with given positions
% (x_list) and velocities (x_dot_list)
% sigma list is list of sigmas of normal distribution and a is logistics
% function coefficient

q_x = Q(1,:);
q_y = Q(2,:);
P = zeros(length(q_x), length(q_y));
for i=1:length(q_x)
    for j=1:length(q_y)
        p_sum = 0;
        for k=1:length(x_list(:,1))
            x_i=[x_list(k,1);x_list(k,2)];
            x_i_dot = [xdot_list(k,1);xdot_list(k,2)];
            x_i_ddot = [xddot_list(k,1);xddot_list(k,2)];
            
            q = [q_x(i); q_y(j)];
            d = q -x_i;
            theta = atan2(x_i_dot(2), x_i_dot(1));
            R = [cos(theta), sin(theta); -sin(theta), cos(theta)];
            d_rotated = R*d;
            p = exp(-0.5*transpose(d_rotated)*sigma_list{k}*(d_rotated));
            p = p  / (1 + exp(-alpha_vel * (transpose(x_i_dot)) * (d)));
            p = p  / (1 + exp(-alpha_acc *(transpose(x_i_ddot))/vecnorm(x_i_ddot) * (q - x_i)) / sqrt(transpose(x_i_ddot)*(q))) ;
            % p = p * 100*vecnorm(transpose(x_i_ddot) *abs(q - x_i));
            % p = p * (q(1)^2 + q(2)^2)
            
            p_sum = p_sum+p;
        end
        P(j,i) = p_sum;
    end
end
riskLevelsMap = P;

end