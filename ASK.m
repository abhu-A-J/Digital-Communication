function ASK(input)
ts=50;
N=length(input);
pulse=zeros(1,N*ts);
start=1;
ending=ts;
for i=1:N
    for j=start:1:ending
        pulse(j)=input(i);
    end
    start=start+ts;
    ending=ending+ts;
end
pulseL=length(pulse);


a=0:pulseL-1;
subplot(3,1,1);
stairs(a,pulse);
xlabel('Time');
ylabel('Amplitude');
title('Data Pulse');
axis([0 length(pulse) 0 2]);

% generation of sine
amp=2;
fc=2;
t=0:0.1:((N*ts)-1)/10;;
y=amp*sin(2*pi*fc*t);
sinL=length(y);
subplot(3,1,2);
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Wave');

out=pulse.*y;
subplot(3,1,3);
plot(t,out);
xlabel('Time');
ylabel('Amplitude');
title('Modulated Wave');
