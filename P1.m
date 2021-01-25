clc;
close all;
clear all;

%% DATOS
mu_E = 398600;           % km^3/s^2
rT = 6378;               % km
rp = rT + 600;           % km
ra = rT + 2000;          % km


%% Apartado A
a = (ra + rp)/2;
e = 1 - rp/a
p = a*(1-e^2)

T = 2*pi*sqrt(a^3/mu_E)


%% Apartado B
b = a*sqrt(1 - e^2)


%% Apartado C
t = T/4;

n = sqrt(mu_E/a^3);
t0 = 0;
M = n*(t - t0);

syms E
eqn = E - e*sin(E) == M;
E = double(vpasolve(eqn,E,[0. pi]))


%% Apartado D
teta = 2*atan(sqrt((1+e)/(1-e))*tan(E/2));  % rad 
r = p/(1 + e*cos(teta));
v_esc = sqrt(2*mu_E/r)

%{
EEAM = Kepler_obj(mu_E, a);


% Apartado A
e = EEAM.e_perigeo(rp, a)
T = EEAM.T_orbita()


% Apartado B
b = EEAM.b_param(a, e)


% Apartado C
t = T/4;
E = EEAM.Anomalia_Excentrica(t);
M = EEAM.M;
teta = EEAM.Anomalia_Verdadera();


% Apartado D
r = EEAM.r(a, e, teta);
v_escape = EEAM.v_escape(r);
%}