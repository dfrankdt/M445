% Bradie: section 6.3, example 5

% Reconsider approximation of f'(2) for f(x) = ln(x)

clear; close all

%% Second order central difference
for k = 1:3
    h = 0.1/2^(k-1);
    x0 = 2; 
    fp(k) = (log(x0+h) - log(x0-h))/(2*h);
    e(k) = abs(fp(k) - 1/2);
end

% print the results

pfmt =  ('%.6f \t %.10f\t  %.2e\t  \n');
fprintf('\n\n\nUsing a 2nd order center difference \n')
fprintf('h \t\t approximation \t error\n')
fprintf('--------------------------------------\n')
for k=1:3
    fprintf(pfmt, 0.1/2^(k-1), fp(k), e(k))
end

%% Extrapolation formula D = (4Dh/2 - Dh)/3 + o(h^2)
for k = 1:4
    h = 0.1/2^(k-1);
    Dh = (log(x0+h) - log(x0-h))/(2*h);
    Dh2 = (log(x0+h/2) - log(x0-h/2))/h;
    R(k) = (4*Dh2 - Dh)/3;
    e(k) = abs(R(k) - 1/2);
end

% print the results

pfmt =  ('%.6f \t %.10f\t  %.4e\t  \n');
fprintf('\n\n\nUsing a the extrapolation \n')
fprintf('h \t\t approximation \t error\n')
fprintf('--------------------------------------\n')
for k=1:4
    fprintf(pfmt, 0.1/2^(k-1), R(k), e(k))
end
e(1:3)./e(2:4)
