%Initialize E0 or E air
Ex_air = 2;
Ey_air = 3;
Ez_air = 4;

%Intitialize organ name and organ epslon
muscle = 'Muscle';
muscle_e = 53.649;
cornea = 'Cornea';
cornea_e = 50.742;
sclera = 'Sclera';
sclera_e = 51.859;

% Calculate magnitude of electric field
magnitude_air = sqrt(Ex_air^2 + Ey_air^2 + Ez_air^2);

% Component Calculation
Ex_muscle = Ex_air / muscle_e
Ey_muscle = Ey_air
Ez_muscle = Ez_air
magnitude_muscle = sqrt(Ex_muscle^2 + Ey_muscle^2 + Ez_muscle^2)

Ex_cornea = Ex_air / cornea_e
Ey_cornea = Ey_air
Ez_cornea = Ez_air
magnitude_cornea = sqrt(Ex_cornea^2 + Ey_cornea^2 + Ez_cornea^2)

Ex_sclera = cornea_e*Ex_cornea / sclera_e
Ey_sclera = Ey_cornea
Ez_sclera = Ez_cornea
magnitude_sclera = sqrt(Ex_sclera^2 + Ey_sclera^2 + Ez_sclera^2)

% Grid Visualization
[x_air, y_air, z_air] = meshgrid(0:0.1:0.49, 0:0.1:0.99, 0:0.1:1);
[x_muscle, y_muscle, z_muscle] = meshgrid(0.55:0.1:0.99, 0.7:0.1:0.99, 0:0.1:1);
[x_cornea, y_cornea, z_cornea] = meshgrid(0.55:0.1:0.74, 0:0.1:0.6, 0:0.1:1);
[x_sclera, y_sclera, z_sclera] = meshgrid(0.8:0.1:0.99, 0:0.1:0.6, 0:0.1:1);

% Electric Field Components on The Grid
Ex_air_grid = Ex_air * ones(size(x_air));
Ey_air_grid = Ey_air * ones(size(y_air));
Ez_air_grid = Ez_air * ones(size(z_air));

Ex_muscle_grid = Ex_muscle * ones(size(x_muscle));
Ey_muscle_grid = Ey_muscle * ones(size(y_muscle));
Ez_muscle_grid = Ez_muscle * ones(size(z_muscle));

Ex_cornea_grid = Ex_cornea * ones(size(x_cornea));
Ey_cornea_grid = Ey_cornea * ones(size(y_cornea));
Ez_cornea_grid = Ez_cornea * ones(size(z_cornea));

Ex_sclera_grid = Ex_sclera * ones(size(x_sclera));
Ey_sclera_grid = Ey_sclera * ones(size(y_sclera));
Ez_sclera_grid = Ez_sclera * ones(size(z_sclera));

% Electric Field Plot
figure;
quiver3(x_air, y_air, z_air, Ex_air_grid, Ey_air_grid, Ez_air_grid);
hold on;
quiver3(x_muscle, y_muscle, z_muscle, Ex_muscle_grid, Ey_muscle_grid, Ez_muscle_grid);
hold on;
quiver3(x_cornea, y_cornea, z_cornea, Ex_cornea_grid, Ey_cornea_grid, Ez_cornea_grid);
hold on;
quiver3(x_sclera, y_sclera, z_sclera, Ex_sclera_grid, Ey_sclera_grid, Ez_sclera_grid);
xlabel('x');
ylabel('y');
zlabel('z');
title('Electric Field');
axis equal;
grid on;
hold on;

% Text Plot
text(0.25, 0.5, 0.5, 'Air', 'FontSize', 12, 'Color', 'black', 'HorizontalAlignment', 'center');
text(0.75, 0.83, 0.5, muscle, 'FontSize', 12, 'Color', 'black', 'HorizontalAlignment', 'center');
text(0.625, 0.33, 0.5, cornea, 'FontSize', 12, 'Color', 'black', 'HorizontalAlignment', 'center');
text(0.875, 0.33, 0.5, sclera, 'FontSize', 12, 'Color', 'black', 'HorizontalAlignment', 'center');

% Border Plot
x_border = [0.5, 0.5, 0.5, 0.5];
y_border = [0, 1, 1, 0];
z_border = [0, 0, 1, 1];
patch(x_border, y_border, z_border, 'y', 'FaceAlpha', 0.2);

x_border = [0.5, 1, 1, 0.5];
y_border = [0.66, 0.66, 0.66, 0.66];
z_border = [0, 0, 1, 1];
patch(x_border, y_border, z_border, 'y', 'FaceAlpha', 0.2);

x_border = [0.75, 0.75, 0.75, 0.75];
y_border = [0, 0.66, 0.66, 0];
z_border = [0, 0, 1, 1];
patch(x_border, y_border, z_border, 'y', 'FaceAlpha', 0.2);


