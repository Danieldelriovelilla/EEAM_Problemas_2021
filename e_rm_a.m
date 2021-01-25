function e = e_rm_a(rm, a)
    % Argumentos de entrada
    % rm -> radio minimo de la orbita
    % a -> semieje mayor

    R_E = 6378; % Km
    if (rm-R_E) < 0
        display('ADVERTENCIA: CALCULO DE EXCENTRICIDAD')
        display('No has sumado la altura al radio de la Tierra')
        display('El problema que estás resolviendo puede no ser con la Tierra')
    else
    end
    
    e = 1 - rm/a;

end