%% Spezifikation
fs  = 1000;              % Abtastrate [Hz]
fp  = 50;                % Passbandgrenze [Hz]
fsb = 80;                % Sperrbandgrenze [Hz]
Rp  = 0.5;               % Passband-Welligkeit [dB] -> "leichtes" Überschwingen
Rs  = 40;                % Sperrbanddaempfung [dB]

Wp = fp/(fs/2);          % normierte Frequenzen (Nyquist = 1)
Ws = fsb/(fs/2);

%% Minimale Ordnung bestimmen und Chebyshev-I-Filter entwerfen
[n, Wn] = cheb1ord(Wp, Ws, Rp, Rs);     % erforderliche Ordnung
[b, a]  = cheby1(n, Rp, Wn, 'low');     % ZTF-Koeffizienten (direkte Form)

[sos,g] = tf2sos(b,a);
% y = sosfilt(sos, x);          % g kann bei Bedarf mit sosfilt zusammen genutzt werden:
y = sosfilt(sos, x * g);    % oder mit 'ScaleValues' ausmultiplizieren


%% Kontrolle: Amplitudengang
fvtool(Hd); grid on;                     % zeigt u.a. Passband-Welligkeit

%% Testsignal: Sprungantwort (zeigt das Überschwingen)
N   = 2000;
u   = ones(N,1);                         % Einheitssprung
y   = Hd(u);                             % Filterausgang

% Überschwingen in %
y_inf  = mean(y(end-200:end));           % Endwert (Mittel der letzten Samples)
OS_pct = (max(y) - y_inf)/y_inf * 100;

fprintf('Filterordnung n = %d, Überschwingen ≈ %.2f %%\n', n, OS_pct);

figure; 
plot(y,'LineWidth',1.2); hold on; yline(y_inf,'--'); 
xlabel('n'); ylabel('Amplitude'); title('Sprungantwort (Chebyshev I)');
grid on;

%% Optional: Impulsantwort
% figure; impz(sos, g, 512); grid on;
