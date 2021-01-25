clc;
close all;
clear all;

%% DATOS
mu = 398600;           % km^3/s^2
rT = 6371;               % km 637

i = deg2rad([5, 46]);    % rad
rP = rT + 600;           % km
w = 2*pi/86164;        % rad/s
R_GEO = (mu/w^2)^(1/3);


%% Apartado A

ri = rP;
rf = R_GEO;

% Ciruclar
vci = sqrt( mu/ri )
vcf = sqrt( mu/rf );

% Elpiptica
vep = sqrt( 2*mu/ri*( rf/( ri + rf ) ) );
vea = sqrt( 2*mu/rf*( ri/( ri + rf ) ) );

% Delta budget
deltaVA = vep - vci
deltaVB = sqrt( vea^2 + vcf^2 - 2*vea*vcf.*cos(i) )

deltaVH = deltaVA + deltaVB;


%% Apartado B

dif_V = deltaVH(2) - deltaVH(1)     % kms/s
