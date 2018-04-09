close all
clear all

%Parâmetros pulso raiz cosseno levantado. TX usa raiz de cosseno levantado e filtro
%casado é outro raiz de cosseno levantado
Ts=1;
fim=5;
Fs=10;
Nb=1000;
alfa=0.5;
p=rcosfir(alfa,fim,Fs,Ts,'sqrt');


%Resposta em frequencia e resposta do canal quando é transmitido um pulso
%raiz de cosseno levantado e o filtro casado usa outro pulso raiz de
%cosseno levantado.
c2=0.1; 
c1=-0.3;
c0=0.8;
c=[c2 c1 c0 c1 c2];
freqz(c)

figure
t=-2*fim*Ts:1/Fs:(2*fim+length(c))*Ts-1/Fs;
temp=conv(p,upsample(c,Fs));
temp=conv(temp,p);
plot(t,temp)
t_amostra=[-2*fim:2*fim+length(c)-1]
temp_amostra=temp(1:Fs:(2*fim+2*fim+length(c))*Fs)
hold
stem(t_amostra,temp_amostra,'r','Linewidth',2)
legend('saída do filtro','saída amostrada')

%Geração de sinal PAM transmitido com pulsos raiz de cosseno levantado 
%passando pelo canal. Filtro casado é outro raiz de cosseno levantado 

u=rand(1,Nb)>0.5;
u=2*u-1;
u=upsample(u,Fs);
x=conv(u,p);
x=x+randn(size(x))*0.02;
q=conv(x,p);
c_up=upsample(c,Fs);
r=conv(x,c_up);
y=conv(r,p);

%Definição do equalizador e processo de equalização
w=[c0 c1 c2;
   c1 c0 c1;
   c2 c1 c0];
h=inv(w)*[0; 1; 0]
h_up=upsample(h,Fs);
z=conv(y,h_up);

%Recortes dos sinais para diagramas de olho
x1=q(4*fim*Fs+1:1:length(q)-4*fim*Fs+1);
y1=y(4*fim*Fs+1:1:length(y)-4*fim*Fs+1);
z1=z(4*fim*Fs+1:1:length(z)-4*fim*Fs+1);

eyediagram(x1,Fs)
xlabel('Período de Símbolo')
eyediagram(y1,Fs)
xlabel('Período de Símbolo')
eyediagram(z1,Fs)
xlabel('Período de Símbolo')

%Constelacoes recebida canal plano, recebida canal seletivo e equalizada (QPSK)
u=ceil(rand(1,Nb)*4);
const=[-1 1 j -j];
x=const(u)+0.02*randn(1,length(u))+j*0.02*randn(1,length(u));
y=conv(x,c);
z=conv(y,h);


scatterplot(x)
scatterplot(y(20:length(y)))
scatterplot(z(20:length(z)-20))

