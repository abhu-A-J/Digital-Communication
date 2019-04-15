freq=1;
t1=0:0.01:10;%1001 values
t1L=length(t1);
arg=2*pi*freq*t1;
y1=2*sin(arg);%1001 values
subplot(3,1,1);
plot(t1,y1);
title('Signal Waveform');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ts=0.1;
tsL=length([0:ts:100]);%1001 values
for i=0:1:tsL-1
    if(mod(i,ts)==0)
        imp(i+1)=1;
    else
        imp(i+1)=0;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%
out=y1.*imp;
x=0:1:1000;
subplot(3,1,2);
stem(x,out);
axis([0,1000,-2,2]);
title('Ideally Sampled Output');
%%%%%%%%%%%%%%%%%%%%%%%%%%
out1=zeros(1,1001);
for j=0:1000
    out1(j+1)=round(out(j+1));
end
subplot(3,1,3);
stem(x,out1);
title('Quantized Output-First 100 Samples');
axis([0,100,-2,2]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

