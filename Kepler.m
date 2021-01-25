%% Constantes
h = cross(r,v)
e = cross(v,h)/mu -r/norm(r)
e = 1 - rp/a    % rp = a(1-e^2)/(1+e) = a(1 - e)
energia = norm(v)^2/2 - mu/norm(r)

% Semiejes
a = (ra + rp)/2
a = -mu/(2*energia)
b = a*sqrt(1 - e^2)

% Parametro p
p = norm(h)^2/mu
p = a*(1-e^2)

% Velocidad
v = sqrt( mu*( 2/r - 1/a ) );

% Periodo
T = 2*pi*sqrt(a^3/mu);

%% Posicion tiempo/angulo

% Radio en funcion del angulo
r = p/(1 + e*cos(teta))

% Anomalia media
n = sqrt(mu/a^3);
M = n*(t - t0);

% Anomaia excentrica
syms E
eqn = E - e*sin(E) == M;
E = double(vpasolve(eqn,E,[0. pi])); % rad

% Anomalia verdadera
teta = 2*atan(sqrt((1+e)/(1-e))*tan(E/2));  % rad

% v escape
v_esc = sqrt(2*obj.mu/r);       % km/s