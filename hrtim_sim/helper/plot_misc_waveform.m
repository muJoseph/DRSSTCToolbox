lineWidth = 1.5;


%% Plot TF Synthesis

t_lim = [2e-5 3.0e-5];

% Pull data
time_cmp2_hit = getsampleusingtime(simOut.TIME_CMP2_HIT,t_lim(1), t_lim(2));
time_cmp3_hit = getsampleusingtime(simOut.TIME_CMP3_HIT,t_lim(1), t_lim(2));
time_cnt = getsampleusingtime(simOut.TIME_CNT,t_lim(1), t_lim(2));
eev6 = getsampleusingtime(simOut.EEV6,t_lim(1), t_lim(2));
tf2 = getsampleusingtime(simOut.TF2,t_lim(1), t_lim(2));

cmp2 = max(simOut.TIME_CMP2);
cmp3 = max(simOut.TIME_CMP3);

figure();

% Plot TIME Count alongside CMP2 and CMP3 thresholds
sp = subplot(3,1,1);
plot(time_cnt, "LineWidth",lineWidth);
hold on;
yline(cmp2,"--",sprintf("CMP2=%d",cmp2),"LineWidth",lineWidth);
hold on;
yline(cmp3,"--",sprintf("CMP3=%d",cmp3),"LineWidth",lineWidth);
ylabel('TIME Count');
xlim(t_lim);
title("TIME EEV6 Blanking via TF2");
grid on;

% Plot Compare 2 and Compare 3 Hit Events
sp = subplot(3,1,2);
plot(time_cmp2_hit, "LineWidth",lineWidth);
hold on;
plot(time_cmp3_hit, "LineWidth",lineWidth);
ylabel("");
legend("TIME CMP2 Hit", "TIME CMP3 Hit");
xlim(t_lim);
ylim([0 1.25]);
sp.Title.Visible = 'off';
grid on;

% Plot TF2
sp = subplot(3,1,3);
plot(tf2, '--', "LineWidth",lineWidth);
hold on;
plot(eev6, "LineWidth",lineWidth);
legend("TF2",'EEV6');
ylabel("");
xlim(t_lim);
ylim([0 1.25]);
sp.Title.Visible = 'off';
grid on;