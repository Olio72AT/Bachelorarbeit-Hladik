% Komplexe Zahl definieren
z = 4 + 3i;

% Real- und Imaginärteil
x = real(z);
y = imag(z);

% Betrag (Amplitude) und Winkel (Argument)
amplitude = abs(z);
theta_rad = angle(z);
theta_deg = rad2deg(theta_rad);

% Plot vorbereiten
figure;
hold on;
grid on;
axis equal;

% Vektor zeichnen (als Pfeil)
quiver(0, 0, x, y, 0, 'LineWidth', 2, 'Color', 'b', 'MaxHeadSize', 0.5);
text(x*1.05, y*1.05, ['z = 4 + 3i'], 'FontSize', 10, 'Color', 'b');

% Betrag beschriften
text(x/2, y/3, ['|z| = ' num2str(amplitude, '%.2f')], ...
    'FontSize', 10, 'Color', 'r', 'HorizontalAlignment', 'center');

% Winkelbogen einzeichnen
r_arc = 1;  % Radius des Winkelbogens
phi = linspace(0, theta_rad, 100);
plot(r_arc*cos(phi), r_arc*sin(phi), 'r--');

% Winkeltext
text(r_arc*0.8*cos(theta_rad/2), r_arc*0.8*sin(theta_rad/2), ...
     [num2str(theta_deg, '%.2f') '°'], 'FontSize', 10, 'Color', 'r');

% Achsen
xlabel('Realteil');
ylabel('Imaginärteil');
title('Komplexer Vektor z = 4 + 3i mit Betrag und Winkel');
