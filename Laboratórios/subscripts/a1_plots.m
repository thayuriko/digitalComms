% Antipodal
subplot(3,2,1)
plot(t,y1)
title(['Antipodal: ' num2str(ber_anti) '/' num2str(n)])
xlabel('tempo (s)');
axis([0 n -2 2])

subplot(3,2,3)
plot(t,y2)
xlabel('tempo (s)');
axis([0 n -10 10]);

subplot(3,2,5)
plot(t,y5)
xlabel('tempo (s)');
axis([0 n -2 2]);

% Ortogonal
subplot(3,2,2)
plot(t,y3)
title(['Ortogonal: ' num2str(ber_orto) '/' num2str(n)])
xlabel('tempo (s)');
axis([0 n -2 2]) 

subplot(3,2,4)
plot(t,y4)
xlabel('tempo (s)');
axis([0 n -10 10]);

subplot(3,2,6)
plot(t,y6)
xlabel('tempo (s)');
axis([0 n -2 2]);