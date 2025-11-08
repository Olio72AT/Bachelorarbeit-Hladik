clc; clear; close all;

% Parameter
fs = 1000;                 % Abtastrate [Hz]
T = 1;                     % Signaldauer [s]
t = 0:1/fs:T-1/fs;         % Zeitachse

% Beispielsignal: Überlagerung zweier Sinusse
f1 = 50; f2 = 150; 
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t + pi/4);

% FFT berechnen
N = length(x);
X = fft(x);
f = (0:N-1)*(fs/N);        % Frequenzachse [Hz]

% Nur erste Hälfte (positive Frequenzen)
halfN = floor(N/2);
X = X(1:halfN);
f = f(1:halfN);

% Betragsspektrum
magX = abs(X);

% Phasenspektrum
phaseX = angle(X);  % Phase in Radiant

% Plots
figure;

subplot(2,1,1);
stem(f, magX, 'LineWidth',1.5);
title('Betragsspektrum');
xlabel('Frequenz [Hz]'); ylabel('|X(f)|');
grid on; xlim([0 fs/2]);

subplot(2,1,2);
stem(f, phaseX, 'r','LineWidth',1.5);
title('Phasenspektrum');
xlabel('Frequenz [Hz]'); ylabel('Phase [rad]');
grid on; xlim([0 fs/2]);
