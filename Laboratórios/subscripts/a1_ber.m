for Np=10:10:2000
    run a1_aleatorio.m; run a1_decodificado.m;
    
    ber_anti = 0;
    ber_orto = 0;

    % Antipodal
    for i=1:Fs:n*Fs
        if y5(i) ~= y1(i)
            ber_anti = ber_anti + 1;
        end
    end

    % Ortogonal
    for i=1:Fs/2:n*Fs
        if y6(i) ~= y3(i)
            ber_orto = ber_orto + 1;
        end
    end
    
    anti(Np/10) = ber_anti/n;
    orto(Np/10) = ber_orto/n;
end

figure(1)
plot([10:10:2000], anti, 'r')
title('BER x Potência do ruído')
xlabel('Potência do ruído');
ylabel('BER');
axis([10 2000 0 0.7]);
hold on
plot([10:10:2000], orto, 'b')
ylabel('BER');
xlabel('Potência do ruído');
axis([10 2000 0 0.7]);
legend('Sinal antipodal', 'Sinal ortogonal');