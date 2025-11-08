clc; clear; close all;
vergroesserung = 5;
freqdoubl = 2;
theta = linspace(0,2*2*pi,1000);
x = sin(theta)*vergroesserung;
z = cos(theta)*vergroesserung;
y = theta;
figure();
plot3(x,y,z);
xlabel('X');
zlabel('Y');
ylabel('Z (Zeit)');

legend('Sinusbewegung', 'Nun mit 3D Rotor drehen ... ');

view(0,0);

hold off;

grid on
axis equal