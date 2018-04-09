noise = randn([1,n*Fs])*sqrt(Np);
t = 0:1/Fs:n-1/Fs;

% Antipodal
bit0 = -ones(1, Fs);
bit1 = ones(1, Fs);

for i=1:1:n
    cmp = randi([1,Fs]);
    
    if randi([1,Fs]) > cmp
       y1((i-1)*Fs+1:i*Fs) = bit1;
    else
        y1((i-1)*Fs+1:i*Fs) = bit0;
    end
end

y2 = y1 + noise;

% Ortogonal
bit0 = [ones(1, Fs/2) -ones(1, Fs/2)];
bit1 = ones(1, Fs);

for i=1:1:n
    cmp = randi([1,Fs]);
    
    if randi([1,Fs]) > cmp
       y3((i-1)*Fs+1:i*Fs) = bit1;
    else
        y3((i-1)*Fs+1:i*Fs) = bit0;
    end
end

y4 = y3 + noise;