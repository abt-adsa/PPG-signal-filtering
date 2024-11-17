function [red_noisy, ir_noisy] = addNoise(red_signal, ir_signal, time)
    % Respiratory artifact
    resp_freq = 0.26;
    resp_amp = 0.0003;
    resp_artifact = resp_amp * sin(2*pi*resp_freq*time);
    
    % Power line interference
    line_freq = 60;
    line_amp = 0.0003;
    line_artifact = line_amp * sin(2*pi*line_freq*time);
    
    % Sensor noise
    noise_std = 0.0001;
    sensor_noise = noise_std * randn(size(time));
    
    % Add all noise components
    red_noisy = red_signal + resp_artifact + line_artifact + sensor_noise;
    ir_noisy = ir_signal + resp_artifact + line_artifact + sensor_noise;
end
