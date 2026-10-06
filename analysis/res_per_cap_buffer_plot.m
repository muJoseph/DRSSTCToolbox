% f_ol: Open-loop/start frequency (Hz)
% max_dev: Max negative and positive deviation from f_ol 
% [ max_neg_deviation, max_pos_deviation ] (%)
function [mu,sigma,f_res_spe] = res_per_cap_buffer_plot(fn,f_ol,max_dev)


% Tick frequency of HRTIM timers (Hz)
hrtim_tick_freq_hz = 170e6;

% Read CSV, strip zeros
csv = nonzeros(readmatrix(fn)); 

% Convert TIME Capture 1 value to frequency (Hz)
res_freq = hrtim_tick_freq_hz./csv;

% Compute mean
res_freq_mean = mean(res_freq); % Hz

% Compute standard deviation
res_freq_std = std(res_freq);   % Hz

% Compute min/max tracked resonant frequency
f_max =  f_ol * (max_dev(2)/100 + 1);     % Hz
f_min =  f_ol * (1 - max_dev(1)/100 );    % Hz

% Plot figures
lineWidth = 1.5;

n = length(res_freq);

res_freq_khz = res_freq/1e3;
res_freq_mean_khz = res_freq_mean/1e3;
f_ol_khz = f_ol/1e3;
f_max_khz = f_max/1e3;
f_min_khz = f_min/1e3;
res_freq_std_khz = res_freq_std/1e3;

figure()
plot(res_freq_khz,'LineWidth',lineWidth,'Color', [0.2, 0.5, 0.9, 0.5]);
hold on;
yline(f_max_khz, '--r', sprintf("f_{max}= %0.0f kHz",f_max_khz),"LineWidth",lineWidth);
hold on;
yline(f_min_khz, '--r',  sprintf("f_{min}= %0.0f kHz",f_min_khz),"LineWidth",lineWidth);
hold on;
yline(f_ol_khz, '--', sprintf("f_{ol}= %0.0f kHz",f_ol_khz),"LineWidth",lineWidth,'Color', [0, 0.5, 0]);
hold on;
yline(res_freq_mean_khz, '--k', sprintf("mean= %0.0f kHz",res_freq_mean_khz),"LineWidth",lineWidth,"FontWeight","bold");
xlabel('Capture Event #');
ylabel('Resonant Frequency (kHz)');
grid on;
ylim([f_min_khz*.9 f_max_khz*1.10])
title(sprintf("Measured Resonant Frequency (n= %d, sigma= %0.2f kHz)",n,res_freq_std_khz));


% Output
mu = res_freq_mean;
sigma = res_freq_std;
f_res_spe = ((res_freq_mean - f_ol)/f_ol)*100;


end

