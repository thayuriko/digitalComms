clear all; close all; clc;
set(0,'DefaultFigureWindowStyle','docked')

%Veja o help da função rcosfir para compreender os parâmetros a seguir
fim = 5;
T = 1;
f = 10;
delta = T/f;
alfa = 0;

h = rcosfir(alfa, fim, f, T, 'sqrt');
figure
plot(h)
eixo = -fim*T:delta:fim*T;
plot(eixo, h)
xlabel('tempo (intervalo de símbolo)')
legend('\alpha = 0.5');
grid

bits = [1 0 0 1 0]
s = 2*bits - 1;
s_up = upsample(s, f);
x = conv(s_up, h);
figure
eixo = -fim*T:delta:(fim + (length(bits) - 1) + (1 - 1/f))*T;
plot(eixo, x, 'r');
grid
xlabel('tempo (intervalo de símbolo)')
title('Sinal transmitido')
xlim([-3 8])


%% Resposta em Frequencia Usando a Expressão Exata da Transformada de Fourier (pode ser feito via FFT a partir do pulso no tempo também)
conta = 0;
W = 1;
f1 = (1-alfa)*W;

for ff = -2*(2*W-f1):0.01:-(2*W-f1)-0.01
    conta = conta+1;
    H(conta) = 0;
    f(conta) = ff;
end 
for ff = -(2*W-f1):0.01:-f1-0.01
    conta = conta+1;
    H(conta) = (1/(4*W))*(1+cos(pi/(2*W*alfa)*(abs(ff)-W*(1-alfa))));
    f(conta) = ff;
end    
for ff = -f1:0.01:f1
    conta = conta+1;
    H(conta) = 1/(2*W);
    f(conta) = ff;
end
for ff = f1+0.01:0.01:(2*W-f1)
    conta = conta+1;
    H(conta) = (1/(4*W))*(1+cos(pi/(2*W*alfa)*(abs(ff)-W*(1-alfa))));
    f(conta) = ff;
end    
for ff = (2*W-f1)+0.01:0.01:2*(2*W-f1)
    conta = conta+1;
    H(conta) = 0;
    f(conta) = ff;
end 

figure
plot(f, 2*W*H)
axis([-3 3 0 1.1])
grid
legend('\alpha = 0.5');
xlabel('\times R/2 (Hz)');
ylabel('H(f)');