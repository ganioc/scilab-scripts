x=linspace(-2,2,10);
y=linspace(-2,2,10);
[X,Y] = meshgrid(x,y);
fy=X.^3 - 2.*X.^2+4.*X-10;
fx=X.^3 + 2.*X.^2-4.*X+10;
champ1(x,y,fx',fy');

