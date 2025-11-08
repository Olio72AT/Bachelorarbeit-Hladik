% --------------------------------------------------------
% FIR-Demonstration: 8 Speicherplätze mit Zufallswerten
% Quadrate von dunkelgrün bis hellgrün eingefärbt
% --------------------------------------------------------

clear; clc; close all;

% Zufallswerte für 8 Speicherzellen
nums = randi([-50,50],1,8);

% Plot vorbereiten
figure('Color','w'); 
axis equal off; 
hold on;

% Anzahl Kästchen
N = length(nums);

% Grünverlauf (RGB von dunkelgrün -> hellgrün)
greens = [linspace(0,0.6,N)', linspace(0.5,1,N)', linspace(0,0.5,N)'];

for k = 1:N
    % Position des Quadrats (nebeneinander)
    x0 = (k-1)*1.2;   % horizontale Verschiebung
    y0 = 0;
    
    % Quadrat zeichnen mit Farbe
    rectangle('Position',[x0,y0,1,1], ...
              'FaceColor',greens(k,:), ...
              'EdgeColor','k','LineWidth',1.5);
    
    % Zahl mittig eintragen
    text(x0+0.5, y0+0.5, num2str(nums(k)), ...
        'HorizontalAlignment','center', ...
        'VerticalAlignment','middle', ...
        'FontSize',12,'FontWeight','bold');
    
    % z-Beschriftung darunter
    text(x0+0.5, y0-0.4, sprintf('z^{-%d}', N-k), ...
        'HorizontalAlignment','center', ...
        'FontSize',11);
end

xlim([-0.5, N*1.2]); ylim([-1,1.5]);

title('Historische Verlaufs-Abtastwerte: z^{-k}-Indizes');
