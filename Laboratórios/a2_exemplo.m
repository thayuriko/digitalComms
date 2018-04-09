%Exemplo Antipodal

close all
clear all
clc

Fs=100;
Ts=1;

bit1=ones(1,Fs);
bit0=-ones(1,Fs);
y=[bit1 bit0 bit1 bit0 bit1];
t=0:1/Fs:5-1/Fs;

plot(t,y)
xlabel('tempo (s)');
axis([0 5 -2 2])

figure

h=[ones(1,Fs)];
t=0:1/Fs:1-1/Fs;
plot(t,h);
xlabel('tempo (s)');
ylabel('h(t)');
axis([0 1 0 1.2])

figure

r=conv(y,h)/Fs;
fim=length(r);
t=0:1/Fs:fim/Fs-1/Fs;
plot(t,r);
t_amostra=[Fs 2*Fs 3*Fs 4*Fs 5*Fs];
r_amostra=r(t_amostra);
t_amostra=t_amostra/Fs-1/Fs;
hold
stem(t_amostra,r_amostra,'r')
xlabel('tempo (s)');
legend('Sa?da do Filtro','Sa?da Amostrada');
axis([0 5 -2 2])


figure
fim=length(y);
ruido=randn(1,fim)*sqrt(20);
y=y+ruido;

t=0:1/Fs:5-1/Fs;
plot(t,y)
xlabel('tempo (s)');
axis([0 5 -12 12])

figure
r=conv(y,h)/Fs;
fim=length(r);
t=0:1/Fs:fim/Fs-1/Fs;
plot(t,r);
t_amostra=[Fs 2*Fs 3*Fs 4*Fs 5*Fs];
r_amostra=r(t_amostra);
t_amostra=t_amostra/Fs-1/Fs;
hold
stem(t_amostra,r_amostra,'r')
xlabel('tempo (s)');
legend('Sa?da do Filtro','Sa?da Amostrada');


