for Np=10:10:2000
    run a2_aleatorio.m; run a2_filtrado.m;
    
    ber_anti = 0;
    ber_orto = 0;
    ber_ppm = 0;

    % Antipodal
    for i=1:Fs:n*Fs
        if y1_f(i) ~= y1(i)
            ber_anti = ber_anti + 1;
        end
    end

    % Ortogonal
    for i=1:Fs/2:n*Fs
        if y2_f(i) ~= y2(i)
            ber_orto = ber_orto + 1;
        end
        
        if y2_f(i) ~= y2(i)
            ber_ppm = ber_ppm + 1;
        end
    end
    
    anti(Np/10) = ber_anti/n;
    orto(Np/10) = ber_orto/n;
    ppm(Np/10) = ber_ppm/n;
end

plot([10:10:2000], anti, 'r')
title('BER x Potência do ruído')
xlabel('Potência do ruído');
ylabel('BER');
hold on
plot([10:10:2000], orto, 'b')
ylabel('BER');
xlabel('Potência do ruído');
plot([10:10:2000], ppm, 'k')
grid on;
ylabel('BER');
xlabel('Potência do ruído');
%axis([10 2000 0 0.7]);
legend('Sinal antipodal', 'Sinal ortogonal', 'Sinal ortogonal PPM');