// exam-padding

Fs = 1e3;
t = [0:0.001:(1-0.001)];
x = cos(2*%pi * 100 * t) + sin(2*%pi * 202.5*t);
L = length(t);

printf('t length: %d\n', length(t));
printf('x length: %d\n', length(x));

// 获取信号的DFT, DFT bin的间距为1Hz, 响应地，100Hz正弦波对应到一个DFT bin, 
// 然而202.5Hz正弦波无法对应到一个bin
// 由于信号是实数值信号，此处只用DFT的正频率来估计振幅。 按输入信号的长度
// 缩放DFT, 并将0和奈奎斯特之外的所有频率乘以2.
// 绘制结果与已知振幅进行比较。

xdft = fft(x);
printf('fft length: %d\n', length(xdft));

xdft = xdft(1:length(x)/2 + 1);
xdft = xdft/length(x);
printf('xdft length:%d\n', length(xdft));

xdft(2:$-1) = 2*xdft(2:$-1);

freq = 0:Fs/length(x):Fs/2;

subplot(121);
plot(freq, abs(xdft));
plot(freq, ones(length(x)/2 + 1, 1), 'r-', 'LineWidth', 2);
xlabel('Hz');
ylabel('Amplitude');

// 可以通过填零对DFT插值, 填零可以获得可分辨信号分量的更精确的振幅估计
// 填零并不能提高DFT的频谱(频率)分辨率，分辨率由采样点数量和采样率决定。
// 将DFT的长度填充到2000,即原始长度的两倍。此时, DFT bin的间距是0.5Hz
// 此时，220.5 Hz的能量正好落入一个DFT bin, 

lpad = 2* length(x);
xdft = mtlb_fft(x,lpad);
xdft = xdft(1:lpad/2 +1);
xdft = xdft/length(x);
xdft(2:$-1) = 2*xdft(2:$-1);
freq = 0:Fs/lpad:Fs/2;

subplot(122);
plot(freq, abs(xdft));
plot(freq, ones(2*length(x)/2 + 1), 'r-', 'LineWidth', 2);
xlabel('Hz');
ylabel('Amplitude');
