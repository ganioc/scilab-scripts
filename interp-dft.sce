// dft from Book

N=8;
fs=1;

// row
n=[0:N-1];
// interpolated
t=[0:0.01:N];
disp('n:', n);
k=mtlb_fliplr(n)'-N/2
disp('k orig:', mtlb_fliplr(n));
disp('k:',k);
fk= k*fs/N;
wk=2*%pi*fk;

for i=1:N
disp('i:',i);
subplot(N,2,i*2-1);
plot(t,cos(wk(i)*t));
mtlb_axis([0,N,-1,1]);
plot(n,cos(wk(i)*n),'*');

if i==1
    title('Real Part');
end
ylabel(sprintf('k=%d',k(i)));

xlabel('Time (samples)');

// 2nd columnt

subplot(N,2,i*2);
plot(t,sin(wk(i)*t));
mtlb_axis([0,8,-1,1]);
plot(n,sin(wk(i)*n),'*');

if i==1
    title('Imaginary Part');
end

ylabel(sprintf('k=%d',k(i)));

xlabel('Time (Samples)');

end;
