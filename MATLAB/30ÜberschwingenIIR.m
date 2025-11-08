% --- Parameter ------------------------------------------------------------
b1   = 0.7;
b2s  = [-0.50 0.00 0.30 0.60 0.90];   % Werte für b2
a    = [1 0.2 0.1];                   % Zähler-Koeffizienten N(z) = a0 + a1 z^-1 + a2 z^-2
Nw   = 4096;                          % Frequenzauflösung
w    = linspace(0, 4*pi, Nw);         % 0 ... 4π
z    = exp(1j*w);

% --- Plot |D(e^{jω})| ----------------------------------------------------
figure; hold on
for k = 1:numel(b2s)
    b2 = b2s(k);
    D  = 1 - b1./z - b2./(z.^2);
    plot(w, abs(D), 'LineWidth', 1.5, 'DisplayName', sprintf('|D|, b2=%.2f', b2));
end
hold off; grid on; grid minor
xlabel('\omega (rad)')
ylabel('|D(e^{j\omega})|')
title('Nenner für D(z) = 1-b_1z^{-1}-b_2z^{-2} bei konst. b1= 0.7')
legend('Location','northwest')
set(gca,'FontName','Helvetica','FontSize',12,'LineWidth',1)
xlim([0 4*pi])

% --- Plot |H(e^{jω})| ----------------------------------------------------
figure; hold on
for k = 1:numel(b2s)
    b2 = b2s(k);
    D  = 1 - b1./z - b2./(z.^2);
    N  = a(1) + a(2)./z + a(3)./z.^2;
    H  = N ./ D;
    plot(w, abs(H), 'LineWidth', 1.5, 'DisplayName', sprintf('|H|, b2=%.2f', b2));
end
hold off; grid on; grid minor
xlabel('\omega (rad)')
ylabel('|H(e^{j\omega})|')
title('|H(e^{j\omega})| für Beispiel-N(z)')
legend('Location','northwest')
set(gca,'FontName','Helvetica','FontSize',12,'LineWidth',1)
xlim([0 4*pi])
