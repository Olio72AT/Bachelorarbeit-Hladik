% Parameter
f = 10;               % Signal-Frequenz in Hz
fs = 1000;            % Abtastrate in Hz
T = 1/fs;             
L = 1000;             % Länge des Signals (1 Sekunde)
t = (0:L-1)*T;        % Zeitvektor
phi = pi;             % 180 Grad

% Sinusschwingungen mit Euler
s1 = exp(1j * 2*pi*f*t);           % e^(jωt)
s2 = exp(1j * (2*pi*f*t + phi));   % e^(j(ωt + π)) = -e^(jωt)
s_sum = s1 + s2;

% --- Leistungsspektrum berechnen ---
S1 = fft(s1);
S2 = fft(s2);
Ssum = fft(s_sum);

% Einseitige Leistungsspektren
P1 = abs(S1/L).^2;
P2 = abs(S2/L).^2;
Psum = abs(Ssum/L).^2;

% Nur erste Hälfte der FFT (einseitig)
N = L/2 + 1;
f_axis = fs*(0:(N-1))/L;

% Leistungsspektren normieren
P1 = P1(1:N); P2 = P2(1:N); Psum = Psum(1:N);
P1(2:end-1) = 2*P1(2:end-1);
P2(2:end-1) = 2*P2(2:end-1);
Psum(2:end-1) = 2*Psum(2:end-1);

% --- Plot ---
figure;
subplot(3,1,1);
plot(f_axis, 10*log10(P1), 'b');
title('Leistungsspektrum von s_1(t)');
ylabel('Leistung [dB]');
grid on;

subplot(3,1,2);
plot(f_axis, 10*log10(P2), 'r--');
title('Leistungsspektrum von s_2(t) (180° phasenverschoben)');
ylabel('Leistung [dB]');
grid on;

subplot(3,1,3);
plot(f_axis, 10*log10(Psum), 'k');
title('Leistungsspektrum von s_1(t) + s_2(t)');
xlabel('Frequenz (Hz)');
ylabel('Leistung [dB]');
grid on;
