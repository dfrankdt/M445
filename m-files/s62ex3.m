% Bradie: section 6.2, example 3

%% do the second order forward difference
for k = 1:4
    h = 10^(-k);
    x0 = 2; x1 = x0+h; x2 = x0+2*h;
    fp(k) = (-3*log(x0) + 4*log(x1) - log(x2))/(2*h);
    e(k) = abs(fp(k) - 1/2);
end

% print the results

pfmt =  ('%.4f \t %.6f\t  %.4e\t  \n');
fprintf('\n\n\nUsing a 2nd order forward difference \n')
fprintf('h \t approximation \t error\n')
fprintf('--------------------------------------\n')
for k=1:4
    fprintf(pfmt, 10^(-k), fp(k), e(k))
end

%% do the backward differences
for k = 1:4
    h = 10^(-k);
    x0 = 2; x1 = x0-h; x2 = x0-2*h;
    fp(k) = (3*log(x0) - 4*log(x1) + log(x2))/(2*h);
    e(k) = abs(fp(k) - 1/2);
end

% print the results

pfmt =  ('%.4f \t %.6f\t  %.4e\t  \n');
fprintf('\n\n\nUsing a 2nd order backward difference \n')
fprintf('h \t approximation \t error\n')
fprintf('--------------------------------------\n')
for k=1:4
    fprintf(pfmt, 10^(-k), fp(k), e(k))
end

%% do the center differences
for k = 1:4
    h = 10^(-k);
    x0 = 2; x1 = x0-h; x2 = x0+h;
    fp(k) = (log(x2) - log(x1))/(2*h);
    e(k) = abs(fp(k) - 1/2);
end

% print the results

pfmt =  ('%.4f \t %.6f\t  %.4e\t  \n');
fprintf('\n\n\nUsing a 2nd order center difference \n')
fprintf('h \t approximation \t error\n')
fprintf('--------------------------------------\n')
for k=1:4
    fprintf(pfmt, 10^(-k), fp(k), e(k))
end
