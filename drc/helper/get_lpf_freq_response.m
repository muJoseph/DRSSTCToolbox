function [f_3db_Hz] = get_lpf_freq_response(R_ser,C_sh, f_res_Hz)
%GET_LPF_FREQ_RESPONSE Summary of this function goes here
%   Detailed explanation goes here

% Build RC LPF transfer function
s = tf('s');
tau = R_ser*C_sh;
H = 1/((s*tau) + 1);

% Get Bode magnitude, phase, and frequency vectors
[mag, phase, w] = bode(H);

% Process the output (if needed for single-input, single-output systems)
% Use 'squeeze' to remove singleton dimensions for easier handling
phase_deg = squeeze(phase);

% Convert absolute magnitude to decibels (dB)
mag_db = 20 * log10(squeeze(mag));

% Find the index closest to -3 dB (relative to max gain, which is 0 dB)
target_db = max(mag_db) - 3;
[~, idx] = min(abs(mag_db - target_db));

% Get the frequency at -3dB
freq_3db_rad = w(idx);  % rad/s
f_3db_Hz = freq_3db_rad / (2 * pi);  % Hz

f_res_rad = 2*pi*f_res_Hz;   % Resonant angular freq, rad/s
% Set bode plot limits
% 1 octave below resonant frequency, 2 octaves above -3dB freq
bodePlotLimits = {f_res_rad/2, freq_3db_rad*4};    % Rad/s

% Configure bode plot
opts = bodeoptions;
opts.FreqUnits = 'Hz'; % Set the frequency unit to Hertz
opts.Grid = 'on';
% Create bode plot
figure();
bode(H,opts, bodePlotLimits);

h = get(gcf, 'Children'); 
% Magnitude is in Hz per the above config, therefore use f_3db_Hz
xline(h(3), f_res_Hz, '--b', 'LineWidth', 1.5); % Draw on Magnitude plot
xline(h(3), f_3db_Hz, '--r', 'LineWidth', 1.5); % Draw on Magnitude plot


end

