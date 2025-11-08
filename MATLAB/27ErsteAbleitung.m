% MATLAB-Skript: Zufälliges Signal und seine Ableitung
clc; clear; close all;

% Parameter
Fs = 1000;            % Abtastrate [Hz]
T  = 1/Fs;            % Abtastintervall
t  = 0:T:0.1;           % Zeitachse (1 Sekunde)

% Zufälliges Signal (z. B. gefiltertes Rauschen)
x = randn(size(t));              % weißes Rauschen
x = filter(ones(1,20)/20,1,x);   % leicht glätten

% Erste Ableitung (numerisch als Differenzquotient)
dx = diff(x)/T;      % Ableitung
t_dx = t(1:end-1);   % Zeitachse anpassen

% Plot
figure('Color','w');
subplot(2,1,1);
plot(t,x,'b','LineWidth',1.5);
xlabel('Zeit [s]'); ylabel('Amplitude');
title('Mess-Signal');
grid on;

subplot(2,1,2);
plot(t_dx,dx,'r','LineWidth',1.5);
xlabel('Zeit [s]'); ylabel('d/dt');
title('Erste Ableitung des Signals');
grid on;
