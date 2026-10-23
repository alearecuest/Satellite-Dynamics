% Simulador de Trayectoria Orbital en 3D
clear; clc; close all;

% Parámetros físicos de la Tierra
R_earth = 6371; % Radio medio de la Tierra en km

% Elementos Orbitales de Kepler (Ejemplo: Órbita LEO típica)
a = 7000; % Semieje mayor en km (aprox 629 km de altitud)
e = 0.05; % Excentricidad (casi circular)
i = deg2rad(45); % Inclinación orbital (45 grados)
Omega = deg2rad(30); % Longitud del nodo ascendente (RAAN)
omega = deg2rad(60); % Argumento del perigeo
nu = linspace(0, 2*pi, 200); % Anomalía verdadera (1 revolución completa, 200 puntos)

% 1. Calcular la posición en el plano de la órbita (Sistema Perifocal)
r = (a * (1 - e^2)) ./ (1 + e .* cos(nu));
xp = r .* cos(nu);
yp = r .* sin(nu);
zp = zeros(size(nu)); % En el propio plano de la órbita, Z es 0

% 2. Matrices de rotación para transformar al Sistema Geocéntrico Ecuatorial (3D)
% Rotación por la Longitud del Nodo Ascendente (Eje Z)
R3_W = [cos(Omega) -sin(Omega) 0; 
        sin(Omega)  cos(Omega) 0; 
        0           0          1];
    
% Rotación por la Inclinación (Eje X)
R1_i = [1 0          0; 
        0 cos(i) -sin(i); 
        0 sin(i)  cos(i)];
    
% Rotación por el Argumento del Perigeo (Eje Z)
R3_w = [cos(omega) -sin(omega) 0; 
        sin(omega)  cos(omega) 0; 
        0           0          1];

% Matriz de transformación total
Q = R3_W * R1_i * R3_w;

% Aplicar la transformación a todas las coordenadas
coords_perifocales = [xp; yp; zp];
coords_geocentricas = Q * coords_perifocales;

X = coords_geocentricas(1, :);
Y = coords_geocentricas(2, :);
Z = coords_geocentricas(3, :);

% 3. Graficar la Tierra y la Órbita
figure('Name', 'Simulación de Órbita Satelital', 'Color', 'w');
hold on; grid on; axis equal;

% Generar una esfera para representar la Tierra
[xE, yE, zE] = sphere(50);
surf(xE*R_earth, yE*R_earth, zE*R_earth, ...
    'EdgeColor', 'none', 'FaceColor', [0.2 0.5 0.8], 'FaceAlpha', 0.6);

% Dibujar la trayectoria del satélite
plot3(X, Y, Z, 'r', 'LineWidth', 2);

% Marcar la posición actual (el inicio de la trayectoria)
scatter3(X(1), Y(1), Z(1), 50, 'k', 'filled'); 

% Configuraciones visuales
title('Trayectoria Orbital 3D usando Leyes de Kepler');
xlabel('Eje X (km)'); ylabel('Eje Y (km)'); zlabel('Eje Z (km)');
view(3); % Activar vista 3D por defecto
hold off;