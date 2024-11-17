function [hr_bpm, spo2] = calculateMetrics(red_signal, ir_signal, fs, mode)

    if mode == 0
        % For clean signal
        red_ac = red_signal - mean(red_signal);
        ir_ac = ir_signal - mean(ir_signal);
        red_dc = mean(red_signal);
        ir_dc = mean(ir_signal);
        
        red_norm = red_ac / red_dc;
        ir_norm = ir_ac / ir_dc;
    else
        % For filtered signal
        red_norm = red_signal;
        ir_norm = ir_signal;
    end
    
    % Calculate HR
    [pad_pts, ~, hr_scale] = padZeros(length(red_norm), fs);
    red_fft = abs(computeFFT(red_norm, pad_pts, fs));
    [~, max_index] = max(red_fft);
    hr_bpm = hr_scale(max_index);
    
    % Calculate SpO2
    r_value = rms(red_norm) / rms(ir_norm);
    spo2 = 110 - 25 * r_value;
end
