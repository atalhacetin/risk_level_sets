clear; clc;

theta = 45 * pi/180;
% Define Positions and Velocities
x_list = [50,50;];
xdot_list = [150,0;];
xddot_list = [0,100];

Sigma1 =[0.01,0;0,1] / 100 ;

sigma_list{1} = Sigma1;

interval = 1;
alpha_vel = 1;
alpha_acc = 1;
q_x = 0:interval:1000;
q_y = 0:interval:1000;
Q = [q_x;q_y];

P = constructRiskLevelsWithAcc(Q, x_list, xdot_list, xddot_list,sigma_list, alpha_vel, alpha_acc);
[X,Y] = meshgrid(q_x, q_y);


figure(2); clf;
plevs =  [0.005, 0.02, 0.1];
contourf(X,Y,P,plevs); hold on
scatter(x_list(:,1), x_list(:,2), "LineWidth",2, 'MarkerFaceColor', 'b')
quiver(x_list(:,1), x_list(:,2), xdot_list(:,1), xdot_list(:,2),1, 'LineWidth',2)
xlabel("x")
ylabel("z")








