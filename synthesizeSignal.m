function [red_signal, ir_signal] = synthesizeSignal(time)
    freqs = [1.3, 2.6, 3.9, 5.2, 6.5];
    phases = [-1.58, -1.60, -1.61, -1.61, -1.30];
    amp_red = [0.21, 0.15, 0.03, 0.01, 0.00] * 1e-3;
    amp_ir = [0.62, 0.42, 0.09, 0.04, 0.002] * 1e-3;

    N = length(time);
    red_signal = zeros(1, N);
    ir_signal = zeros(1, N);
    
    for k = 1:length(freqs)
        red_signal = 0.8 + red_signal + amp_red(k) * cos(2 * pi * freqs(k) * time + phases(k));
        ir_signal = 1.4 + ir_signal + amp_ir(k) * cos(2 * pi * freqs(k) * time + phases(k));
    end
end
