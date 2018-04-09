for Np=10:10:2000
    run a2_desafio_filtro.m;
    
    ber_pb = 0;
    ber_mf = 0;
    
    for i=1:Fs:n*Fs
        if y1_pb(i) ~= y1(i)
            ber_pb = ber_pb + 1;
        end
        
        if y1_mf(i) ~= y1(i)
            ber_mf = ber_mf + 1;
        end
    end
    
    anti_pb(Np/10) = ber_pb/n;
    anti_mf(Np/10) = ber_mf/n;
end

plot([10:10:2000], anti_pb)
title('BER x Potência do ruído')
xlabel('Potência do ruído');
ylabel('BER');
hold on
plot([10:10:2000], anti_mf)
ylabel('BER');
xlabel('Potência do ruído');
grid on;
legend('Filtro Passa Baixas', 'Filtro Casado');