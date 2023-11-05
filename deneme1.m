x_i_dot = [1,0];

mu = [1 1];
Sigma = [1 0; 0 2];
[X,Y] = meshgrid(-2:.1:4);
p = mvnpdf([X(:) Y(:)],mu,Sigma);
p = reshape(p,size(X));
pcolor(X,Y,p),shading interp