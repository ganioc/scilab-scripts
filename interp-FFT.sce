// FFT

N= 1024*2^1;       // FFT much faster at this length
t = 0:N-1;       
h=exp(-t);     // filter impluse response, sampled exponential
H = fft(h,-1); // filter frequency response
x = ones(1,N); // input = dc (any example will do)
t0 = clock();    // gregorian time
y = conv(x,h);
t1 = etime(clock(),t0);
disp('Direct conv t1:', t1);

t0 = clock();
y = ifft(fft(x).* H);
t2 = etime(clock(),t0);
disp('using FFT: t2:', t2);
