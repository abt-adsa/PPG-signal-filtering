function [pad_pts, freq_axis, hr_scale] = padZeros(signal_length, fs)
    pad_val = 100;
    pad_exp = nextpow2(pad_val);
    pad_pts = 2^pad_exp;
    
    lpad = pad_pts * signal_length;
    freq_axis = 0:fs/lpad:fs/2;
    hr_scale = freq_axis * 60;
end
