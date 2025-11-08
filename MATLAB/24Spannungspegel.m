% --- Daten (Beispiel) ---
L_dB = [0 -1 -3 -6 -12 -24 -40];   % Pegel (x-Achse) in dB relativ zu U_ref

% --- Abschwächung in % ---
ratio = 10.^(L_dB/20);         % U/U_ref
A_pct = (1 - ratio)*100;

% --- Plot ---
figure;
plot(L_dB, A_pct, 's-', 'LineWidth', 1.6, 'MarkerSize', 6);
grid on;
xlabel('Spannungspegel L_U (dB)');
ylabel('Abschwächung (%)');
title('Abschwächung der Spannung als log. Pegel (dB)');
