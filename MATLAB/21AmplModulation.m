clc; clear; close all;

% Parameter
fs = 100e3;        % Abtastrate [Hz]
duration = 0.2;   % Dauer [s]
t = 0:1/fs:duration;

fm = 50;           % Frequenz der Nachricht [Hz]
fc = 500;         % Frequenz des Trägers [Hz]
mu = 0.7;          % Modulationsindex (0..1 für Standard-AM)

% Signale
m_t = sin(2*pi*fm*t);                  % Nachrichtensignal
c_t = sin(2*pi*fc*t);                  % Trägersignal
s_t = (1 + mu * m_t) .* c_t;           % AM-Signal

% Nachrichtensignal plotten
figure;
plot(t, m_t, 'LineWidth', 1.5);
title('Nachrichtensignal m(t)');
xlabel('Zeit [s]'); ylabel('Amplitude');
xlim([0 5/fm]); grid on;

% Trägersignal plotten
figure;
plot(t, c_t, 'LineWidth', 1.2);
title('Trägersignal c(t)');
xlabel('Zeit [s]'); ylabel('Amplitude');
xlim([0 5/fc]); grid on;

% AM-Signal plotten
figure;
plot(t, s_t, 'b');
title('Amplitudenmodulation von 50Hz Sinus auf 500Hz Träger');
xlabel('Zeit [s]'); ylabel('Amplitude');
xlim([0 10/fm]); 
grid on;
