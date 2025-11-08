clc; clear; close all;

% Parameter
fs = 1000;              % Abtastrate (Hz)
t = 0:1/fs:2;           % Zeitachse (2 Sekunden)
f = 2;                  % Sinusfrequenz (Hz)

% Amplitude steigt linear an
A = linspace(0,2,length(t));   % von 0 bis 2

% Sinussignal mit steigender Amplitude
x = A .* sin(2*pi*f*t);

% Sättigungsgrenze
sat_limit = 1.0;

% Clipping ab halber Zeit
y = x;
y(t >= max(t)/2) = min(max(x(t >= max(t)/2), -sat_limit), sat_limit);

% Plot
figure('Color','w');
plot(t, x, 'b--', 'LineWidth', 1.2, 'DisplayName','Originaler Sinus (ansteigende Amplitude)');
hold on;
plot(t, y, 'r', 'LineWidth', 2, 'DisplayName','Mit Sättigung ab Hälfte');
yline(sat_limit,'k--','+Sättigung');
yline(-sat_limit,'k--','-Sättigung');
xlabel('Zeit (s)');
ylabel('Amplitude');
title('Sinus mit ansteigender Amplitude und Sättigung ab 1 Sekunde');
% legend('Location','southoutside','Orientation','horizontal');
grid on;
