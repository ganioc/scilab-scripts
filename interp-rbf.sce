
deff('[y]=rbf_gauss(r,sigma)', 'y = exp(-r.^2 ./(2*sigma))');

r = linspace(0,3);

y1 = rbf_gauss(r, 0.1);
y2 = rbf_gauss(r, 1.0);
y3 = rbf_gauss(r, 2.0);

plot(r, y1, 'k-');
plot(r, y2, 'b-');
plot(r, y3, 'r-');
