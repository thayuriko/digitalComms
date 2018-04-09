%Neste exemplo N0 � mantido fixo e a amplitude dos s�mbolos varia em fun��o de
%Eb/N0. Outra alternativa � manter a amplitude dos s�mbolos fixa e variar
%N0 em fun��o de Eb/N0.

%A resposta ao impulso do filtro casado � considerada de energia unit�ria
%(EMF=1)
%Os s�mbolos 's' s�o gerados originalmente como +1 e -1, com energia
%unit�ria portanto, e sua amplitude � variada de acordo com o valor de Eb necess�rio para obter a raz�o Eb/N0 pretendida.

%A simula��o � discreta, a partir dos s�mbolos a serem transmitidos (s)
%geramos a sa�da amostrada do filtro casado (y).

close all;
clear all;

rand('state',0);
randn('state',0);

bits=1e6; %N�mero de bits a serem simulados.

M=2; %2-PAM, dois s�mbolos poss�veis na modula��o.

b=rand(1,bits)>0.5; %Gera��o de bits 0 e 1 equiprov�veis.
s=2*b-1; %Eb a princ�pio seria 1, j� que as amplitudes s�o +1 e -1. Es tamb�m seria 1, j� que a modula��o � bin�ria (1 bit -> 1 s�mbolo).
N0=1; %N0 ser� fixa em 1.
n=randn(1,bits)*sqrt(N0/2); %EMF foi suposto como 1, portanto a vari�ncia do ru�do ap�s o filtro casado � N0/2 apenas.

EbN0dB=0; %Valor de Eb/N0 a ser considerado na simula��o.
EbN0=10^(EbN0dB/10); %Eb/N0 em escala linear.
Eb=EbN0*N0; %Eb requerido para atingir a raz�o Eb/N0 de interesse.
Es=Eb*log2(M); %Es calculado a partir de Eb. Como a modula��o � bin�ria Es=Eb.

y=sqrt(Es)*s+n; %A amplitude dos s�mbolos transmitidos � alterada de modo que a energia m�dia seja Es, e consequentemente Eb seja aquela desejada.

b_est=y>0; %Decisor.
erros=sum(b~=b_est); %Contagem de erros.
ber=erros/bits; %C�lculo da BER.
Pb=qfunc(sqrt(2*EbN0)); %BER te�rica.

fprintf('Simulado: %g | Te�rico: %g\n', ber, Pb)

