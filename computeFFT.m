function [dft, freq, p] = computeFFT(signal, pad_pts, fs)

    lpad = pad_pts * length(signal);
    dft = fft(signal, lpad);
    dft = dft(1:lpad/2+1);
    dft = dft / length(signal);
    dft(2:end-1) = 2 * dft(2:end-1);
    
    freq = 0:fs/lpad:fs/2;
end
