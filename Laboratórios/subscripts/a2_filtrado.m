% Antipodal
h_anti = fliplr(bit1_anti);
r = conv(y1_n, h_anti);

% Ortogonal
h_orto0 = fliplr(bit0_orto);
h_orto1 = fliplr(bit1_orto);
r_orto0 = conv(y2_n, h_orto0);
r_orto1 = conv(y2_n, h_orto1);

% PPM
h_ppm0 = fliplr(bit0_ppm);
h_ppm1 = fliplr(bit1_ppm);
r_ppm0 = conv(y3_n, h_ppm0);
r_ppm1 = conv(y3_n, h_ppm1);

for i=1:1:n
    t_sp(i) = i*Fs;
    resp_anti(i) = r(t_sp(i));
    
    %Antipodal
    if r(t_sp(i)) > 0
        y1_f((i-1)*Fs+1:i*Fs) = bit1_anti;
    else
        y1_f((i-1)*Fs+1:i*Fs) = bit0_anti;
    end
    
    %Ortogonal
    if r_orto0(t_sp(i)) > r_orto1(t_sp(i))
        resp_orto(i) = r_orto0(t_sp(i));
        y2_f((i-1)*Fs+1:i*Fs) = bit0_orto;
    else
        resp_orto(i) = r_orto1(t_sp(i));
        y2_f((i-1)*Fs+1:i*Fs) = bit1_orto;
    end
    
    if r_ppm0(t_sp(i)) > r_ppm1(t_sp(i))
        resp_ppm(i) = r_ppm0(t_sp(i));
        y3_f((i-1)*Fs+1:i*Fs) = bit0_ppm;
    else
        resp_ppm(i) = r_orto1(t_sp(i));
        y3_f((i-1)*Fs+1:i*Fs) = bit1_ppm;
    end
end

t_sp = t_sp - 1/Fs;