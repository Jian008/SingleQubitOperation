% this is the code to calculate the waveplate angles for von Neumann projector on qubit.
% ******
% the elements sequence should be  QWP->HWP->PBS.
% ******
function [the_t,nn] = arbM(n)
global rhot
E = [1 0; 0 1]; X = [0 1; 1 0]; Y = [0 -1i; 1i 0]; Z = [1 0; 0 -1];
S{1} = X; S{2} = Y; S{3} = Z; S{4} = E;
% the three elements of the Bloch vector
m = n/sqrt(n*n');
% the Bloch operator
M = E*0;
for i = 1:3;
    M = M+m(i)*S{i};
end
% the eigenstate matrix for M with eigenvalue +1
rhot = (E+M)/2;
par0 = [100 100]/3;
%farbU(par0)
[par,fc] = fminunc(@farbG,par0);
farbU(par);
% the angles (unit: in degrees) of HWP and QWP before the PBS, 
%         who transmits |H> ([1 0]) and reflects |V> ([0 1])
% the elements sequence should be  QWP->HWP->PBS.
para = mod(par,180);

h = para(1); q = para(2);
UH = WP2(h);
UQ = WP4(q);
% the sequence of waveplate is QWP->HWP->PBS
Ua = UH*UQ;
%Ua = arbU(para)
BO = Ua*M*Ua';
Ua*Z*Ua';
x = trace(BO*X);    y = trace(BO*Y);    z = trace(BO*Z);
% It should transform the target Bloch operator M (or n) into Z ([0 0 1]).
nn = real([x,y,z]/2);
the_t = para;
