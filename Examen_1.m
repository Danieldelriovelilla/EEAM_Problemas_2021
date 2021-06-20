clc;
clear all;

%% Datos
mu_E = 3.986e5;
rE = 6378;
J2 = 1.0826e-3;
a1 = rE + 400;
a2 = rE + 500;
i1 = deg2rad(85);

%% Apartado a

Omegap_Sol = 2*pi/( 365.2411984 * 24 * 3600 );     % rad/s

i2 = acos( Omegap_Sol*2*3*a2^2/(J2*rE^2) );
rad2deg(i2)
delta_i = i2 - i1;


%% Apartado b: Hohmann

ri = a1;
rf = a2;
mu = mu_E;

% Ciruclar
vci = sqrt( mu/ri );
vcf = sqrt( mu/rf );

% Elpiptica
% Si se aumenta el radio, vei == v perigeo --> vei > vef
% Si se disminuye el radio, vei == v apogeo --> vef > vei
vei = sqrt( 2*mu/ri*( rf/( ri + rf ) ) );    
vef = sqrt( 2*mu/rf*( ri/( ri + rf ) ) );

% Delta budget
deltaVA = vei - vci
deltaVB = sqrt( vef^2 + vcf^2 - 2*vef*vcf.*cos(delta_i) )

deltaVH = deltaVA + deltaVB


%% Apartado c: periodo nueva orbita

T2 = 2*pi*sqrt(a2^3/mu_E);


%% Apartado d: tiempo de eclipse

% Eclipses
alfa = asin(rE/a2);
angulo_eclipse = 2*alfa;
porcentaje_eclipse = angulo_eclipse/(2*pi);
tiempo_eclipse = porcentaje_eclipse*T2
%porcentaje = 2*pi/angulo_eclipse;
%tiempo = porcentaje*T2


%% Apartado e: distancia contacto

ele = deg2rad(20);
rho = rE*( acos( rE*cos(ele)/a2 ) - ele )

phi = rho/rE
rad2deg(phi)