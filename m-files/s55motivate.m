% Bradie: section 5.5 motivating examples
% Update: 1 May 2017

t = linspace(-1, 1, 2^9+1);

for pn = 1:5
n = 2^pn;

% uniform
xU = -1 + 2*(0:n)/n;
fU = 1./(1+25*xU.^2);
aU = doDividedDiff(xU, fU);
PU = doSyntheticNewton(aU, xU, t);

% chebyshev
xC = cos( (2*(0:n)+1)/(2*(n+1))*pi);
fC = 1./(1+25*xC.^2);
aC = doDividedDiff(xC, fC);
PC = doSyntheticNewton(aC, xC, t);

plot(t, PU, 'b--', t, PC, 'r--', t, 1./(1+25*t.^2),'b')
axis([-1 1 -1 1])
pause
end
pause

%%
for pn = 1:5
n = 2^pn;

xU = -1 + 2*(0:n)/n;
fU = sqrt(abs(xU));
aU = doDividedDiff(xU, fU);
PU = doSyntheticNewton(aU, xU, t);

% chebyshev
xC = cos( (2*(0:n)+1)/(2*(n+1))*pi);
fC = sqrt(abs(xC));
aC = doDividedDiff(xC, fC);
PC = doSyntheticNewton(aC, xC, t);

plot(t, PU, 'b--', t, PC, 'r--', t, sqrt(abs(t)),'b')
axis([-1 1 0 1])
pause
end
    
