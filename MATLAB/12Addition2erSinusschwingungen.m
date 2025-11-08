% Parameter
f = 1;                 % Frequenz in Hz
T = 1/f;               % Periodendauer
t = linspace(0, 2*T, 1000);  % Zeitvektor für zwei Perioden
A = 1;                 % Amplitude
phi = pi;              % 180 Grad Phasenverschiebung = pi rad

% Sinusschwingungen
s1 = A * sin(2*pi*f*t);
s2 = A * sin(2*pi*f*t + phi);
s_sum = s1 + s2;

% Plot der Schwingungen
figure;
subplot(2,1,1);
plot(t, s1, 'b', t, s2, 'r--', t, s_sum, 'k', 'LineWidth', 1.5);
legend('s1: sin(\omega t)', 's2: sin(\omega t + \pi)', 's1 + s2');
xlabel('Zeit (s)');
ylabel('Amplitude');
title('Zwei 180° phasenverschobene Sinusschwingungen und ihre Summe');
grid on;

% Vektordarstellung
subplot(2,1,2);
theta = linspace(0, 2*pi, 100);
circle = exp(1j*theta);  % Einheitskreis
v1 = A * exp(1j*0);      % Vektor 1 bei 0°
v2 = A * exp(1j*phi);    % Vektor 2 bei 180°

plot(real(circle), imag(circle), 'k:'); hold on;
quiver(0, 0, real(v1), imag(v1), 0, 'b', 'LineWidth', 2);
quiver(0, 0, real(v2), imag(v2), 0, 'r--', 'LineWidth', 2);
quiver(0, 0, real(v1+v2), imag(v1+v2), 0, 'k', 'LineWidth', 2);

legend('Einheitskreis', 'Vektor s1', 'Vektor s2', 'Summe');
axis equal;
axis([-1.5 1.5 -1.5 1.5]);
xlabel('Realteil');
ylabel('Imaginärteil');
title('Vektordarstellung der Schwingungen');
grid on;
