% Winkel von 0 bis 360 Grad in 10°-Schritten
k_deg = 0:10:360;
k_rad = deg2rad(k_deg);   % Umrechnung in Radiant

% Komplexe Zahlen auf dem Einheitskreis
z = exp(1i * k_rad);  % e^(ik) = cos(k) + i*sin(k)

% Real- und Imaginärteil extrahieren
x = real(z);
y = imag(z);

% Plot erstellen
figure;
plot(x, y, 'bo-', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');  % Punkte auf Einheitskreis
hold on;
plot(0, 0, 'k+', 'MarkerSize', 10, 'LineWidth', 1.5);          % Ursprung

% Einheitskreis als Linie (optional, wenn viscircles nicht verfügbar)
theta = linspace(0, 2*pi, 1000);
plot(cos(theta), sin(theta), 'k--');  % gestrichelter Kreis

% Punkte beschriften mit Winkel in Grad
for i = 1:length(k_deg)
    text(x(i)*1.1, y(i)*1.1, [num2str(k_deg(i)) '°'], ...
        'HorizontalAlignment', 'center', 'FontSize', 8, 'Color', 'black');
end

% Achsen formatieren
axis equal;
grid on;
xlabel('Realteil');        % X-Achse
ylabel('Imaginärteil');    % Y-Achse
title('Einheitskreis');    % Plot-Titel
