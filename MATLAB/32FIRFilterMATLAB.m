%% FIR Filter 3. Ordnung – Beispiel
clear; close all; clc;

% Beispielkoeffizienten (Tiefpass-Charakter, gleitender Mittelwert)
b = [0.25 0.25 0.25 0.25];   % 4 Koeffizienten -> 3. Ordnung
a = 1;                       % da FIR, keine Rückkopplung

% Testsignal: Sinus + Rauschen
Fs = 2000;
t = 0:1/Fs:0.2;
x = sin(2*pi*50*t) + 0.5*sin(2*pi*200*t) + 0.3*randn(size(t));

% Filterung
y = filter(b, a, x);

% Plot
figure('Name','FIR Filter 3. Ordnung');
subplot(2,1,1);
plot(t, x); grid on;
title('Eingangssignal (Sinus 50 Hz + 200 Hz + Rauschen)');
xlabel('Zeit [s]'); ylabel('x[n]');

subplot(2,1,2);
plot(t, y); grid on;
title('Gefiltertes Signal (FIR 3. Ordnung)');
xlabel('Zeit [s]'); ylabel('y[n]');

% Frequenzgang
figure;
freqz(b, a, 512, Fs);
title('Frequenzgang des FIR 3. Ordnung');
