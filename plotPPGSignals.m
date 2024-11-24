function plotPPGSignals(time, red_noisy, ir_noisy, red_norm, ir_norm, ...
    red_noisy_fft, ir_noisy_fft, red_fft, ir_fft, freq_axis, ...
    hr_bpm_clean, spo2_clean, hr_bpm, spo2)
    
    figure;
    sgtitle(['Clean Signal - HR: ', num2str(round(hr_bpm_clean, 0)), ...
        ' bpm, SpO2: ', num2str(round(spo2_clean, 1)), ' %', newline, ...
        'Filtered Signal - HR: ', num2str(round(hr_bpm, 0)), ...
        ' bpm, SpO2: ', num2str(round(spo2, 1)), ' %'])
    
    subplot(4, 2, 1);
    plot(time, red_noisy, 'r');
    xlabel('Time (s)'), ylabel('Magnitude');
    title('Red (Unfiltered)');
    
    subplot(4, 2, 2);
    plot(time, ir_noisy, 'b');
    xlabel('Time (s)'), ylabel('Magnitude');
    title('Infrared (Unfiltered)');
    
    subplot(4, 2, 3);
    plot(time, red_norm, 'r', 'LineWidth', 1.5);
    xlabel('Time (s)'), ylabel('Magnitude');
    title('Red (Filtered)');
    
    subplot(4, 2, 4);
    plot(time, ir_norm, 'b', 'LineWidth', 1.5);
    xlabel('Time (s)'), ylabel('Magnitude');
    title('Infrared (Filtered)');

    subplot(4, 2, 5);
    plot(freq_axis, red_noisy_fft, 'r-');
    xlabel('Frequency (Hz)'), ylabel('Magnitude');
    title('Red (Unfiltered) FFT');
    xlim([0 5]);

    subplot(4, 2, 6);
    plot(freq_axis, ir_noisy_fft, 'b-');
    xlabel('Frequency (Hz)'), ylabel('Magnitude');
    title('Infrared (Unfiltered) FFT');
    xlim([0 5]);

    subplot(4, 2, 7);
    plot(freq_axis, red_fft, 'r-');
    xlabel('Frequency (Hz)'), ylabel('Magnitude');
    title('Red (Filtered) FFT');
    xlim([0 5]);

    subplot(4, 2, 8);
    plot(freq_axis, ir_fft, 'b-');
    xlabel('Frequency (Hz)'), ylabel('Magnitude');
    title('Infrared (Filtered) FFT');
    xlim([0 5]);
end
