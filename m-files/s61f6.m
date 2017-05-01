% Bradie: section 6.1 convection mass transfer
% Update: 1 May 2017

clear; close all

% data
y = 0:5;
p = [0.1 0.065 0.042 0.029 0.022 0.020];

S = spline(y, p);

% plot
t = linspace(0, 5, 2^9+1);
plot(y, p, 'ok', t, ppval(S, t), 'k')

a = S.coefs(1, 1);
b = S.coefs(1, 2);
c = S.coefs(1, 3);

y0 = 0;
pprime0 = 3*a*y0^2 + 2*b*y0 + c
