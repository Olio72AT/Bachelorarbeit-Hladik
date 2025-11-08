% Gegeben:
R = 15;               % Ohm
C = 100e-6;           % Farad
f = 50;               % Hz
omega = 2 * pi * f;

% Impedanzberechnung
Xc = 1 / (omega * C);
Z = R - 1i * Xc;
phi = angle(Z);       % Phasenwinkel (negativ)
phi_deg = rad2deg(phi);

% Zeitachse
t = linspace(0, 0.1, 100);  % 0 bis 100 ms

% Spannung (Referenz): sinusförmig
U0 = 10;                       % Spannungsspitze in Volt
u = U0 * sin(omega * t);      % Spannungssignal

% Strom: phasenverschoben
I0 = U0 / abs(Z);             % Stromamplitude
i = I0 * sin(omega * t + abs(phi)) * 5;  % Strom eilt vor

% Plot
figure;
plot(t * 1000, u, 'b', 'LineWidth', 2); hold on;  % Spannung
plot(t * 1000, i, 'r--', 'LineWidth', 2);         % Strom
grid on;

xlabel('Zeit [ms]');
ylabel('Amplitude');
title('Sinusförmiger Spannungs- und Stromverlauf mit Phasenverschiebung');
legend('Spannung u(t)', 'Strom i(t)', 'Location', 'best');

% Phasenwinkel anzeigen
text(0, -11.5, sprintf('\\phi = %.1f^\\circ (Strom eilt vor)', abs(phi_deg)), ...
    'FontSize', 12, 'Color', 'k');
