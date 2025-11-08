% Beispiel zur Veranschaulichung des Alias-Effekts in der Abtastung

%{

Originalsignal (erste Grafik):
Das Signal mit einer hohen Abtastrate (1000 Hz) zeigt den tatsächlichen
Verlauf einer 50-Hz-Sinuswelle.

Niedrige Abtastrate (zweite Grafik):
Mit einer Abtastrate von 60 Hz (weniger als die Nyquist-Rate von 100 Hz) 
entstehen Fehler durch Aliasing, sodass eine falsche Frequenz beobachtet wird.

Sehr niedrige Abtastrate (dritte Grafik):
Bei einer Abtastrate von 30 Hz tritt ein noch deutlicherer Alias-Effekt auf, 
das Signal erscheint als Sinus mit niedrigerer Frequenz.

%}


% Signalparameter
f_signal = 50;   % Frequenz des Signals (Hz)
t_end = 0.1;     % Signaldauer in Sekunden
fs_high = 1000;  % Hohe Abtastrate (Hz) - Referenz ohne Alias-Effekt

% Zeitvektor für hochauflösende Abtastung (keine Aliasing-Probleme)
t_high = 0:1/fs_high:t_end;
x_high = sin(2 * pi * f_signal * t_high);

% Niedrige Abtastraten (unter der Nyquist-Rate)
fs_low = 60;     % Niedrige Abtastrate (Hz) - Aliasing tritt auf
t_low = 0:1/fs_low:t_end;
x_low = sin(2 * pi * f_signal * t_low);

% Noch niedrigere Abtastrate - stärkerer Aliasing-Effekt
fs_very_low = 30;  
t_very_low = 0:1/fs_very_low:t_end;
x_very_low = sin(2 * pi * f_signal * t_very_low);

% Plot des Signals mit hoher Abtastrate
figure;
subplot(3,1,1);
plot(t_high, x_high, 'b');
hold on;
stem(t_high, x_high, 'ro');
title('Originalsignal (hohe Abtastrate)');
xlabel('Zeit (s)');
ylabel('Amplitude');
grid on;

% Plot des Signals mit niedriger Abtastrate (Aliasing sichtbar)
subplot(3,1,2);
plot(t_high, sin(2 * pi * f_signal * t_high), 'b');
hold on;
stem(t_low, x_low, 'ro', 'MarkerSize', 4);
title('Aliasing-Effekt bei niedriger Abtastrate (fA < 2fmax)');
xlabel('Zeit (s)');
ylabel('Amplitude');
grid on;

% Plot des Signals mit sehr niedriger Abtastrate (stärkerer Aliasing-Effekt)
subplot(3,1,3);
plot(t_high, sin(2 * pi * f_signal * t_high), 'b');
hold on;
stem(t_very_low, x_very_low, 'ro', 'MarkerSize', 4);
title('Stärkerer Aliasing-Effekt bei noch niedrigerer Abtastrate (fA << 2fmax)');
xlabel('Zeit (s)');
ylabel('Amplitude');
grid on;

legend('Originalsignal', 'Abgetastete Werte');

% Erklärung:
% fs_high: Keine Aliasing-Probleme
% fs_low: Unterabtastung verursacht falsche Frequenzwahrnehmung
% fs_very_low: Noch stärkere Verzerrung durch Aliasing