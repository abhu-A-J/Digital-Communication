freq=1;
t=0:0.01:1;
N=length(t);
arg=2*pi*freq*t;
y=sin(arg);
subplot(3,1,1);
plot(t,y);
title('Signal Waveform');
m=0:1:100;
ts=5;
for i=0:1:100;
    if(mod(i,ts)~=0)
    rec(i+1)=1;
   else
    rec(i+1)=0;
  end
end

subplot(3,1,2);
stem(m,rec);
title('Rectangular Pulses');
axis([0,100,0,2]);
out=y.*rec;

subplot(3,1,3);
stairs(m,out);
title('Non Ideal Sampling');
axis([0,100,-2,2]);
