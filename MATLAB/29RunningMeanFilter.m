% Parameterdefinition
srate = 1000; % Abtastrate in Hz
duration = 3; % Signal-Dauer in Sekunden
time = 0:1/srate:duration;
n = length(time);
poles = 15; % Polstellen für zufällige Interpolation

% Rauschlevel (Standardabweichung)
noise_amp = 5; 

% Erzeuge das Signal mit zufälliger Amplitudenmodulation
amplitude_modulation = interp1(rand(poles,1)*30, linspace(1,poles,n));
noise = noise_amp * randn(size(time));
signal = amplitude_modulation + noise;

% Initialisierung des gefilterten Signals
filtered_signal = zeros(size(signal));

% Implementierung des gleitenden Mittelwertfilters
window_half_size = 40; % Tatsächliche Fenstergröße ist 2*k+1
for i = window_half_size+1 : n-window_half_size-1
    filtered_signal(i) = mean(signal(i-window_half_size : i+window_half_size));
end

% Berechnung der Fenstergröße in Millisekunden
window_size_ms = 1000 * (2*window_half_size+1) / srate;

% Plotten der Signale
figure(1), clf, hold on
plot(time, signal, time, filtered_signal, 'linew', 2)

% Markierung der Fenstergröße im Plot
target_index = dsearchn(time',1);
y_limits = get(gca, 'ylim');
patch(time([target_index-window_half_size target_index-window_half_size target_index+window_half_size target_index+window_half_size]), ...
      y_limits([1 2 2 1]), 'k', 'facealpha', 0.25, 'linestyle', 'none')
plot(time([target_index target_index]), y_limits, 'k--')

% Achsenbeschriftung und Titel
xlabel('Zeit (Sekunden)')
ylabel('Amplitude')
title(['Gleitender Mittelwertfilter mit k = ' num2str(round(window_size_ms)) '-ms Fenster'])
legend({'Originalsignal', 'Gefiltertes Signal', 'Fensterbereich', 'Fensterzentrum'})

zoom on