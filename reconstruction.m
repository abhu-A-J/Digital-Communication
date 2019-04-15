freq=1;
t1=0:0.01:10;%1001 values
t1L=length(t1);
arg=2*pi*freq*t1;
y1=sin(arg);%1001 values
%subplot(3,3,1);
%plot(t1,y1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
freq=2;
t2=0:0.01:10;%1001 values
t2L=length(t2);
arg=2*pi*freq*t2;
y2=sin(arg);%1001 values
%subplot(3,3,2);
%plot(t2,y2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ts=0.1;
tsL=length([0:ts:100]);%1001 values
for i=0:1:tsL-1
    if(mod(i,ts)==0)
        imp(i+1)=1;
    else
        imp(i+1)=0;
    end
end
imp;%1001 values
a=0:ts:100;

stem(a,imp);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y=y1+y2;%1001 values
a=0:0.01:10;
subplot(3,1,1);
plot(a,y);
title('Signal Waveform');
out=y.*imp;%1001 values

a=0:ts:100;%1001 values
subplot(3,1,2);
stem(a,out);
title('Sampled Waveform');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=zeros(1,1001);
for k=0:1:1000
    for t=0:ts:100
        x=(2*pi*2*t)-(k*pi);
        m(k+1)=out(k+1)+(out(k+1)*sinc(x));
        
    end
end
a=0:0.01:10;
subplot(3,1,3)
plot(a,m);
title('Reconstructed Waveform');

        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

