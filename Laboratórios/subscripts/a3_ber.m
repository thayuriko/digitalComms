EbN0dB = [0:10];
ber_anti = zeros(1, length(EbN0dB));
Pb_anti = zeros(1, length(EbN0dB));
ber_orto = zeros(1, length(EbN0dB));
Pb_orto = zeros(1, length(EbN0dB));

b = rand(1, bits) > 0.5;
s = 2*b - 1;

n = randn(1, bits)*sqrt(N0/2);
n0 = randn(1, bits)*sqrt(N0/2);
n1 = randn(1, bits)*sqrt(N0/2);

for i=1:length(EbN0dB)  
    EbN0 = 10^(EbN0dB(i)/10);
    Eb = EbN0*N0;
    Es = Eb*log2(M);

    y_anti = sqrt(Es)*s + n;
    b_est = y_anti > 0;
    erros_anti = sum(b ~= b_est);
    ber_anti(i) = erros_anti/bits;
    Pb_anti(i) = qfunc(sqrt(2*EbN0));
    
    y_orto0 = sqrt(Es)*~s + n0;
    y_orto1 = sqrt(Es)*s + n1;
    b_est = y_orto1 > y_orto0;
    erros_orto = sum(b ~= b_est);
    ber_orto(i) = erros_orto/bits;
    Pb_orto(i) = qfunc(sqrt(EbN0));
end