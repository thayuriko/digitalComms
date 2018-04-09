close all
clear all

%Parâmetros pulso raiz de cosseno levantado. Variar o alfa gera bastante diferença.
Ts=1;
fim=5;
Fs=10;
alfa=0.5;
Nb=1000;

%Geração de uma sequencia PAM com pulsos raiz de cosseno levantado. Filtro casado raiz de cosseno levantado. 
%Sinal recebido com pouco e muito ruído.
u=rand(1,Nb)>0.5;
u=2*u-1;
u=upsample(u,Fs);
p=rcosfir(alfa,fim,Fs,Ts,'sqrt'); 
x=conv(u,p);
y=conv(x,p);

%Saída do filtro casado com pouco e muito ruído
y1=y+randn(size(y))*0.01; %pouco ruído
y2=y+randn(size(y))*0.2; %muito ruído

%Diferentes recortes no sinal para construir os diagramas de olho sem
%ruído, com pouco ruído, com muito ruído e com erro de sincronismo
z1=y(4*fim*Fs+1:1:length(y)-4*fim*Fs+1);
z2=y1(4*fim*Fs+1:1:length(y)-4*fim*Fs+1);
z3=y2(4*fim*Fs+1:1:length(y)-4*fim*Fs+1);
z4=y2(4*fim*Fs+3:1:length(y)-4*fim*Fs+3);

%Gráficos dos diagramas de olho
eyediagram(z1,Fs)
xlabel('Período de Símbolo')
eyediagram(z2,Fs)
xlabel('Período de Símbolo')
eyediagram(z3,Fs)
xlabel('Período de Símbolo')
eyediagram(z4,Fs)
xlabel('Período de Símbolo')