% Bradie: section 6.3, example 7

% Goal: Estimate f'(x0) for f(x) = arctan(x) at x0 = 2.

clear
x0 = 2;

% Dh is the foward difference approximation
for k=1:4
    h = 1/2^(k-1);
    Dh(k, 1) = (atan(x0 + h) - atan(x0))/h;
end

% The second column of Dh is the first extrapolation O(h^2)
for k=2:4
    Dh(k, 2) = (2*Dh(k, 1) - Dh(k-1, 1))/1;
end

% The third column of Dh is the second extrapolation O(h^3)
for k=3:4
    Dh(k, 3) = (4*Dh(k, 2) - Dh(k-1, 2))/3;
end

% The fourth column of Dh is the third extrapolation, O(h^4)
for k = 4:4
    Dh(k, 4) = (8*Dh(k, 3) - Dh(k-1, 3))/7;
end

% Write out the estimates
clc
pfmt = ('%.4f\t %.9f\t %.9f\t %.9f\t %.9f\t \n');
fprintf('h\t O(h)\t\t O(h^2)\t\t O(h^3)\n')
for k=1:4
    fprintf(pfmt, 1/2^(k-1), Dh(k,:))
end
 