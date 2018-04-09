close all; clear all; clc;

Np=30; Fs=100;

%nMax=30;
%rnd = randi([2,nMax]);
%cond = mod(rnd,2) == 0; n = cond*rnd + ~cond*(rnd-1);

%run a2_exemplo.m; close all; clc;

%% Gráficos (numero pequeno de bits)
%{
n = 5;

% Gerar sinal aleatório
run subscripts/a2_aleatorio.m

% Decodificação
run subscripts/a2_filtrado.m

% Plot
run subscripts/a2_plots.m

pause
%}
%% BER (numero grande de bits)
n = 2000;
%%{
run subscripts/a2_ber.m
%}