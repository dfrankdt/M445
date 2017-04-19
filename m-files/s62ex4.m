% Bradie: section 6.2, example 4

% Goal: approximate f'(0) for f(x) = exp(x) with second order central
% difference.

for k = 1:16
    h = 10^(-k);
    x0 = 0; x1 = x0-h; x2 = x0+h;
    fp(k) = (exp(x0+h) - exp(x0-h))/(2*h);
    e(k) = abs(fp(k) - 1);
end

% print the results

pfmt =  ('%.e \t %.6f\t  %.4e\t  \n');
fprintf('\n\n\nUsing a 2nd order central difference \n')
fprintf('h \t approximation \t error\n')
fprintf('--------------------------------------\n')
for k=1:16
    fprintf(pfmt, 10^(-k), fp(k), e(k))
    if (k==5)
        fprintf('-----round off error approaching----\n')
    end
end

