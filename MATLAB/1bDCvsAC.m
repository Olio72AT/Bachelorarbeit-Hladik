% Gleichspannung vs. Wechselstrom

% Zeitvektor
t = 0:0.001:1; % 1 Sekunde bei 1 kHz Abtastfrequenz

% Gleichspannungssignal (DC)
U_dc = 5 * ones(size(t)); % konstante Spannung 5 V

% Wechselspannungssignal (AC), sinusförmig
f_ac = 10; % Frequenz 10 Hz
U_ac = 5 * sin(2 * pi * f_ac * t); % Amplitude 5 V

% Darstellung
figure;
subplot(2,1,1);
plot(t, U_dc, 'r');
title('Gleichspannung (DC)');
xlabel('Zeit [s]');
ylabel('Spannung [V]');
grid on;

subplot(2,1,2);
plot(t, U_ac, 'b');
title('Sinus Wechselspannung (AC) - 10 Hz');
xlabel('Zeit [s]');
ylabel('Spannung UaAC [V]');
grid on;
