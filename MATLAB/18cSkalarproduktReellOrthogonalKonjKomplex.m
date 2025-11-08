

A = [2, 1i];
B = [-1, 2i];

skalarprodukt = A * B';  % falsch für komplexe Vektoren
skalarprodukt_konjugiert = A * conj(B)';  % korrekt für komplexe Skalarprodukte

disp(['Skalarprodukt: ', num2str(skalarprodukt)]);
disp(['Skalarprodukt (konjugiert): ', num2str(skalarprodukt_konjugiert)]);

