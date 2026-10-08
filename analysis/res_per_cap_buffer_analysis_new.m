close all;
clear all;
clc;

% Plot capture buffer
fn = "1-4_run_trial1.csv";
[f_res_mean1,f_res_std1,f_res_spe1] = res_per_cap_buffer_plot(fn,264e3,[35 5]);

% Plot capture buffer
fn = "1-4_run_trial2.csv";
[f_res_mean2,f_res_std2,f_res_spe2] = res_per_cap_buffer_plot(fn,264e3,[35 5]);

% Plot capture buffer
fn = "5_run_trial1.csv";
[f_res_mean3,f_res_std3,f_res_spe3] = res_per_cap_buffer_plot(fn,264e3,[35 5]);

% Plot capture buffer
fn = "6_run_trial1.csv";
[f_res_mean4,f_res_std4,f_res_spe4] = res_per_cap_buffer_plot(fn,264e3,[35 5]);
