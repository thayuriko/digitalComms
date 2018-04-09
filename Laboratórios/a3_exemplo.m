%Neste exemplo N0 é mantido fixo e a amplitude dos símbolos varia em função de
%Eb/N0. Outra alternativa é manter a amplitude dos símbolos fixa e variar
%N0 em função de Eb/N0.

%A resposta ao impulso do filtro casado é considerada de energia unitária
%(EMF=1)
%Os símbolos 's' são gerados originalmente como +1 e -1, com energia
%unitária portanto, e sua amplitude é variada de acordo com o valor de Eb necessário para obter a razão Eb/N0 pretendida.

%A simulação é discreta, a partir dos símbolos a serem transmitidos (s)
%geramos a saída amostrada do filtro casado (y).

close all;
clear all;

rand('state',0);
randn('state',0);

bits=1e6; %Número de bits a serem simulados.

M=2; %2-PAM, dois símbolos possíveis na modulação.

b=rand(1,bits)>0.5; %Geração de bits 0 e 1 equiprováveis.
s=2*b-1; %Eb a princípio seria 1, já que as amplitudes são +1 e -1. Es também seria 1, já que a modulação é binária (1 bit -> 1 símbolo).
N0=1; %N0 será fixa em 1.
n=randn(1,bits)*sqrt(N0/2); %EMF foi suposto como 1, portanto a variância do ruído após o filtro casado é N0/2 apenas.

EbN0dB=0; %Valor de Eb/N0 a ser considerado na simulação.
EbN0=10^(EbN0dB/10); %Eb/N0 em escala linear.
Eb=EbN0*N0; %Eb requerido para atingir a razão Eb/N0 de interesse.
Es=Eb*log2(M); %Es calculado a partir de Eb. Como a modulação é binária Es=Eb.

y=sqrt(Es)*s+n; %A amplitude dos símbolos transmitidos é alterada de modo que a energia média seja Es, e consequentemente Eb seja aquela desejada.

b_est=y>0; %Decisor.
erros=sum(b~=b_est); %Contagem de erros.
ber=erros/bits; %Cálculo da BER.
Pb=qfunc(sqrt(2*EbN0)); %BER teórica.

fprintf('Simulado: %g | Teórico: %g\n', ber, Pb)

