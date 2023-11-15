
// Define Runge function
deff('[y]=f(x)', 'y=1 ./(1 + x.^2)');

// Interpolation points
xi = linspace(-5, 5, 7)';
yi = f(xi);

//d = splin(xi, yi, "not_a_knot");
//d = splin(xi, yi, "natural");
d = splin(xi, yi, "periodic");

// Evaluation points
xval = linspace(-6, 6, 101)';
xx_s = xval;
yy_s = interp(xx_s, xi,yi,d, "linear");

plot(xi,yi,'or');
plot(xx_s,yy_s,'b-');

