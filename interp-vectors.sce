// for mathematics DFT

x=[2 3];
origin = [0,0];
xcoords=[origin(1), x(1)];
ycoords=[origin(2), x(2)];

// plot(xcoords, ycoords);
m_mean=mean(x);
disp(m_mean);

// total energy
// x*x'

// compute an orthonormal basis for a given set of vectors, which span
// the space
v1=[1;2;3];
v2=[1;-2;3];
disp('v1*v2', v1'*v2)
V=[v1,v2];
disp('V is:', V);
// orthanal basis,
W=orth(V);
disp('w is');
disp(W);

// 不行啊, 其实没有做什么

