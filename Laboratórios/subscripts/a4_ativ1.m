set(0, 'DefaultFigureWindowStyle', 'docked')
R = 0:0.25:1;
legendCell = cell(length(R), 1);

for i=1:1:length(R)
    h_sqrt(i, :) = rcosfir(R(i), N_T, RATE, T, 'sqrt');
    h(i, :) = rcosfir(R(i), N_T, RATE, T, 'normal');
    h_sqrt_fft(i, :) = fftshift(abs(fft(h_sqrt(i,:), 50000)));
    h_fft(i, :) = fftshift(abs(fft(h(i,:), 50000)));
    
    legendCell{i} = ['\alpha = ' num2str(R(i))];
    
    figure(1); hold on;
	plot(-N_T*T:delta:N_T*T, h_sqrt(i,:))
    
    figure(2); hold on;
    plot(-N_T*T:delta:N_T*T, h(i,:))
    
    figure(3); hold on;
    plot(h_sqrt_fft(i,:))
    
    figure(4); hold on;
    plot(h_fft(i,:))
end

figure(1)
legend(legendCell);
xlabel('tempo (intervalo de símbolo)');
title('Pulso Raiz de Cosseno Levantado');
grid on;

figure(2)
legend(legendCell);
xlabel('tempo (intervalo de símbolo)');
title('Pulso Cosseno Levantado');
grid on;

figure(3)
legend(legendCell);
xlabel('');
title('FFT da Raiz de Cosseno Levantado');
grid on;

figure(4)
legend(legendCell);
xlabel('');
title('FFT do Cosseno Levantado');
grid on;