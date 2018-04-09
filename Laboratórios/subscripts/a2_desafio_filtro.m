noise = randn([1,n*Fs])*sqrt(Np);
y1_n = y1 + noise;

r_pb = conv(y1_n, h_pb);
r_mf = conv(y1_n, h_mf);

for i=1:1:n
    t_sp(i) = i*Fs;

    %Passa Baixa
    if r_pb(t_sp(i)) > r_pb((i-1)*Fs+1)
        y1_pb((i-1)*Fs+1:i*Fs) = bit1_anti;
    else
        y1_pb((i-1)*Fs+1:i*Fs) = bit0_anti;
    end
    
    %Filtro Casado
    if r_mf(t_sp(i)) > 0
        y1_mf((i-1)*Fs+1:i*Fs) = bit1_anti;
    else
        y1_mf((i-1)*Fs+1:i*Fs) = bit0_anti;
    end
end