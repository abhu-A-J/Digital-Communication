freq=1;
t=0:0.01:1;
N=length(t);
arg=2*pi*freq*t;
y=sin(arg);

subplot(3,1,1);
plot(t,y);
title('Signal')
ts=5;
m=0:1:100;
for i=0:1:100
    if(mod(i,ts)==0)
        imp(i+1)=1;
    else
        imp(i+1)=0;
    end
end

subplot(3,1,2);
stem(m,imp);
title('Impulse');
out=y.*imp;

subplot(3,1,3);
stem(m,out );
title('Ideally Sampled Wave');