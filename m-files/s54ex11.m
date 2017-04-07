n = 4;
t = linspace(-1, 1, 2^9+1);

% Chebyshev points
xC = cos( (2*(0:n)+1)/(2*(n+1))*pi)
fC = sin(pi*xC);
aC = myDividedDiff(xC, fC);
PC = mySyntheticNewton(aC, xC, t);

% Uniform
xU = linspace(-1, 1, n+1);
fU = sin(pi*xU);
aU = myDividedDiff(xU, fU);
PU = mySyntheticNewton(aU, xU, t);

% Legendre
xL = [-0.90618, -0.53847, 0, 0.53847, 0.90617];
fL = sin(pi*xL);
aL = myDividedDiff(xL, fL);
PL = mySyntheticNewton(aL, xL, t);

Err = [sin(pi*t) - PC; sin(pi*t) - PU; sin(pi*t) - PL];


plot(t, abs(Err))
%plot(t, PC, t, PU, t, PL)



