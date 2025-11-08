% Parameter
fs = 1000; % Abtastrate in Hz
t = 0:1/fs:0.2; % Zeitvektor von 0 bis 0.2 Sekunde
N = length(t); % Anzahl der Samples

% Sinusschwingungen
f1 = 50;  % Frequenz der ersten Sinusschwingung
f2 = 120; % Frequenz der zweiten Sinusschwingung
A1 = 1;   % Amplitude der ersten Sinusschwingung
A2 = 1;   % Amplitude der zweiten Sinusschwingung

s1 = A1 * sin(2 * pi * f1 * t);
s2 = A2 * sin(2 * pi * f2 * t);

% Summe bilden und normalisieren
sum_signal = s1 + s2;
normalized_signal = sum_signal / max(abs(sum_signal)); % Normalisierung auf [-1,1]

% Als MATLAB-Datei speichern
save('normalized_sum_signal.mat', 't', 'normalized_signal');

% Daten in eine CSV-Datei speichern
data = [t(:), normalized_signal(:)]; % Zeit und normalisiertes Signal als Spaltenvektoren
csv_filename = 'normalized_sum_signal.csv';
writematrix(data, csv_filename);

% Plot anzeigen
figure;
subplot(3,1,1);
plot(t, s1, 'r');
title(['Sinusschwingung mit ', num2str(f1), ' Hz']);
xlabel('Zeit [s]');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, s2, 'b');
title(['Sinusschwingung mit ', num2str(f2), ' Hz']);
xlabel('Zeit [s]');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, normalized_signal, 'k');
title('Normalisierte Summe der Sinusschwingungen');
xlabel('Zeit [s]');
ylabel('Amplitude');

sgtitle('Sinus-Summenbildung und Normalisierung');

% FFT-Analyse
fft_result = fft(normalized_signal);
fft_magnitude = abs(fft_result) / N;  % Normierung der Amplitude
fft_magnitude = fft_magnitude(1:N/2+1); % Nur positive Frequenzen behalten

% Frequenzachse in Hz
freqs = linspace(0, fs/2, N/2+1);

% Spektrum plotten
figure;
stem(freqs, fft_magnitude, 'b', 'LineWidth', 1.5);
title('Magnitude Spectrum (Positive Frequencies Only)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Neue Analyse: Frequenzen über 100 Hz auf 0 setzen
fft_magnitude(freqs > 100) = 0;

% Gefiltertes Spektrum plotten
figure;
stem(freqs, fft_magnitude, 'r', 'LineWidth', 1.5);
title('Filtered Magnitude Spectrum (Frequencies >100 Hz Set to 0)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% IFFT durchführen
filtered_fft = fft_result;
filtered_fft(freqs > 100) = 0; % Entspricht dem Nullsetzen der Magnituden
ifft_signal = ifft(filtered_fft, 'symmetric');

% Gefiltertes Signal im Zeitbereich plotten
figure;
plot(t, ifft_signal, 'g');
title('Rekonstruiertes Signal nach IFFT');
xlabel('Zeit [s]');
ylabel('Amplitude');
grid on;
