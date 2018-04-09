noise = randn([1,n*Fs])*sqrt(Np);
t = 0:1/Fs:n-1/Fs;

bits = rand(1, n) > 0.5;
bits = 2*bits - 1;

% Antipodal
bit0_anti = -ones(1, Fs);
bit1_anti = ones(1, Fs);

% Ortogonal
bit0_orto = [ones(1, Fs/2) -ones(1, Fs/2)];
bit1_orto = ones(1, Fs);

% PPM
bit0_ppm = [ones(1, Fs/4) zeros(1, Fs - Fs/4)];
bit1_ppm = [zeros(1, Fs - Fs/4) ones(1, Fs/4)];


for i=1:1:n
    if bits(i) > 0
       y1((i-1)*Fs+1:i*Fs) = bit1_anti;
       y2((i-1)*Fs+1:i*Fs) = bit1_orto;
       y3((i-1)*Fs+1:i*Fs) = bit1_ppm;
    else
       y1((i-1)*Fs+1:i*Fs) = bit0_anti;
       y2((i-1)*Fs+1:i*Fs) = bit0_orto;
       y3((i-1)*Fs+1:i*Fs) = bit0_ppm;
    end
end

y1_n = y1 + noise;
y2_n = y2 + noise;
y3_n = y3 + noise;