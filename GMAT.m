% GMAT
clc
clear all
close all


%% Orbita aparcamiento
mu_E = 398600;          % km^3/s^2
rT = 6378;              % km
rp = 7500;              % km
a = rp;                 % km

v_per_park = sqrt( mu_E*(2/rp - 1/rp) )


%% Hiperbola salida

% Velocidad asintotica
v_inf = [-7.7078095, -3.8835474, -1.6830681];
vinf = norm(v_inf);

% Parametros hiperbola
e = 1 + (vinf/v_per_park)^2;
a = rp/(e-1);

% Impulso
delta_v = sqrt( mu_E*(2/rp - 1/a) ) - v_per_park

% V GMAT
v_g = [ -11.06539406448941, -2.913941976596266, -7.258404338638154];
vg = norm(v_g)


%% Orbita final Jupiter
mu_J = 1.266e8;
RJ = 71492;
rp = 600 + RJ;
e = 0.6;

p = rp*(1+e);
a = p/(1-e^2);

EEAM = Kepler_obj(mu_J,a);

v_per = EEAM.v_orbital(rp)