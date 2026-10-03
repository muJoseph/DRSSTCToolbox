lineWidth = 1.5;

figure();
% Output of ZCD CT on left axis
sp = subplot(3,1,1);
yyaxis left;
plot(simOut.V_ZCD_AC_CPL, "LineWidth",lineWidth);
ylabel('ZCD FB (V)');

% Plot EEV6 on right y-axis
yyaxis right;
plot(simOut.EEV6,"LineWidth",lineWidth);
ylim([0 1.25]);
yticks([0 1]);
ylabel('EEV6');
title('Example PRF Cycle');
xlabel('');
grid on;

sp = subplot(3,1,2);
% Plot Interruptor Signal
plot(simOut.Interrupter,'--',"LineWidth",lineWidth);
hold on;
% Plot EEV8
plot(simOut.EEV8, "LineWidth",lineWidth);
ylim([0 1.25]);
yticks([0 1]);
ylabel('');
legend('Interrupter','EEV8 (OCD)');
sp.Title.Visible = 'off';
xlabel('');
grid on;

sp = subplot(3,1,3);
% Plot inverter output on left axis
yyaxis left;
plot(simOut.V_inverter,"LineWidth",lineWidth);
ylabel('Inverter Out (V)');

% Plot primary current on right axis
yyaxis right;
plot(simOut.I_pri,"LineWidth",lineWidth);
yyaxis right;
yline(OCD_Limit_A, '--', "OCD Limit");
yline(-OCD_Limit_A, '--', "OCD Limit");
sp.Title.Visible = 'off';
xlabel('Time (sec)');
ylabel('Primary current (A)');
grid on;

%% 
figure();

% Find the first time EEV8 goes high
idx = find(simOut.EEV8.Data >= 1, 1, 'first');
t_ocd = simOut.tout(idx);

% Plot TB1
sp = subplot(4,1,1);
plot(simOut.TB1,"LineWidth",lineWidth);
hold on;
xline(t_ocd,'--r','LineWidth',lineWidth);
ylim([0 1.25]);
yticks([0 1]);
ylabel('TB1');
sp.Title.Visible = 'on';
title("H-Bridge Drive Signals (Pulse Skipping Active)")
xlabel('');
grid on;

% Plot TB2
sp = subplot(4,1,2);
plot(simOut.TB2,"LineWidth",lineWidth);
hold on;
xline(t_ocd,'--r','LineWidth',lineWidth);
ylim([0 1.25]);
yticks([0 1]);
ylabel('TB2');
sp.Title.Visible = 'off';
xlabel('');
grid on;

% Plot TC1
sp = subplot(4,1,3);
plot(simOut.TC1,"LineWidth",lineWidth);
hold on;
xline(t_ocd,'--r','LineWidth',lineWidth);
ylim([0 1.25]);
yticks([0 1]);
ylabel('TC1');
sp.Title.Visible = 'off';
xlabel('');
grid on;

% Plot TC2
sp = subplot(4,1,4);
plot(simOut.TC2,"LineWidth",lineWidth);
hold on;
xline(t_ocd,'--r','LineWidth',lineWidth);
ylim([0 1.25]);
yticks([0 1]);
ylabel('TC2');
sp.Title.Visible = 'off';
grid on;



