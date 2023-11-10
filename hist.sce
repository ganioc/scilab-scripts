// program to plot histogram

n = rand(1, 10e4, 'normal');

bins = 20;

histplot(bins,n);
title('Histogram plotting random numbers');
