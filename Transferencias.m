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
vep = sqrt( 2*mu/ri*( rf/( ri + rf ) ) )
vea = sqrt( 2*mu/rf*( ri/( ri + rf ) ) )

deltaVA = vep - vci
deltaVB = vcf - vea

deltaVH = deltaVA + deltaVB

tH = pi*sqrt( (ri + rf )^3/(8*mu) )


% Bieliptica
