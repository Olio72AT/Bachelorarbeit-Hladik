% Invertierter Sägezahn (langsam fallend, schnell steigend)

clear; clc; close all;

A = 1;          % Amplitude
f0 = 50;        % Grundfrequenz
T = 1/f0;
Fs = 10000;     % Abtastfrequenz
t = 0:1/Fs:2*T;

N = 20; % Anzahl der Harmonischen

x = zeros(size(t));
for n = 1:N
    x = x + ((-1)^(n+1)) * (1/n) * sin(2*pi*n*f0*t);
end
x = -(2*A/pi) * x;  % Vorzeicheninvertiert

% Vergleich mit MATLAB-Sägezahn
x_saw_inv = -A * sawtooth(2*pi*f0*t); % langsam fallend, schnell steigend

% Plot
figure;
plot(t, x, 'r', 'LineWidth', 1.5); hold on;
plot(t, x_saw_inv, 'k--');
legend('Fourier (invertiert)', 'MATLAB: -sawtooth()');
title(['Sägezahnsignal (langsam fallend, schnell steigend) mit ', num2str(N), ' Harmonischen']);
xlabel('Zeit [s]');
ylabel('Amplitude');
xlim([0 2*T]);
grid on;
