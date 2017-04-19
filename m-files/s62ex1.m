% Bradie: section 6.2, example 1

%% do the forward differences
for k = 1:4
    h = 10^(1-k);
    x0 = 2; x1 = x0 + h;
    fp(k) = (log(x1) - log(x0))/h;
    e(k) = abs(fp(k) - 1/2);
end

% print the results

pfmt =  ('%.3f \t %.6f\t  %.4e\t  \n');
fprintf('\n\n\nUsing a forward difference \n')
fprintf('h \t approximation \t error\n')
fprintf('--------------------------------------\n')
for k=1:4
    fprintf(pfmt, 10^(1-k), fp(k), e(k))
end

%% do the backward differences
for k = 1:4
    h = 10^(1-k);
    x0 = 2; x1 = x0 - h;
    fp(k) = (log(x0) - log(x1))/h;
    e(k) = abs(fp(k) - 1/2);
end

% print the results

pfmt =  ('%.3f \t %.6f\t  %.4e\t  \n');
fprintf('\n\n\nUsing a backward difference \n')
fprintf('h \t approximation \t error\n')
fprintf('--------------------------------------\n')
for k=1:4
    fprintf(pfmt, 10^(1-k), fp(k), e(k))
end
