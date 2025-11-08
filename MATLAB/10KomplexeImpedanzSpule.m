% Gegeben:
R = 15;            % Ohm
L = 50e-3;         % H (50 mH)
f = 50;            % Hz
omega = 2 * pi * f;

% Impedanzberechnung
Xl = omega * L;                % Induktiver Blindwiderstand
Z = R + 1i * Xl;               % Gesamtimpedanz (komplex)
phi = angle(Z);                % Phasenwinkel in Rad
phi_deg = rad2deg(phi);        % in Grad

% Real- und Imaginärteil
ReZ = real(Z);
ImZ = imag(Z);

% Vektordiagramm
figure;
quiver(0, 0, ReZ, 0, 0, 'r', 'LineWidth', 2); hold on;      % Realteil-Vektor
quiver(ReZ, 0, 0, ImZ, 0, 'b', 'LineWidth', 2);             % Imaginärteil-Vektor
quiver(0, 0, ReZ, ImZ, 0, 'k', 'LineWidth', 2);             % Gesamtimpedanz-Vektor

% Winkelbogen (Phasenverschiebung)
r = 5;                                % Radius für Winkelbogen
theta = linspace(0, phi, 100);
plot(r * cos(theta), r * sin(theta), 'm', 'LineWidth', 1.5);
text(r * cos(phi/2), r * sin(phi/2), ...
    sprintf('\\phi = %.1f^\\circ', phi_deg), ...
    'FontSize', 12, 'Color', 'm', 'HorizontalAlignment', 'left');

% Darstellung
grid on;
axis equal;
xlabel('Realteil [\Omega]');
ylabel('Imaginärteil [\Omega]');
title('Komplexe Impedanz einer Spule bei 50 Hz');
legend('Ohmscher Anteil (R)', 'Induktiver Anteil (X_L)', ...
       'Gesamtimpedanz Z', 'Phasenwinkel \phi', 'Location', 'best');
