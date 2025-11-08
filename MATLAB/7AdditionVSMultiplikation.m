% Fourier-Analyse: Addition und Multiplikation im Zeit- und Frequenzbereich

clear; clc; close all;

% Zeitachse
Fs = 1000;         % Abtastrate
T = 1/Fs;
t = 0:T:1-T;       % 1 Sekunde

% Zwei Cosinus-Signale (periodisch)
f1 = 50;           % 50 Hz
f2 = 120;          % 120 Hz

x1 = cos(2*pi*f1*t);
x2 = cos(2*pi*f2*t);

% Addition im Zeitbereich
x_add = x1 + x2;

% Multiplikation im Zeitbereich
x_mult = x1 .* x2;

% FFT-Berechnung (für Frequenzbereich)
N = length(t);
f = Fs*(0:N-1)/N;

X1 = abs(fft(x1))/N;
X2 = abs(fft(x2))/N;
X_add = abs(fft(x_add))/N;
X_mult = abs(fft(x_mult))/N;

% === Plot ===

figure('Name','Fourier-Reihe: Addition vs. Multiplikation','NumberTitle','off');

% Zeitbereich
subplot(4,2,1); plot(t, x1); title('x_1(t) = cos(2\pi50t)'); grid on; xlim([0 0.1]);
subplot(4,2,3); plot(t, x2); title('x_2(t) = cos(2\pi120t)'); grid on; xlim([0 0.1]);
subplot(4,2,5); plot(t, x_add); title('Addition: x_1(t) + x_2(t)'); grid on; xlim([0 0.1]);
subplot(4,2,7); plot(t, x_mult); title('Multiplikation: x_1(t) * x_2(t)'); grid on; xlim([0 0.1]);

% Frequenzbereich
subplot(4,2,2); stem(f, X1); title('|X_1(f)|'); xlim([0 300]); grid on;
subplot(4,2,4); stem(f, X2); title('|X_2(f)|'); xlim([0 300]); grid on;
subplot(4,2,6); stem(f, X_add); title('|X_{add}(f)|'); xlim([0 300]); grid on;
subplot(4,2,8); stem(f, X_mult); title('|X_{mult}(f)|'); xlim([0 300]); grid on;
