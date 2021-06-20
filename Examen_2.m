clc;
clear all;

%% Datos
rE = 6378;

%% Apartado a
rp = rE + 600;
ra = rE + 36000;

ap = (ra + rp)/2
ep = 1 - rp/ap
pp = ap*(1-ep^2)


%% Apartado b:
mu_E = 3.986e5;
vp_p = sqrt( 2*mu_E/rp - mu_E/ap );
vp_imp = vp_p + 2.7;

energia = vp_imp^2/2 - mu_E/rp;
ah = -mu_E/(2*energia);
v_inf = sqrt( mu_E*( - 1/ah ) );


%% Apartado c:
aT = 1.5e8;
mu_S = 1.327e11;

at = 2.81e8;
et = 0.47;
viT = sqrt( mu_S*( 2/aT - 1/at ) )

vT = sqrt(mu_S/aT);

%viT = vT + v_inf

%% Apartado d: 

%% Apartado e:
at = 2.81e8;
et = 0.47;

aM = 2.28e8;

vM = sqrt(mu_S/aM)
viM = sqrt( mu_S*( 2/aM - 1/at ) )

vM_inf = vM - viM


%% Apartado d

gammai = acos( vT/viT )
gammaf = acos( vM/viM )