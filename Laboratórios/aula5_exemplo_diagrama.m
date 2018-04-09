close all
clear all

%Par�metros pulso raiz de cosseno levantado. Variar o alfa gera bastante diferen�a.
Ts=1;
fim=5;
Fs=10;
alfa=0.5;
Nb=1000;

%Gera��o de uma sequencia PAM com pulsos raiz de cosseno levantado. Filtro casado raiz de cosseno levantado. 
%Sinal recebido com pouco e muito ru�do.
u=rand(1,Nb)>0.5;
u=2*u-1;
u=upsample(u,Fs);
p=rcosfir(alfa,fim,Fs,Ts,'sqrt'); 
x=conv(u,p);
y=conv(x,p);

%Sa�da do filtro casado com pouco e muito ru�do
y1=y+randn(size(y))*0.01; %pouco ru�do
y2=y+randn(size(y))*0.2; %muito ru�do

%Diferentes recortes no sinal para construir os diagramas de olho sem
%ru�do, com pouco ru�do, com muito ru�do e com erro de sincronismo
z1=y(4*fim*Fs+1:1:length(y)-4*fim*Fs+1);
z2=y1(4*fim*Fs+1:1:length(y)-4*fim*Fs+1);
z3=y2(4*fim*Fs+1:1:length(y)-4*fim*Fs+1);
z4=y2(4*fim*Fs+3:1:length(y)-4*fim*Fs+3);

%Gr�ficos dos diagramas de olho
eyediagram(z1,Fs)
xlabel('Per�odo de S�mbolo')
eyediagram(z2,Fs)
xlabel('Per�odo de S�mbolo')
eyediagram(z3,Fs)
xlabel('Per�odo de S�mbolo')
eyediagram(z4,Fs)
xlabel('Per�odo de S�mbolo')