clc;
close all;
clear all;

%% DATOS
rT = 149.6e6;
rV = 107.71e6;


%% Hohmann
a = (rT+rV)/2;

ri = rT;
rf = R_V;

% Ciruclar
vci = sqrt( mu/ri )
vcf = sqrt( mu/rf );

% Elpiptica
vep = sqrt( 2*mu/ri*( rf/( ri + rf ) ) );
vea = sqrt( 2*mu/rf*( ri/( ri + rf ) ) );

% Delta budget
deltaVA = vep - vci;
deltaVB = vcf - vea;

deltaVH = deltaVA + deltaVB;

