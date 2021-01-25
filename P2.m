clc;
clear all;
close all;

%% DATOS
mu = 398600;           % km^3/s^2
J2 = 1.083e-3;
rE = 6378;               % km
i = deg2rad(98.5);       % rad
e = 0;

%% Apartado A

% Altura: despejando de desviacion RAAN
Omegap_Sol = 2*pi/( 365.2411984 * 24 * 3600 );     % rad/s
a = (-( 3*J2*rE^2*cos(i)*sqrt(mu) )/( 2*Omegap_Sol ))^(2/7)

% Periodo
T = 2*pi*sqrt(a^3/mu)

% velocidad
r = a;
v = sqrt( mu*( 2/r - 1/a ) )


%% Apartado B
a2 = a - 300;
p = a2*(1-e^2);
n2 = sqrt(mu/a2^3);
Omegap_2 = -3*J2*rE^2*n2*cos(i)/(2*p^2)

% Desalinear orbita sol: Omega sol primero
dif_Omega =  Omegap_Sol - Omegap_2




%{
Heliosincrona = Heliosincrona_obj(muE, rE, J2);


% Heliosincrona
a = Heliosincrona.a_incognita_Omegap(i);

h = a - rE;

EEAM = Kepler_obj(muE, a);
EEAM.e = 0;

T = EEAM.T_orbita();
r = a;
v = EEAM.v_orbital(r);


% Apartado B

rb = rE + h - 300;
ab = rb;

Omegap_b = Heliosincrona.Omega_punto(ab, 0, i);

delta_Omega = Omegap_b - Heliosincrona.Omegap_Sol;
%}