% Antipodal
for i=1:n
    val(i) = mean(y2((i-1)*Fs+1:i*Fs));
end

avg = (max(val)+min(val))/2;

for i=1:length(val)
    if avg <= val(i)
        y5((i-1)*Fs+1:i*Fs) = ones(1,Fs);
    else
        y5((i-1)*Fs+1:i*Fs) = -ones(1,Fs);
    end
end

% Ortogonal
for i=1:n
    val(i) = mean(y4((i-1)*Fs+1:i*Fs));
end

hlf = max(val)/2;

for i=1:length(val)
    if hlf <= val(i)
        y6((i-1)*Fs+1:i*Fs) = ones(1,Fs);
    else
        y6((i-1)*Fs+1:i*Fs) = [ones(1,Fs/2) -ones(1,Fs/2)];
    end
end