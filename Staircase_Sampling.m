freq=1;
t=0:0.01:1;
N=length(t);
arg=2*pi*freq*t;
y=sin(arg);
figure(1);
plot(t,y);
ts=5;
m=0:1:100;
for i=0:1:100;
    if(mod(i,ts)~=0)
    rec(i+1)=1;
   else
    rec(i+1)=0;
  end
end
figure(2);
stem(m,rec)
axis([0,100,0,2]);
out=y.*rec;
for i=1:ts:length(out)-ts
    for k=i+1:i+ts-1
        out(k)=out(i+1);
    end
end
for j=1:length(out)
    if (mod(j,ts)==0)
        out(j+1)=out(j);
    end
end

figure(3);
stairs(m,out);
axis([0,100,-2,2]);
