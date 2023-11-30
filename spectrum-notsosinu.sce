// spectrum notso-sinu

// parameters
N = 64;
T = 1;
// f = 0.25;        // Sinusoidal frequency in cycles per sample
f = 0.25 + 0.5/N;  // move frequency off-center by half a bin

A = 1;           // Sinusoidal amplitude
phi = 0;         // Sinusoidal phase
n = [0:N-1];
x = cos(2*%pi*n*f*T);    // signal to analyze
X = fft(x);             // spectrum

// plot the time data
figure(1);
subplot(4,1,1);
plot(n,x,'r*');

ni = [0:0.1:N-1];       // Interpolated time axis
plot(ni, cos(2*%pi*ni*f*T), '-');
title('Sinusoid Sampled at 1/4 the Sampling Rate');
xlabel('Time(Samples)');
ylabel('Amplitude');
xstring(10,0,"a)");

// Plot the spectrum magnitude
magX = abs(X);
fn = [0:1.0/N:1-1.0/N];  // Normalized frequency axis
subplot(4,1,2);
plot2d3(fn, magX);
xlabel('Normalized Frequency (cycles per sample)');
ylabel('Magnitude (Linear)');
xstring(1,0,"b)");

// Samething on a dB Scale
spect = 20*log10(magX); // spectral magnitude in dB
subplot(4,1,3);
plot(fn, spect);
mtlb_axis([0 1 -5 50]);
xlabel('Normalized Frequency (cycles per sample)');
ylabel('Manitude (dB)');
xstring(1,0,"c)");

// plot the periodic extension ot the time-domain signal
subplot(4,1,4);
plot([x,x]);
title('Time Waveform Repeated Once');
xlabel('Time(Samples)');
ylabel('Amplitude');

figure(2);
zpf = 8;
x = [cos(2*%pi*n*f*T), zeros(1,(zpf-1)*N)]; // zero-padded FFT input data
X = fft(x);

// plot time data
subplot(3,1,1);
plot(x);
title('Zero-padded sampled sinusoid');
xlabel('Time (sampled)');
ylabel('Amplitude');
xstring(1,0,"a)");

// Plot spectral magnitude
magX = abs(X);
nfft = zpf*N; // spin number *zpf
fni = [0:1.0/nfft:1-1.0/nfft]; // normalized frequency axis
subplot(3,1,2);
plot(fni,magX, '-');
title('Interpolated Spectral Magnitude');
xlabel('Normalized Frequency');
ylabel('Magnitude (Linear)');
xstring(0.1,0,"b");

// Same thing on a dB scale
spec = 20*log10(magX);
spec = max(spec, -60*ones(1, length(spec))); // clip to -60dB
subplot(3,1,3);
plot(fni, spec, 'r-');
xgrid();
mtlb_axis([0 1 -60 50]);
title('Interpolated Spectral Magnitude (dB)');
xlabel('Normalized Frequency (cycles per  sample)');
ylabel('Magnitude (dB)');
xstring(0.1,2,'c');


figure(3);
// w = blackman(N)
w = .42 - .5*cos(2*%pi*(0:N-1)/(N-1)) + .08*cos(4*%pi*(0:N-1)/(N-1));
subplot(3,1,1);
plot(w,'*');
title('The Blackman Window');
xlabel('Time (Samples)');
ylabel('Amplitude');

// Show the window transform
xw = [w,zeros(1,(zpf-1)*N)]; // zero-padded window, col vector,
Xw = fft(xw);
spec = 20*log10(abs(Xw));  // spectral magnitude in dB
spec = spec - max(spec);   // normalize to 0 dB max
spec = max(spec, -100*ones(1,nfft)); // clip to -100 dB
subplot(3,1,2);
plot(fni, spec, '-');
mtlb_axis([0,1,-100,10]);
xgrid();
xlabel('Normalized frquency');
ylabel('Magnitude (dB)');


// Replot interpreting upper bin numbers as negative frequencies
nh = nfft/2;
specnf = [spec(nh+1:nfft),spec(1:nh)]; 
fninf = fni -0.5;
subplot(3,1,3);
plot(fninf, specnf, '-');
mtlb_axis([-0.5, 0.5,-100, 10]);
xgrid();
xlabel('Normalized Frequency');
ylabel('Magnitude (dB)');


// Use the Blackman window on the sinusoid data
xw = [w .* cos(2*%pi*n*f*T), zeros(1,(zpf-1)*N)]; // windowed, zero-padded
X = fft(xw);  // Smoothed,interpolated spectrum

//
figure(4);
subplot(2,1,1);
plot(xw);
title('Windowed zero-padded, sampled sinusoid');
xlabel('Time (samples)');
ylabel('Amplitude');

// plot the spectral magnitude in the best way
// spec = 10*log10(conj(X).*X); // magnitude in dB
spec = 20*log10(abs(X));
spec = max(spec, -60*ones(1,nfft));
subplot(2,1,2);
plot(fninf, fftshift(spec), '-');
mtlb_axis([-0.5 0.5 -60 40]);
xgrid();
title('Smoothed interpolated, spectral magnitude (dB)');
xlabel('Normalized Frequency (cycles per sample)');
ylabel('Magnitude (dB)');









