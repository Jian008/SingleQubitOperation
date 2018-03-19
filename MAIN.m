%
clc
close all
clear all

global rhot;

E = [1 0; 0 1]; X = [0 1; 1 0]; Y = [0 -1i; 1i 0]; Z = [1 0; 0 -1];
S{1} = X; S{2} = Y; S{3} = Z; S{4} = E;

a = [1 0 0; 0 1 0; 0 0 1];
b = [ 1 -1 1; 1 1 -1; -1 -1 -1; -1 1 1]/sqrt(3);

for i = 1:3;
    n = a(i,:);
    ss = 'A(*)';
    ss(3) = num2str(i);
    ss
    [par,m] = arbM(n)
    HA(i) = par(1); QA(i) = par(2);
end

for i = 1:4;
    n = b(i,:);
    ss = 'B(*)';
    ss(3) = num2str(i);
    ss
    [par,m] = arbM(n)
    HB(i) = par(1); QB(i) = par(2);
end

HA
QA
HB
QB

for i = 1:3;
    n = a(i,:);
    ss = 'A(*)';
    ss(3) = num2str(i);
    ss
    [par,m] = arbG(n)
    HAG(i) = par(1); QAG(i) = par(2);
end

for i = 1:4;
    n = b(i,:);
    ss = 'B(*)';
    ss(3) = num2str(i);
    ss
    [par,m] = arbG(n)
    HBG(i) = par(1); QBG(i) = par(2);
end

HAG
QAG
HBG
QBG
