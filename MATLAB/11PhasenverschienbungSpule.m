% Gegeben:
R = 15;             % Ohm
L = 50e-3;          % H
f = 50;             % Hz
omega = 2 * pi * f;

% Impedanzberechnung
Xl = omega * L;
Z = R + 1i * Xl;
phi = angle(Z);               % Phasenwinkel in Rad
phi_deg = rad2deg(phi);       % in Grad

% Zeitachse
t = linspace(0, 0.1, 1000);   % 0 bis 100 ms

% Spannung (Referenz)
U0 = 10;                      % Spannungsspitze in V
u = U0 * sin(omega * t);      % Spannungssignal

% Strom (phasennachlaufend)
I0 = U0 / abs(Z);             % Stromamplitude nach Ohm'schem Gesetz
i = I0 * sin(omega * t - abs(phi)) * 5;  % Strom hinkt hinterher

% Plot
figure;
plot(t * 1000, u, 'b', 'LineWidth', 2); hold on;    % Spannung
plot(t * 1000, i, 'r--', 'LineWidth', 2);           % Strom
grid on;

xlabel('Zeit [ms]');
ylabel('Amplitude');
title('Spannungs- und Stromverlauf einer Spule bei 50 Hz');
legend('Spannung u(t)', 'Strom i(t)', 'Location', 'best');

% Phasenwinkel anzeigen
text(0, -11.5 , sprintf('\\phi = %.1f^\\circ (Strom hinkt nach)', phi_deg), ...
    'FontSize', 12, 'Color', 'k');
