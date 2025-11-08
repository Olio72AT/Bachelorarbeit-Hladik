%% Chebyshev Typ II – Rechteckimpuls als Eingang
Fs   = 1000;          % Abtastrate [Hz]
Fp   = 50;            % Passbandgrenze [Hz]
Fs_s = 80;            % Stopbandgrenze [Hz]
Rp   = 1;             % Passband-Welligkeit [dB] (nur fuer Vergleich)
Rs   = 40;            % Stopbanddämpfung [dB]

% Normierte Frequenzen
Wp = Fp/(Fs/2);
Ws = Fs_s/(Fs/2);

% Filterentwurf Chebyshev Typ II
[n, Wn] = cheb2ord(Wp, Ws, Rp, Rs);
[b,a]   = cheby2(n, Rs, Wn, 'low');

%% Eingang: Rechteckimpuls
N  = 200;              % Länge
x  = zeros(N,1);
x(20:100) = 1;         % Rechteck von n=20...100

%% Ausgang
y = filter(b,a,x);

%% Plot
figure('Color','w'); hold on; grid on;
stem(0:N-1, x, 'filled','DisplayName','Eingang Rechteck');
plot(0:N-1, y, 'r','LineWidth',1.5,'DisplayName','Ausgang Cheb II');
xlabel('n (Samples)');
ylabel('Amplitude');
title(sprintf('Rechteckimpuls durch Chebyshev Typ II (n=%d)', n));
legend('Location','best');
