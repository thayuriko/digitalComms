bit1=ones(1,Fs);
bit0=-ones(1,Fs);
y1=[bit1 bit0 bit1 bit0 bit1];
t=0:1/Fs:5-1/Fs;

figure
plot(t,y1)
xlabel('tempo (s)');
axis([0 5 -2 2])

figure
fim=length(y1);
ruido=randn(1,fim)*sqrt(Np);%Potencia do ruido=Np
y2=y1+ruido;

t=0:1/Fs:5-1/Fs;
plot(t,y2)
xlabel('tempo (s)');
axis([0 5 -10 10])

%Exemplo Ortogonal

bit1=ones(1,Fs);
bit0=[ones(1,Fs/2) -ones(1,Fs/2)];
y3=[bit1 bit0 bit1 bit0 bit1];
t=0:1/Fs:5-1/Fs;

figure(3)
plot(t,y3)
xlabel('tempo (s)');
axis([0 5 -2 2])

figure(4)
fim=length(y3);
ruido=randn(1,fim)*sqrt(Np); %Potencia do ruido=Np
y4=y3+ruido;

t=0:1/Fs:5-1/Fs;
plot(t,y4)
xlabel('tempo (s)');
axis([0 5 -10 10])