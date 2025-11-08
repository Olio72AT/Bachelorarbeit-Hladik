clc; clear; close all;

% Parameter
T = 2*pi; % Periode des Signals
t = linspace(0, T, 1000); % Zeitachse
N = 5; % Anzahl der verwendeten Harmonischen

% Sägezahnsignal als Fourier-Reihe
sawtooth_signal = 0; % Initialisieren

% Berechnung der Fourier-Reihe
for k = 1:N
    sawtooth_signal = sawtooth_signal + (-1)^k * (2 / (k * pi)) * sin(k * (2*pi/T) * t);
end

% Normiertes Sägezahnsignal
sawtooth_signal = sawtooth_signal + 0.5;

% Plot der Fourier-Reihe und der einzelnen Grundschwingungen
figure;
hold on;
plot(t, sawtooth_signal, 'k', 'LineWidth', 2, 'DisplayName', 'Sägezahn (Fourier)');

% Einzelne Sinusschwingungen darstellen
for k = 1:N
    component = (-1)^k * (2 / (k * pi)) * sin(k * (2*pi/T) * t);
    plot(t, component + 0.5, '--', 'LineWidth', 1, 'DisplayName', ['k = ', num2str(k)]);
end

title('Fourier-Reihe eines Sägezahnsignals');
xlabel('Zeit t');
ylabel('Amplitude');
legend;
grid on;
hold off;
