% the sequence of waveplate is QWP->HWP->PBS
function fcost = farbU(par)
global rhot;

psi0 = [1 0]';
h = par(1); q = par(2);
UH = WP2(h);
UQ = WP4(q);
% the sequence of waveplate is QWP->HWP->PBS
U = UH*UQ;
rho = U*rhot*U';
% the probability of transform the target state rhot into [1 0].
pr = real(psi0'*rho*psi0);
fcost = 1-pr;
