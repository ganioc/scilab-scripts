// interp-sidex
// Deomnstration of the use of FFT cross-correlation to compute the impulse
// response of a filter given its input and output.
// This is called FIR System Identification

Nx = 32;                // input signal length
Nh = 10;                // filter length 
Ny = Nx + Nh - 1;
// max output signal length
// FFT size to accomodate cross-correlation:
Nfft = 2^nextpow2(Nx + Ny -1); // FFT wants power of 2

disp('Nfft length:', Nfft);

x = rand(1, Nx);   // input signal = noise, random signal
// x = 1:Nx;
h = [1:Nh];        // the filter
xzp = [x,zeros(1, Nfft - Nx)];  // zero-padded input
yzp = filter(h,1,xzp);          // apply the filter, get y

X = fft(xzp);      // input spectrum
Y = fft(yzp);      // output spectrum
Rxx = conj(X) .* X; // energy spectrum of x
Rxy = conj(X) .* Y; // cross-energy spectrum of xy
Hxy = Rxy ./ Rxx;   // should be the freq. response
disp('Hxy:', Hxy);
hxy = ifft(Hxy);    // should be the impulse response

disp('hxy:', hxy);          // print estimated impulse response
//matlab code
// freqz(hxy, 1, Nfft); // hxy, 1, 是滤波器的传递函数系数,[h,w]= freqz
// h ,n 点频率响应向量, w, 对应的角频率向量

err = norm(hxy - [h,zeros(1, Nfft - Nh)])/norm(h);
disp(sprintf('Impulse Response Error = %0.14f%%',100*err));
