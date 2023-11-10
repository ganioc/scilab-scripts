
x=linspace(-2*%pi, 2*%pi, 1000);

subplot(2,2,1);
plot(x,sin(x), 'r*');

subplot(2,2, 2);
plot(x,  sin(x)+sin(2.*x), 'b*');

subplot(2,2,3);
plot(x, sin(x) + sin(3.*x), 'g*');

subplot(2,2,4);
plot(x, sin(x) + sin(4.*x), 'k*');
