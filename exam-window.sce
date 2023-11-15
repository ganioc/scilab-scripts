// window function demo

N = 24

wkr = window('kr', N, 6); // Hamming Kaiser Window

x=[1:N];
y=wkr;

// plot((1:N)', [wkr]');
subplot(121);
plot(x,y,'r-');

subplot(122);
n=256;
//plot the magnitude of the frequency responses
[Wkr, fr] = frmag(wkr,n);
plot(fr',20*log10([Wkr]'));
