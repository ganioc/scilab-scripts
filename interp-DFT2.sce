// interp drawing Matlab for Fig 7.3
// Parameters, sampling rate = 1
N=16;            // DFT length
k = N/4;         // bin where DFT filter is centered
wk = 2*%pi*k/N;  // Normalized radian center-frequency for DFT_k()
wStep = 2*%pi/N;
w = [0:wStep:(2*%pi - wStep)]; // DFT frequency grid

interp_m = 10;
N2 = interp_m*N;      // Denser grid showing arbitrary frequencies
w2Step = 2*%pi/N2;
w2 = [0:w2Step:(2*%pi - w2Step)]; // Extra dense frequency grid
X = (1 - exp(%i*(w2-wk)*N)) ./ (1 - exp(%i*(w2-wk)));
// disp('X:',X);
    // slightly offset to avoid divide by zero at wk
X(1+k*interp_m) = N; // fix divide-by-zero point, overwrite NaN

// Plot the spectral magnitude
magX = abs(X);
magXd = magX(1:interp_m:N2); // DFT frequencies only
subplot(2,1,1);
plot(w2, magX, '-');
plot(w, magXd,'*');
title('DFT Amplitude Response at k=N/4');
xlabel('Normalized Radian Frequency (radians per sample)');
ylabel('Magnitude (Linear)');
xstring(-1, 20, 'a)');
xstring(20,20, 'a2)');

// Same thing on a dB scale
magXdb = 20*log10(magX); // Spectral magnitude in dB
// Since the zeros go to minus infinity, clip at -60 dB
magXdb = max(magXdb, -60*ones(1, N2));
magXddb = magXdb(1:interp_m:N2); // DFT frequency only
subplot(2,1,2);
plot(w2, magXdb, '-');
plot(w,magXddb, '*');
xgrid();
xlabel('Normalized Radian Frequency (radians per sample)');
ylabel('Magnitude (dB)');
xstring(-1, 40, 'b)');



