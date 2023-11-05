function mat = gauss2d(mat, sigma, center)
gsize = size(mat);
[x,y] = ndgrid(1:gsize(1), 1:gsize(2));
xc = center(1);
yc = center(2);
exponent = ((x-xc).^2 + (y-yc).^2)./(2*sigma);
mat       = (exp(-exponent));