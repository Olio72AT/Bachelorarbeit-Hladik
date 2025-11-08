clc; clear; close all;

% Parameter
T = 2*pi; % Periode des Signals
t = linspace(0, T, 1000); % Zeitachse
N = 10; % Anzahl der verwendeten Harmonischen

% Rechtecksignal als Fourier-Reihe
square_signal = 0; % Initialisieren

% Berechnung der Fourier-Reihe
for k = 1:2:N  % Nur ungerade Harmonische
    square_signal = square_signal + (4 / (k * pi)) * sin(k * (2*pi/T) * t);
end

% Plot der Fourier-Reihe und der einzelnen Grundschwingungen
figure;
hold on;
plot(t, square_signal, 'k', 'LineWidth', 2, 'DisplayName', 'Rechteck (Fourier)');

% Einzelne Sinusschwingungen darstellen
for k = 1:2:N
    component = (4 / (k * pi)) * sin(k * (2*pi/T) * t);
    plot(t, component, '--', 'LineWidth', 1, 'DisplayName', ['k = ', num2str(k)]);
end

title('Fourier-Reihe eines Rechtecksignals');
xlabel('Zeit t');
ylabel('Amplitude');
legend;
grid on;
hold off;
