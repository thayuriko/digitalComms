R = 0:0.25:1;
legendCell = cell(length(R), 1);

bits = [1 0 0 1 0];
s = 2*bits - 1;
s_up = upsample(s, RATE);

for i=1:1:length(R)
    h_sqrt(i, :) = rcosfir(R(i), N_T, RATE, T, 'sqrt');
    tx(i, :) = conv(s_up, h_sqrt(i, :));
    mf(i, :) = conv(tx(i, :), h_sqrt(i, :));
    
    legendCell{i} = ['\alpha = ' num2str(R(i))];
    
    figure(5); hold on;
    plot(tx(i,:));
    
    figure(6); hold on;
    plot(mf(i,:));
end

figure(5)
legend(legendCell);
xlabel('tempo (intervalo de símbolo)');
title('Pulso Tx Raiz de Cosseno Levantado');
grid on;

figure(6)
legend(legendCell);
xlabel('tempo (intervalo de símbolo)');
title('Depois do Filtro');
grid on;