% Wertebereich definieren
x = -2:0.1:2;

% Funktion und Ableitung berechnen
f = exp(x);      % f(x) = e^x
df = exp(x);     % f'(x) = e^x (Ableitung)
e_val = exp(1);  % eulersche Zahl bei x = 1

% Plot erstellen
figure;
plot(x, f, 'b-', 'LineWidth', 2);      % Funktion in Blau
hold on;
plot(x, df, 'r--', 'LineWidth', 2);    % Ableitung in Rot gestrichelt

% Horizontale Linie bei y = e (Euler'sche Zahl)
yline(e_val, 'k:', 'LineWidth', 1.5);  % schwarze gepunktete Linie
% Markierungspunkt bei x=1
plot(1, e_val, 'ko', 'MarkerFaceColor', 'k');

% Achsen und Titel beschriften
xlabel('x');
ylabel('Wert');
title('f(x) = e^x, f''(x) = e^x und e bei x = 1');
legend('f(x) = e^x', 'f''(x) = e^x', 'y = e', 'e bei x=1', 'Location', 'northwest');
grid on;
