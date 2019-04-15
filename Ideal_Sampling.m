freq=1;
t=0:0.01:1;
N=length(t);
arg=2*pi*freq*t;
y=sin(arg);
figure(1);
plot(t,y);
ts=5;
m=0:1:100;
for i=0:1:100
    if(mod(i,ts)==0)
        imp(i+1)=1;
    else
        imp(i+1)=0;
    end
end
figure(2);
stem(m,imp);
out=y.*imp;
figure(3);
stem(m,out );