t = 0:1/Fs:n-1/Fs;

bits = rand(1, n) > 0.5;
bits = 2*bits - 1;

% Antipodal  
bit0_anti = -ones(1, Fs);
bit1_anti = ones(1, Fs);

h_mf = fliplr(bit1_anti);

for i=1:1:n
    if bits(i) > 0
       y1((i-1)*Fs+1:i*Fs) = bit1_anti;
    else
       y1((i-1)*Fs+1:i*Fs) = bit0_anti;
    end
    
    h_pb = [zeros(1, Fs - B) ones(1, Fs - B)];
end