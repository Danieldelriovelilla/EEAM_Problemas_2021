delta_v = Isp*g0*log(mi/mf)
mf = mi/exp( delta_v/(Isp*g0) )

% Orbitas tangentes
delta_v_tangente = sqrt( vi^2 + vf^2 - 2*vi*vf*cos(phi) )

% Cambio de plano
delta_v_planogen = 2*vi*sin(deltaA/2)

% Cambio inclinacion
deltaV_inclinacion = 2*v*sin(deltai/2)

% Cambio nodo
deltaA/2 = asin( sin(i)*sin(deltaRAAN/2) )
tanphi = tan(i)*cos(deltaRAAN/2)

%% Transferencia Hohmann
v_circ = sqrt(mu/2)
v_elipt = sqrt( 2*mu/r - mu/a )

% Ciruclar
vci = sqrt( mu/ri )
vcf = sqrt( mu/rf )

% Elpiptica
% Si se aumenta el radio, vei == v perigeo --> vei > vef
% Si se disminuye el radio, vei == v apogeo --> vef > vei
vei = sqrt( 2*mu/ri*( rf/( ri + rf ) ) )    
vef = sqrt( 2*mu/rf*( ri/( ri + rf ) ) )

deltaVA = vei - vci
deltaVB = vcf - vef

deltaVH = deltaVA + deltaVB

tH = pi*sqrt( (ri + rf )^3/(8*mu) )


% Bieliptica



%% Interplanetaria

% Hiperbola salida/entrada
v_inf = sqrt( mu/a )
a = -mu/v_inf^2         % por definicion la a en hiperbola es negativa 



%% FlyBy
delta_V = 2*v_inf/(1 + (rp*v_inf^2)/mu)

% Distancia asintotica hiperbola de llegada
delta = rp/v_inf*sqrt( v_inf^2 + 2*mu/rp )