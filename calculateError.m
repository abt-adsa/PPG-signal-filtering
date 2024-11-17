function [hr_error, spo2_error] = calculateError(hr_bpm, spo2, hr_bpm_clean, spo2_clean)
    hr_error = abs(hr_bpm - hr_bpm_clean);
    spo2_error = abs(spo2 - spo2_clean);
end
