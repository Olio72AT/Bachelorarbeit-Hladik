% Parameter
f = 1;                     % Frequenz in Hz
T = 1/f;                   % Periodendauer
t = linspace(0, 2*T, 1000);
omega = 2*pi*f;            % Kreisfrequenz
A = 1;                     % Amplitude

% Komplexe Exponentialdarstellung
s1 = A * exp(1j * omega * t);          % e^(jωt)
s2 = A * exp(1j * (omega * t + pi));   % e^(j(ωt + π)) = -e^(jωt)
s_sum = s1 + s2;

% Realteil extrahieren für Sinusvergleich
s1_real = real(s1);
s2_real = real(s2);
s_sum_real = real(s_sum);

% --- Plots ---
figure;

% Zeitbereich: Realteile
subplot(2,1,1);
plot(t, s1_real, 'b', t, s2_real, 'r--', t, s_sum_real, 'k', 'LineWidth', 1.5);
legend('Re(s1)', 'Re(s2)', 'Re(s1 + s2)');
xlabel('Zeit (s)');
ylabel('Amplitude');
title('Addition zweier phasenverschobener Signale: Realteile');
grid on;

% Vektordarstellung
subplot(2,1,2);
theta = linspace(0, 2*pi, 100);
circle = exp(1j*theta);
v1 = A * exp(1j*0);      % e^j0
v2 = A * exp(1j*pi);     % e^jπ = -1

plot(real(circle), imag(circle), 'k:'); hold on;
quiver(0, 0, real(v1), imag(v1), 0, 'b', 'LineWidth', 2);
quiver(0, 0, real(v2), imag(v2), 0, 'r--', 'LineWidth', 2);
quiver(0, 0, real(v1+v2), imag(v1+v2), 0, 'k', 'LineWidth', 2);
legend('Einheitskreis', 'e^{j0}', 'e^{j\pi}', 'Summe');
axis equal;
axis([-1.5 1.5 -1.5 1.5]);
xlabel('Realteil');
ylabel('Imaginärteil');
title('Vektordarstellung im Komplexraum');
grid on;
