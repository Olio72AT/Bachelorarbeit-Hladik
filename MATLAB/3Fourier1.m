clc; clear; close all;

% Parameter
x = linspace(0, 2*pi, 100);  % X-Werte von 0 bis 2π
y1 = sin(x);                 % Erste Sinuskurve
y2 = sin(2*x);               % Zweite Sinuskurve mit 2*f
z1 = zeros(size(x));         % Z = 0 für erste Kurve
z2 = ones(size(x));          % Z = 1 für zweite Kurve
z3 = ones(size(x))+1;        % Z = 2 für Summe der Beiden


% 3D-Plot erstellen
figure;
hold on;
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Plot: Sinus mit normaler und doppelter Frequenz');

% Zeichne die erste Sinuskurve bei Z = 0
plot3(x, y1, z1, 'b', 'LineWidth', 2);

% Zeichne die zweite Sinuskurve bei Z = 1
plot3(x, y2, z2, 'r', 'LineWidth', 2);

% Zeichne die zweite Sinuskurve bei Z = 2
plot3(x, y1+y2, z3, 'g', 'LineWidth', 2);


legend('Sinus f', 'Sinus 2*f', 'Sum of both');
view(0,90); % 3D-Ansicht aktivieren
axis tight;
hold off;
