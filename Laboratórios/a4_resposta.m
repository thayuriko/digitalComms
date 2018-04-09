clear all; close all; clc;

N_T = 5; T = 1; RATE = 10; delta = T/RATE;

%R = 0:0.25:1;
%legendCell = cell(length(R), 1);

run 'subscripts/a4_ativ1.m'

run 'subscripts/a4_ativ2.m'