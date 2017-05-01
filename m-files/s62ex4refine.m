% Bradie: section 6.2, example 4, refinement

% Goal: approximate f'(0) for f(x) = exp(x) with second order central
% difference.

for k = 1:16
    h = 1/2^k
    x0 = 0; x1 = x0-h; x2 = x0+h;
    fp(k) = (exp(x0+h) - exp(x0-h))/(2*h);
    e(k) = abs(fp(k) - 1);
end

R(1) = 0;
R(2:16) = e(1:15)./e(2:16);

% print the results

pfmt =  ('%.e \t %.6f\t  %.4e\t %.4f \n');
fprintf('\n\n\nUsing a 2nd order central difference \n')
fprintf('h \t approximation \t error \t Log of ratio\n')
for k=1:16
    fprintf(pfmt, 1/2^k, fp(k), e(k), log(R(k))/log(2))
end

