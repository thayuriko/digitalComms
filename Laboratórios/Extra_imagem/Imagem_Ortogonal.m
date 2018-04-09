clear all; clc; close all;
set(0,'DefaultFigureWindowStyle','docked')

[X, map] = imread('Sega-Rally.bmp');
figure
colormap(map)
image(X);
title(['Imagem original'])

b = reshape(X, 1, size(X, 1)*size(X, 2));
bits = length(b);
 
s = b*2-1;
N0 = 1;
M = 2;

randn('seed', 123456789);
n0 = randn(1, length(s))*sqrt(N0/2);
n1 = randn(1, length(s))*sqrt(N0/2);

EbN0dBini = 0;
passo = 2;
EbN0dBfim = 10

for EbN0dB = EbN0dBini:passo:EbN0dBfim
    EbN0 = 10^(EbN0dB/10); 
    Eb = EbN0*N0;
    Es = Eb*log2(M);
        
    y0 = sqrt(Es)*~s + n0;
    y1 = sqrt(Es)*s + n1;
    b_est = y1 > y0;
    
    erros = sum(b ~= b_est); 
    ber = erros/bits; 
    imagem_recebida = reshape(b_est, size(X, 1), size(X, 2));
    figure
    colormap(map)
    image(imagem_recebida);
    title(['E_b/N_0 =  ' num2str(EbN0dB) 'dB - BER =  ' num2str(ber)])
end

