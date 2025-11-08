% Definition der Vektoren
A = [2, 1];
B = [-1, 2];

% Ursprung (0,0)
origin = [0, 0];

% Erstelle 2D-Plot
figure;
quiver(origin(1), origin(2), A(1), A(2), 0, 'r', 'LineWidth', 2); 
hold on;
quiver(origin(1), origin(2), B(1), B(2), 0, 'b', 'LineWidth', 2); 

% Achseneinstellungen
grid on;
axis equal;
xlim([-2 2]);
ylim([-3 1]);
xlabel('X');
ylabel('Y');
legend('Vektor A', 'Vektor B');
skalarprodukt = dot(A, B);  % oder: A * B'
title(['Skalarprodukt von Vektoren A und B:  ' num2str(skalarprodukt)]);
