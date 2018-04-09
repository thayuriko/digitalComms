ber_anti = 0;
ber_orto = 0;
ber_ppm = 0;

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
end

% PPM
for i=1:Fs/2:n*Fs
    if y3_f(i) ~= y3(i)
        ber_ppm = ber_ppm + 1;
    end
end

t_sp = t_sp - 1/Fs;

figure(2)
subplot(4,3,1)
plot(t, y1, 'k');
grid on;
title(['Antipodal: ' num2str(ber_anti) '/' num2str(n)])
subplot(4,3,4)
plot(t, y1_n, 'b');
grid on;
subplot(4,3,7)
plot(t, y1_f, 'r');
grid on;
subplot(4,3,10)
stem(t_sp, resp_anti, 'r');
grid on;


subplot(4,3,2)
plot(t, y2, 'k');
grid on;
title(['Ortogonal: ' num2str(ber_orto) '/' num2str(n)])
subplot(4,3,5)
plot(t, y2_n, 'b');
grid on;
subplot(4,3,8)
plot(t, y2_f, 'r');
grid on;
subplot(4,3,11)
stem(t_sp, resp_orto, 'r');
grid on;


subplot(4,3,3)
plot(t, y3, 'k');
grid on;
title(['PPM: ' num2str(ber_ppm) '/' num2str(n)])
subplot(4,3,6)
plot(t, y3_n, 'b');
grid on;
subplot(4,3,9)
plot(t, y3_f, 'r');
grid on;
subplot(4,3,12)
stem(t_sp, resp_ppm, 'r');
grid on;