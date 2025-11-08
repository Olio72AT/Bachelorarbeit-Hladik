% Gegeben:
R = 15;              % Ohm
C = 100e-6;          % Farad
f = 50;              % Hz
omega = 2 * pi * f;

% Komplexe Impedanz
Z = R + 1 / (1i * omega * C);

% Real- und Imaginärteil
ReZ = real(Z);
ImZ = imag(Z);

% Phasenwinkel (in Radiant und Grad)
phi = atan(ImZ / ReZ);  % Achtung: ImZ ist negativ bei kapazitivem Z
phi_deg = rad2deg(phi);

% Plot als Vektordiagramm (komplexe Ebene)
figure;
quiver(0, 0, ReZ, 0, 0, 'r', 'LineWidth', 2); hold on;   % Realteil-Vektor
quiver(ReZ, 0, 0, ImZ, 0, 'b', 'LineWidth', 2);          % Imaginärteil-Vektor
quiver(0, 0, ReZ, ImZ, 0, 'k', 'LineWidth', 2);          % Gesamt-Z-Vektor

% Phasenwinkel-Bogen zeichnen
r = 5;  % Radius für den Winkelbogen
theta = linspace(0, phi, 100);
plot(r * cos(theta), r * sin(theta), 'm', 'LineWidth', 1.5);  % Winkelbogen
text(r * cos(phi/2), r * sin(phi/2), sprintf('\\phi = %.1f^\\circ', phi_deg), ...
    'FontSize', 12, 'Color', 'm', 'HorizontalAlignment', 'left');

% Darstellung
grid on;
axis equal;
xlabel('Realteil [\Omega]');
ylabel('Imaginärteil [\Omega]');
title('Komplexe Impedanzdarstellung mit Phasenverschiebung');
legend('Ohmscher Anteil (R)', 'Kapazitiver Anteil (X_C)', ...
       'Gesamtimpedanz Z', 'Phasenwinkel \phi', 'Location', 'best');
