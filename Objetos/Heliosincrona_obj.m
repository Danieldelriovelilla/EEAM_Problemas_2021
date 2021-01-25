classdef Heliosincrona_obj < handle
    % Objeto bomba
    
    properties (Access = public)
        mu                  % mu planeta
        rP                  % Radio planeta
        Omegap_Sol          % Velocidad variacion linea nodos
        J2                  % Perturbacion gravedad
        Omegap
        a                   % semieje mayor orbita
        e                   % excentricidad orbita                
        p                   % parametro p orbita
        i                   % inclinacion de la orbita
    end
    
    methods
        
        function obj = Heliosincrona_obj(mu, rP, J2) % CONSTRUCTOR
            obj.mu = mu;
            obj.rP = rP;
            obj.Omegap_Sol = 2*pi/( 365.2411984 * 24 * 3600 );     % rad/s
            obj.J2 = J2;
        end
        
        function p = p_param(obj, a, e)
            p = a*(1-e^2);
            obj.p = p;
            obj.a = a;
            obj.e = e;
        end

        function Omegap = Omega_punto(obj, a, e, i)
            mu = obj.mu;
            J2 = obj.J2;
            rP = obj.rP;
            
            p = obj.p_param(a, e);
            n = sqrt(mu/a^3);
            
            Omegap = -3*J2*rP^2*n*cos(i)/(2*p^2);
            obj.Omegap = Omegap;
            obj.i = i;
        end
        
        function a = a_incognita_Omegap(obj, i)
            mu = obj.mu;
            J2 = obj.J2;
            rP = obj.rP;
            Omegap_Sol = obj.Omegap_Sol;
            
            % Omega_punto = -(3/2)*J2*rE^2*cos(i)*(n/p)
            % Omega_punto = -(3/2)*J2*rE^2*cos(i)*(n/a^2)
            % Omega_punto = -(3/2)*J2*rE^2*cos(i)*(sqrt(mu)/a^(7/2))
            a = (-( 3*J2*rP^2*cos(i)*sqrt(mu) )/( 2*Omegap_Sol ))^(2/7);
            
            p = obj.p_param(a, 0);
        end

    end
end

