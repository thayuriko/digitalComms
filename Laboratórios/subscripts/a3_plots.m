semilogy([0:10], ber_anti, 'b');
hold on;
semilogy([0:10], Pb_anti, 'bs');
semilogy([0:10], ber_orto, 'color',[0.9100    0.4100    0.1700]);
semilogy([0:10], Pb_orto, 'd', 'color',[0.9100    0.4100    0.1700]);
grid on;
legend('Simulada Antipodal', 'Teórica Antipodal', ...
    'Simulada Ortogonal', 'Teórica Ortogonal')
xlabel('E_{b}/N_{0} [dB]')
ylabel('BER')