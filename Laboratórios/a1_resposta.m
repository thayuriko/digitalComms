close all; clear all; clc;

Np=100; nMax=30; Fs=100;

%rnd = randi([2,nMax]);
%cond = mod(rnd,2) == 0; n = cond*rnd + ~cond*(rnd-1);

n = 2000;
%run a1_exemplo.m; close all; clc;

%% Gerar sinal aleat�rio

%run subscripts/a1_aleatorio.m
%% Decodifica��o

%run subscripts/a1_decodificado.m
%% BER

%run subscripts/a1_ber.m
%% Plots

%run subscripts/a1_plots.m
run subscripts/a1_ber.m
