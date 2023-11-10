deff('y=f(x,t)','y=t*sin(x)+sin(2*x)+sin(4*x)');

x = linspace(-4*%pi, 4*%pi, 10e3);
t = 100;
time_speed = 0:0.05:1;

paramfplot2d(f,x,time_speed);
