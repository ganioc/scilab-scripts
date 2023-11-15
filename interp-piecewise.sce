// interp-piecewise

// Define Runge function
deff('[y]=f(x)', 'y=1 ./(1 + x.^2)');

// Interpolation points
xi = linspace(-5, 5, 7)';
yi = f(xi);


// Evaluation points
xval = linspace(-6, 6, 101)';

xx_c = xval;
// yy_c = interp1(xi,yi,xx_c, 'nearest', 'extrap');
yy_c = interp1(xi,yi,xx_c, 'linear', 'extrap');


plot(xi, yi, 'or');
plot(xx_c, yy_c, 'b-');

xlabel('x');
ylabel('y');
title('Piecewise interpolation');

