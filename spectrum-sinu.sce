// spectrum-sinu

// FFT of a DFT sinusoid

// parameters
N = 64;
T = 1;
f = 0.25;        // Sinusoidal frequency in cycles per sample
A = 1;           // Sinusoidal amplitude
phi = 0;         // Sinusoidal phase
n = [0:N-1];
x = cos(2*%pi*n*f*T);    // signal to analyze
X = fft(x);             // spectrum

// plot the time data
figure(1);
subplot(3,1,1);
plot(n,x,'r*');

ni = [0:0.1:N-1];       // Interpolated time axis
plot(ni, cos(2*%pi*ni*f*T), '-');
title('Sinusoid Sampled at 1/4 the Sampling Rate');
xlabel('Time(Samples)');
ylabel('Amplitude');
xstring(1,0,"a)");

// Plot the spectrum magnitude
magX = abs(X);
fn = [0:1.0/N:1-1.0/N];  // Normalized frequency axis
subplot(3,1,2);
plot2d3(fn, magX);
xlabel('Normalized Frequency (cycles per sample)');
ylabel('Magnitude (Linear)');
xstring(1,0,"b)");

// Samething on a dB Scale
spect = 20*log10(magX); // spectral magnitude in dB
subplot(3,1,3);
plot(fn, spect);
mtlb_axis([0 1 -350 50]);
xlabel('Normalized Frequency (cycles per sample)');
ylabel('Manitude (dB)');
xstring(1,0,"c)");
print('-deps');

