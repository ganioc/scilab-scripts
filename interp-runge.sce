// Define Runge function
deff('[y]=f(x)', 'y=1 ./(1 + x.^2)');

// Interpolation points
xi = linspace(-5, 5, 7)';
yi = f(xi);

// Data
xrunge = linspace(-5 , 5, 101)';
yrunge = f(xrunge);



// Plot Runge function
plot(xrunge, yrunge, 'b-');
plot(xi, yi, 'or');

xlabel('x');
ylabel('y');
title('Runge function');
