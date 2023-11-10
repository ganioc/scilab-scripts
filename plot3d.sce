
a=linspace(-8, 8, 41)';
b = linspace(-8, 8, 41)';
[xx,yy] = meshgrid(a,b);

c = sqrt(xx.^2+ yy.^2);
plot3d1(a,b,c);
