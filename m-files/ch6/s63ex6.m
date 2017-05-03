% Bradie: section 6.3, example 6
% Update: 1 May 2017
clear

% Goal: approximate f'(x0) for f(x) = ln(x) at x0 = 2.

% Dh is the central difference approximation
for k=1:5
    h = 0.1/2^(k-1);
    x0 = 2;
    Dh(k, 1) = (log(x0 + h) - log(x0 - h))/(2*h);
    e(k, 1) = abs(1/2 - Dh(k, 1));
end

% The second column of Dh is the first extrapolation
for k = 2:5
    Dh(k, 2) = (4*Dh(k, 1) - Dh(k-1, 1))/3;
    e(k, 2) = abs(1/2 - Dh(k, 2));
end

% The third column of Dh is the second extrapolation
for k=3:5
    Dh(k, 3) = (16*Dh(k, 2) - Dh(k-1, 2))/15;
    e(k, 3) = abs(1/2 - Dh(k, 3));
end

% Write out the errors
pfmt = ('%.6f\t %.2e\t %.2e\t %.2e\t \n');
fprintf('h\t \t D1\t\t D2\t\t D3\n')
for k=1:5
    fprintf(pfmt, 0.1/2^(k-1), e(k,:))
end

