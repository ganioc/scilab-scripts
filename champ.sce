x=linspace(-1,1,10);
y=linspace(-1,1,10);
[X,Y] = meshgrid(x,y);
fy=3.*Y;
fx=0.5.*X;
champ(x,y,fx',fy');

