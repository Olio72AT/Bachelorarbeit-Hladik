clc; clear; close all;

% Parameter
fs = 100e3;        % Abtastrate [Hz]
duration = 0.1;   % Dauer [s]
t = 0:1/fs:duration;

fm = 50;           % Frequenz der Nachricht [Hz]
fc = 500;         % Frequenz des Trägers [Hz]
kf = 300;          % Frequenzhub (Hz pro Amplitude der Nachricht)

% Nachrichtensignal
m_t = sin(2*pi*fm*t);

% FM-Signal: s(t) = cos(2π f_c t + Δf * ∫ m(τ) dτ)
int_m = cumsum(m_t) / fs;   % numerisches Integral von m(t)
s_t = cos(2*pi*fc*t + 2*pi*kf*int_m);

% Plots
figure;

subplot(1,1,1);
plot(t, s_t/2, 'b');
title('FM-Signal');
xlabel('Zeit [s]'); ylabel('Amplitude');
xlim([0 5/fm]);
ylim([-0.75 0.75]);grid on;
