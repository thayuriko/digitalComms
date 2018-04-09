close all
clear all
clc

rand('seed',12345);
randn('seed',67890);

%Parâmetros do pulso raiz de cosseno levantado
fim=4;
T=1;
Fs=20;
alfa=1;
s=rcosfir(alfa,fim,Fs,T,'sqrt');

%Geração dos símbolos a serem transmitidos
tam=1000;
a=rand(1,tam)>0.5;
x=2*a-1;
x=upsample(x,Fs);
y=conv(x,s);

%Gráfico do sinal transmitido
t_y=-fim:1/Fs:((tam+fim)-1/Fs);
figure
plot(t_y,y)
xlabel('tempo (s)');
legend('Sinal Transmitido')

%Canal AWNG
Eb=1;
EbN0dB=10000;
EbN0=10.^(EbN0dB/10);
N0=Eb/EbN0;
ruido=randn(1,length(y))*sqrt(N0);
y=y+ruido;

%Filtragem casada
r=conv(y,s);

%Gráfico do sinal na saída do filtro casado
t_r=-2*fim:1/Fs:((tam+2*fim)-1/Fs);
figure
plot(t_r,r,'k:');
legend('Sinal Recebido')
xlabel('tempo (s)');

%Erro de sincronismo na saída do filtro casado (em segundos seria a
%equivalente a erro*T/Fs) e tempo de amostragem na saída do filtro levando
%em conta o erro. Note que este erro na verdade se dá pelo fato de que o
%receptor não sabe o tempo correto e supõe que um certo tempo de amostra é
%o correto. O erro é a diferença entre o tempo suposto pelo receptor e o
%tempo real.
erro=-5; 
t_amostra=(2*fim:tam+2*fim-1)*Fs+1+erro;

%Parâmetros do algoritmo early-late detection
mu=2;
delta=1;

%Algoritmo
tau=zeros(1,tam);
for a=1:tam
    amostra(a)=r(t_amostra(a)+round(tau(a)));
    amostra_early(a)=r(t_amostra(a)+round(tau(a))-delta);
    amostra_late(a)=r(t_amostra(a)+round(tau(a))+delta); 
    dif(a)=amostra_late(a)-amostra_early(a);
    tau(a+1)=tau(a)+mu*(dif(a).*amostra(a));
  end
tau=tau(1:tam);
t_amostra_novo=(t_amostra+round(tau));

%Gráfico do sinal amostrado
hold
t_amostra_novo=(t_amostra+round(tau));
plot(t_amostra_novo/Fs-1/Fs-2*fim,r(t_amostra_novo),'ro')
t_amostra=t_amostra-erro;
plot(t_amostra/Fs-1/Fs-2*fim,r(t_amostra),'bx')
xlabel('tempo (s)');
legend('Saída do Filtro','Amostra ELD','Amostra Exata');
axis tight
xlim([0 100])

%Gráfico do tau
figure
plot(round(tau)/Fs)
xlabel('tempo (s)');
ylabel('\tau');

