function displayResults(hr_bpm, spo2, hr_bpm_clean, spo2_clean, hr_error, spo2_error)
    disp('Ground Truth Values:');
    disp(['HR: ', num2str(round(hr_bpm_clean, 0)), ' bpm']);
    disp(['SpO2: ', num2str(round(spo2_clean, 1)), ' %']);
    disp(' ');
    
    disp('Filtered Signal Results:');
    disp(['HR: ', num2str(round(hr_bpm, 0)), ' bpm']);
    disp(['SpO2: ', num2str(round(spo2, 1)), ' %']);
    disp(' ');
    
    disp('Measurement Errors:');
    disp(['HR Error: ', num2str(hr_error), ' bpm']);
    disp(['SpO2 Error: ', num2str(spo2_error), ' %']);
    disp(' ');
end
