
subplot(2,2,1);
z = rand(10,10);
surf(z);
title('surf');

subplot(2,2,2);
surf(z,'facecol', 'red', 'edgecol', 'blu');

subplot(2,2,3);
surf(z, 'facecol', 'interp');

subplot(2,2,4);
x=rand(10,10);
y=rand(10,10);
z=rand(10,10);
surf(z,'facecol', 'red', 'edgecol', 'blu');

