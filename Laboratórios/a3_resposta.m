close all; clear all; clc;

rand('state', 0); randn('state', 0);

bits = 1e6; M = 2; N0 = 1;

run 'subscripts/a3_ber.m'
run 'subscripts/a3_plots.m'