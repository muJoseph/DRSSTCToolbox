close all;
clc;

R_ser = 51;     % Series resistor, Ohms
C_sh = 120e-12; % Shunt capacitor, F
f_res = 264e3;  % Resonant frequency of DRSSTC, Hz

[f_3db_Hz] = get_lpf_freq_response(R_ser, C_sh, f_res);


disp("******* Anti-aliasing filter parameters ***************")
fprintf("Cut-off frequency: %0.2f MHz\n",f_3db_Hz/1e6);