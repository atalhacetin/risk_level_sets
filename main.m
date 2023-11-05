clear; 
% 1d plot
mu = 1;
sigma = 1;
x_e = 0:0.1:10;
p = exp(-sigma*(x_e-mu).^2);
figure(1); clf;
plot(x_e,p)

% 2d plot
x_i = [5;5]; % xi
x_i_dot = [1;1];
Sigma =[10,0;0,1];
interval = 0.1;
a =1;
x_pos_list = 0:interval:10;
y_pos_list = 0:interval:10;
P = zeros(length(x_pos_list), length(y_pos_list));
for i=1:length(x_pos_list)
    for j=1:length(y_pos_list)

        x_e = [x_pos_list(i); y_pos_list(j)];
        p = exp(-0.5*transpose(x_e - x_i)*inv(Sigma)*(x_e - x_i)) / sqrt(abs(det(Sigma)) * (2*pi)^2);
        p = p  / (1 + exp(-a * transpose(x_i_dot) * (x_e - x_i)));
        P(i,j) = p;
    end
end

[X,Y] = meshgrid(x_pos_list, y_pos_list);
figure(2); clf;
pcolor(X,Y,P); shading interp







