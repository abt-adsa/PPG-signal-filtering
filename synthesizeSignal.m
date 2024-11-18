function [red_signal, ir_signal] = synthesizeSignal(time, freqs, amp_red, amp_ir, phases)
    N = length(time);
    red_signal = zeros(1, N);
    ir_signal = zeros(1, N);
    
    for k = 1:length(freqs)
        red_signal = 0.8 + red_signal + amp_red(k) * cos(2 * pi * freqs(k) * time + phases(k));
        ir_signal = 1.4 + ir_signal + amp_ir(k) * cos(2 * pi * freqs(k) * time + phases(k));
    end
end
