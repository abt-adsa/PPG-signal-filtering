clc, clearvars, close all;

%% Signal parameters

fs = 300;
N = 3000;
time = linspace(0, 10, N);


%% Generate synthetic signals

[red_signal, ir_signal] = synthesizeSignal(time);
[red_noisy, ir_noisy] = addNoise(red_signal, ir_signal, time);


%% Pre-filtering stage

window_size = 5;
med_window = 3;
red_prefilt = movmean(red_noisy, window_size);
ir_prefilt = movmean(ir_noisy, window_size);
red_prefilt = medfilt1(red_prefilt, med_window);
ir_prefilt = medfilt1(ir_prefilt, med_window);


%% Multi-stage filtering

% Notch filter
wo = 60/(fs/2);
bw = wo/50;
[b_notch,a_notch] = iirnotch(wo, bw);
red_notched = filtfilt(b_notch, a_notch, red_prefilt);
ir_notched = filtfilt(b_notch, a_notch, ir_prefilt);

% Bandpass filter
bp_cutoff = [0.5 5];
[b_bp,a_bp] = butter(4, bp_cutoff/(fs/2), 'bandpass');
red_ac = filtfilt(b_bp, a_bp, red_notched);
ir_ac = filtfilt(b_bp, a_bp, ir_notched);

% Low-pass filter
lp_cutoff = 0.5;
[b_lp,a_lp] = butter(4, lp_cutoff/(fs/2), 'low');
red_dc = filtfilt(b_lp, a_lp, red_notched);
ir_dc = filtfilt(b_lp, a_lp, ir_notched);


%% Normalization

red_norm = red_ac ./ red_dc;
ir_norm = ir_ac ./ ir_dc;


%% Fourier Transform

[pad_pts, freq_axis, hr_scale] = padZeros(length(red_norm), fs);
red_fft = abs(computeFFT(red_norm, pad_pts, fs));
ir_fft = abs(computeFFT(ir_norm, pad_pts, fs));
red_noisy_fft = abs(computeFFT(red_noisy, pad_pts, fs));
ir_noisy_fft = abs(computeFFT(ir_noisy, pad_pts, fs));


%% Calculate metrics and compare

% Calculate ground truth values
[hr_bpm_clean, spo2_clean] = calculateMetrics(red_signal, ir_signal, fs, 0);

% Calculate metrics for filtered signals
[hr_bpm, spo2] = calculateMetrics(red_norm, ir_norm, fs, 1);

% Calculate errors
[hr_error, spo2_error] = calculateError(hr_bpm, spo2, hr_bpm_clean, spo2_clean);


%% Results and Plots

displayResults(hr_bpm, spo2, hr_bpm_clean, spo2_clean, hr_error, spo2_error);

plotPPGSignals(time, red_noisy, ir_noisy, red_norm, ir_norm, ...
    red_noisy_fft, ir_noisy_fft, red_fft, ir_fft, freq_axis, ...
    hr_bpm_clean, spo2_clean, hr_bpm, spo2);