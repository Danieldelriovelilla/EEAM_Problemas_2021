clc;
close all;
clear all;

%% DATOS
rTS = 149.6e6;
rVS = 107.71e6;

mu_s = 1.327124e11;


%% Apartado B

% Orbita aparcamiento
mu_E = 398600;           % km^3/s^2
r_park = 6378 + 300;               % km
v_park = sqrt( mu_E*( 2/r_park - 1/r_park ) );

% Orbita final



%% Hohmann
a = (rTS+rVS)/2;

ri = rTS;
rf = rVS;

% Ciruclar
vci = sqrt( mu_s/ri );        % v Tierra - Sol
vcf = sqrt( mu_s/rf );        % v Venus - Sol

% Elpiptica
vei = sqrt( 2*mu_s/ri*( rf/( ri + rf ) ) );
vef = sqrt( 2*mu_s/rf*( ri/( ri + rf ) ) );

% Relativa
v_salida = vei - vci
v_entrada = vef - vcf


%% Apartado C

v_inf = v_salida;
ah_salida = -mu_E/v_inf^2
delta_v = sqrt( mu_E*( 2/r_park - 1/ah_salida ) ) - v_park


%% Apartado D
mu_V = 3.2486e5;
rV = 6052;

v_inf = v_entrada;
ah_llegada = -mu_E/v_inf^2
vh_llegada = sqrt( mu_E*( 2/r_park - 1/ah_llegada ) )


av = (250 + 66000 + 2*rV)/2
vp_v = sqrt( mu_V*(2/(250+rV) - 1/av) )
