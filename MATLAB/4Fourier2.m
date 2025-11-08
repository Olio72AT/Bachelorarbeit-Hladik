clc; clear; close all;

% Parameter
x = linspace(0, 2*pi, 360 * 2);  % X-Werte von 0 bis 2π
y1 = sin(10*2*pi*x);                 % Erste Sinuskurve
y2 = sin(30*2*pi*x);               % Zweite Sinuskurve mit 18*f
z1 = zeros(size(x));         % Z = 0 für erste Kurve
z2 = ones(size(x));          % Z = 1 für zweite Kurve
z3 = ones(size(x))+1;        % Z = 2 für Summe der Beiden


%% FFT Analyse
Fs = length(x) / (2*pi);   % Abtastfrequenz (approximiert)
Y = fft(y1 + y2);         % FFT berechnen
L = length(Y);            % Länge des Signals
P2 = abs(Y/L);            % Normalisierte FFT
P1 = P2(1:L/2+1);         % Einseitiges Spektrum
P1(2:end-1) = 2*P1(2:end-1); % Skalierung

f = Fs*(0:(L/2))/L;       % Frequenzachse erstellen

% Frequenzspektrum plotten
figure;
plot(f, P1, 'b o', 'LineWidth', 2);
grid on;
xlabel('Frequenz');
ylabel('Amplitude');
title('Frequenzspektrum der Summen-Sinuskurve');
