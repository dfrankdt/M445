% Bradie: section 5.4, example 11

clear

n = 4;
t = linspace(-1, 1, 2^9+1);

% Chebyshev grid
xC = cos( (2*(0:n)+1)/(2*(n+1))*pi);
fC = sin(pi*xC);
aC = doDividedDiff(xC, fC);
PC = doSyntheticNewton(aC, xC, t);

% Uniform grid
xU = linspace(-1, 1, n+1);
fU = sin(pi*xU);
aU = doDividedDiff(xU, fU);
PU = doSyntheticNewton(aU, xU, t);

% Legendre grid
xL = [-0.90618, -0.53847, 0, 0.53847, 0.90617];
fL = sin(pi*xL);
aL = doDividedDiff(xL, fL);
PL = doSyntheticNewton(aL, xL, t);

Err = [sin(pi*t) - PC; sin(pi*t) - PU; sin(pi*t) - PL];


plot(t, abs(Err))

% The maximum error of each method is given by the max error of each row
% which can be determined by examining the transpose

max(abs(Err'))

