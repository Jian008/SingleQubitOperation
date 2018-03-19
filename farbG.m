% the sequence of waveplate is PBS->QWP->HWP->OUTPUT
function fcost = farbG(par)
global rhot; % the target state

psi0 = [1 0]';
h = par(1); q = par(2);
UH = WP2(h);
UQ = WP4(q);
% the sequence of waveplate is PBS->QWP->HWP->OUTPUT
U = UH*UQ;
psi = U*psi0;
% the probability of transform the initial state H ([1;0]) into the target state rhot.
pr = real(psi'*rhot*psi);
fcost = 1-pr;
