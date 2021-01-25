classdef Kepler_obj < handle
    % Objeto bomba
    
    properties (Access = public)
        mu
        a
        b
        e
        T
        p
        M     
        E
        teta
    end
    
    methods
        
        function obj = Kepler_obj(mu, a) % CONSTRUCTOR
            obj.mu = mu;
            obj.a = a;
        end
        
        function p = h_vector(obj, a, e)
            p = a*(1-e^2);
            obj.p = p;
        end
        
        function p = p_param(obj, a, e)
            p = a*(1-e^2);
            obj.p = p;
        end
        
        function r = r(obj, a, e, teta)
            r = obj.p_param(a, e)/(1 + e*cos(teta));
        end
        
        function e = e_perigeo(obj, rp, a)
            %rp = a(1-e^2)/(1+e) = a(1 - e)
            e = 1 - rp/a;
            obj.e = e;
        end
        
        function T = T_orbita(obj)
            T = 2*pi*sqrt(obj.a^3/obj.mu);
            obj.T = T;
        end
        
        function v = v_orbital(obj, r)
            mu = obj.mu;
            a = obj.a;
            v = sqrt( mu*( 2/r - 1/a ) );
        end
        
        function b = b_param(obj, a, e)
            % Ec cartesianas: (x + ae)/a^2 + y/b^2 = 1
            b = a*sqrt(1 - e^2);
            obj.b = b;
        end
        
        function h = h(obj, r, v)
            h = corss(r, v);
        end
        
        function M = Anomalia_Media(obj, t)
            n = sqrt(obj.mu/obj.a^3);
            t0 = 0;
            M = n*(t - t0);
            obj.M = M;
        end
        
        function E = Anomalia_Excentrica(obj, t)
            syms E
            obj.Anomalia_Media(t);
            eqn = E - obj.e*sin(E) == obj.M;
            E = double(vpasolve(eqn,E,[0. pi]));
            obj.E = E;
        end
        
        function teta = Anomalia_Verdadera(obj)
            e = obj.e;
            E = obj.E;
            teta = 2*atan(sqrt((1+e)/(1-e))*tan(E/2));
            obj.teta = teta;
        end
        
        function v = v_escape(obj, r)
            v = sqrt(2*obj.mu/r);       % km/s
        end
    end
end

