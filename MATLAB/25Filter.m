clc; clear; close all;

fs = 1000;    % Abtastrate in Hz
n = 5;        % Filterordnung

% --- Filterdefinitionen ---
% Tiefpass
fc_lp = 100;
[b_lp, a_lp] = butter(n, fc_lp/(fs/2), 'low');

% Hochpass
fc_hp = 200;
[b_hp, a_hp] = butter(n, fc_hp/(fs/2), 'high');

% Bandpass
fc_bp = [150 250];
[b_bp, a_bp] = butter(n, fc_bp/(fs/2), 'bandpass');

% Bandsperre
fc_bs = [150 250];
[b_bs, a_bs] = butter(n, fc_bs/(fs/2), 'stop');

% --- Frequenzgänge berechnen ---
[H_lp,f] = freqz(b_lp, a_lp, 1024, fs);
[H_hp,~] = freqz(b_hp, a_hp, 1024, fs);
[H_bp,~] = freqz(b_bp, a_bp, 1024, fs);
[H_bs,~] = freqz(b_bs, a_bs, 1024, fs);

% --- Subplot-Diagramm ---
figure;

subplot(2,2,1);
plot(f, abs(H_lp), 'b','LineWidth',2);
grid on; ylim([0 1.2]);
title('Tiefpass (Butterworth)');
xlabel('Frequenz (Hz)'); ylabel('|H(f)|');

subplot(2,2,2);
plot(f, abs(H_hp), 'r','LineWidth',2);
grid on; ylim([0 1.2]);
title('Hochpass (Butterworth)');
xlabel('Frequenz (Hz)'); ylabel('|H(f)|');

subplot(2,2,3);
plot(f, abs(H_bp), 'g','LineWidth',2);
grid on; ylim([0 1.2]);
title('Bandpass (Butterworth)');
xlabel('Frequenz (Hz)'); ylabel('|H(f)|');

subplot(2,2,4);
plot(f, abs(H_bs), 'm','LineWidth',2);
grid on; ylim([0 1.2]);
title('Bandsperre (Butterworth)');
xlabel('Frequenz (Hz)'); ylabel('|H(f)|');

sgtitle('Reale Frequenzgänge von 4 Butterworth-Filtern');
