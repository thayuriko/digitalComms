close all; clear all; clc;

Fs = 100; n = 2000;
B = Fs/2; %largura de faixa do filtro PB

run subscripts/a2_desafio_sinal.m
run subscripts/a2_desafio_ber.m

%{
Nota-se, portanto, que para um mesmo sinal, o filtro PB possui uma taxa de
erro de bit pior do que o filtro casado, sendo que a largura da faixa do
filtro PB aparenta incluenciar apenas para potências de ruído baixas,
possuindo o mesmo comportamento para potências mais elevadas.
%}