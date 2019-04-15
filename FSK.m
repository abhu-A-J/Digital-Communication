function FSK(input)
ts=50;
N=length(input);
for i=1:N
    if(input(i)==0)
        input(i)=-1;
    end
end
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
subplot(4,1,1);
stairs(a,pulse);
xlabel('Time');
ylabel('Amplitude');
title('Data Pulse');
axis([0 length(pulse) -2 2]);

%sin 1 of freq=2
amp=2;
fc1=2;
t=0:0.1:((N*ts)-1)/10;;
y1=amp*sin(2*pi*fc1*t);
sinL=length(y1);
subplot(4,1,2);
plot(t,y1);
xlabel('Time');
ylabel('Amplitude');
title('Carrier 1');

% sin2 of freq =4
amp=2;
fc2=4;
t=0:0.1:((N*ts)-1)/10;
y2=amp*sin(2*pi*fc2*t);
sinL=length(y2);
subplot(4,1,3);
plot(t,y2);
xlabel('Time');
ylabel('Amplitude');
title('Carrier 2');

for i=1:1:pulseL
    if(pulse(i)==1)
        pulse(i)=y1(i);
    end
end
for i=1:1:pulseL
    if( pulse(i)==-1)
        pulse(i)=y2(i);
    end
end
subplot(4,1,4);
plot(a,pulse);
xlabel('Time');
ylabel('Amplitude');
title('Modulated Wave');
end





