% --------------------------------------------------------
% FIR-Demo: 8 Koeffizienten * 8 Abtastwerte
% Darstellung mit Multiplikation (×) und Addition (+)
% --------------------------------------------------------

clear; clc; close all;

% --- Daten ----------------------------------------------------
N = 8;
coeffs = randi([-50,50], 1, N) / 100;       % 0.01 ... .5
nums   = randi([-50,50], 1, N);       % Zufallswerte

% --- Layout ---------------------------------------------------
w = 1;               % Quadratbreite
gap = 0.5;             % horizontaler Abstand
xpos = (0:N-1) * (w+gap);
yLower = 0;            % y für Abtastwerte
yUpper = 2.0;          % y für Koeffizienten
ySymbol = (yLower + yUpper)/2; % y für Multiplikationszeichen

figure('Color','w'); axis equal off; hold on;

% Farbverlauf für Abtastwerte
greens = [linspace(0,0.6,N)', linspace(0.5,1,N)', linspace(0,0.5,N)'];

% ===== obere Reihe: Koeffizienten ==============================
for k = 1:N
    x0 = xpos(k);
    rectangle('Position',[x0, yUpper, w, w], ...
              'FaceColor',[0.92 0.92 0.92], ...
              'EdgeColor','k','LineWidth',1.5);
    text(x0 + w/2, yUpper + w/2, sprintf('%.1f', coeffs(k)), ...
        'HorizontalAlignment','center', 'VerticalAlignment','middle', ...
        'FontSize',12,'FontWeight','bold');
end
text(mean([xpos(1), xpos(end)+w]), yUpper + w + 0.5, 'Koeffizienten', ...
    'HorizontalAlignment','center','FontSize',12,'FontWeight','bold');

% ===== untere Reihe: Abtastwerte + z^{-k} =====================
for k = 1:N
    x0 = xpos(k);
    rectangle('Position',[x0, yLower, w, w], ...
              'FaceColor',greens(k,:), ...
              'EdgeColor','k','LineWidth',1.5);
    % Zahl
    text(x0 + w/2, yLower + w/2, num2str(nums(k)), ...
        'HorizontalAlignment','center', 'VerticalAlignment','middle', ...
        'FontSize',12,'FontWeight','bold');
    % z^{-k}
    text(x0 + w/2, yLower - 0.4, sprintf('z^{-%d}', N-k), ...
        'HorizontalAlignment','center', 'FontSize',11);
end
text(mean([xpos(1), xpos(end)+w]), yLower - 1.0, 'Abtastwerte', ...
    'HorizontalAlignment','center','FontSize',12,'FontWeight','bold');

% ===== Multiplikationszeichen zwischen den Reihen ==============
for k = 1:N
    x0 = xpos(k);
    text(x0 + w/2, ySymbol+0.5, '×', ...
        'HorizontalAlignment','center', 'VerticalAlignment','middle', ...
        'FontSize',16,'FontWeight','bold');
end

% ===== Pluszeichen zwischen den Spalten ========================
for k = 1:N-1
    x0 = xpos(k) + w + gap/2;
    text(x0, ySymbol-0.5, '+', ...
        'HorizontalAlignment','center', 'VerticalAlignment','middle', ...
        'FontSize',16,'FontWeight','bold','Color',[0.2 0.2 0.2]);
end

% Achsenbereich
xlim([-0.5, xpos(end)+w+0.5]);
ylim([-1.2, yUpper + w + 1.0]);
title('FIR: Summe der Produkte (Σ h[k] · x[n-k])');
