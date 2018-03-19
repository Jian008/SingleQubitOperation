% This is the code to calculate the Unitary Operation of Waveplates;
%function U = WavePlate(theta, delt)
function U = WP4(par)
% theta is the angle of the fast axis from the horizontal polarization
theta = par(1)*pi/180; 
C = cos(theta); S = sin(theta);
T = [C S; -S C];
% delt is the phase difference between the fast axis and the slow one
delt = 90*pi/180;
ep = exp(1i*delt/2);
PS = [ep 0; 0 ep'];

U = T'*PS*T;
U;
