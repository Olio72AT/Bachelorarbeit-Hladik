% ---------------------------------
% Abschwächung vs. Leistungspegel
% ---------------------------------

% Beispiel: Leistungspegel in dB (relativ zu Referenzleistung)
L_dB = [0 -1 -3 -6 -10 -20];   % Pegel (x-Achse)

% Umrechnung in Leistungsverhältnis (P / P_ref)
ratio = 10.^(L_dB/10);

% Abschwächung in %
A_pct = (1 - ratio) * 100;

% Plot
figure;
plot(L_dB, A_pct, 'o-', 'LineWidth', 1.6, 'MarkerSize', 6);
grid on;

xlabel('Leistungspegel L_P (dB)');
ylabel('Abschwächung (%)');
title('Abschwächung der Leistung als log. Pegel (dB)');
