// Example: practical display of the FFT of a synthesized sinusoid

fs = 44100; // Sampling rate, CD音质
f= 440;     // Sinusoidal frequency = A-440
nper = 10;  // Number of periods to synthesize
dur = nper/f;     // Duration in seconds
T = 1/fs;         // Sampling period
t = 0:T:dur;      // Discrete-time axis in seconds
L = length(t)     // Number of samples to synthesize
ZP = 5;           // Zero padding factor (for spectral interpolation)
N = 2^(nextpow2(L*ZP));; // FFT size (power of 2)
printf('N: %d\n', N);
// t 是变量
x = cos(2*%pi*f*t);  // A sinusoid at A-440
wkr = window('kr',L,8);    // FFT windows
w = wkr;
xw = x .* w;
playsnd(xw, fs); // Might as well listen to it, 有声音
xzp=[xw,zeros(1,N-L)]; // Zero-padded FFT input buffer
// disp('xw length:', length(xw));
printf('xw length: %d\n', length(xw));
// disp(length(xzp));

X = fft(xzp);   // Spectrum os xw, interpolated by factor ZP

Xmag = abs(X);  // Spectral magnitude
Xdb  = 20*log10(Xmag); // Spectral magnitude in dB
XdbMax = max(Xdb);
Xdbn = Xdb - XdbMax;   // Normalize to 0dB Peak

dBmin = -100;           // Don't show anything lower than this
Xdbp = max(Xdbn, dBmin); // Normalized, clipped, dB magnitude spectrum
fmaxp = 2*f;             // Upper frequency limit, in Hz
kmaxp = fmaxp*N/fs;      // Upper frequency limit  in bins
fp = fs*[0:kmaxp]/N;     // Frequency axis in Hz

// Ok, to plot it already
subplot(211);
plot(1000*t, xw);
xlabel('Time(ms)');
ylabel('Amplitude');
title(sprintf('%d peroids of a %3.0f Hz Sinusoid, Kaiser Windowed', nper,f));

subplot(212);
plot(fp,Xdbp(1:kmaxp+1));
xgrid;
// Plot a dashed line where the peak should be
plot([440 440], [dBmin, 0], '--');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
title(sprintf(['b) Interpolated FFT of %d Peroids of %3.0f Hz Sinusoid'], nper,f));





