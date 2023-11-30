// hanning window
// w = blackman(

// practical spectrum analysis of a sinusoidal signal

// Analysis parameters
M = 31;  // Window length, 
N = 64;  // FFT length, zero padding around a factor of 2

// Signal parameters
wxT = 2*%pi/4;  // sinusoid freq in rad/sample,1/4 sampling rate
A   = 1;        // Sinusoid Amplitude
phix = 0;       // Sinusoid phase

// Compute the signal x
n = [0:N-1];
x = A * exp(%i*wxT*n + phix); // the complex sinusoid,[1,j,-1,-j,1,j,...]

// Compute the Hanning window:
nm = [0:M-1];   // time indices for window computation
w = (1/M) * (cos((%pi/M)*(nm - (M-1)/2))).^2; //raised cosine

wzp = [w, zeros(1, N-M)]; //zero-padding out to the length of x
xw = x .*wzp;             // apply the window w to the signal x

// Display real part of windowed signal and the Hanning window:
//plot(n, wzp, '-');
//plot(n,real(xw), '*');

// Compute the spectrum
Xw = fft(xw);              // FFT of windowed data
fn = [0:1.0/N:1-1.0/N];    // Normalized frequency axis
spec = 20*log10(abs(Xw));  // spectral magnitude in dB
// since the zeros goto minus infinity, clip at -100 dB
spec = max(spec, -100*ones(1,length(spec)));
phs = angle(Xw);           // spectral phase in radians
phsu = unwrap(phs);        // Unwrapped spectral phase,

Nzp = 16;          // zero-padding factor
Nfft = N*Nzp;         // increased FFT size
xwi = [xw, zeros(1, Nfft - N)];  // new zero-padded FFT buffer
Xwi = fft(xwi);       
fni = [0:1.0/Nfft:1.0-1.0/Nfft]; // Normalized frequency axis
speci = 20*log10(abs(Xwi));      // Interpolated spectral magnitude in dB
speci = max(speci, -100*ones(1,length(speci))); 
phsi  = angle(Xwi);              // Phase
phsiu = unwrap(phsi);            // Unwrapped phase

// Plot spectral magnitude
subplot(2,1,1);
plot(fn, abs(Xw), '*');
plot(fni, speci);
xlabel('Normalized Frequency (cycles per sample)');
ylabel('Magnitude (dB)');

subplot(2,1,2);
plot(fn,phs,'*');
plot(fni, phsi);
disp('asterisk');





























