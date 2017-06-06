% Bradie: section 8.1, example 1, refinement test
%
% We solve the BVP
%
%  -u'' + pi^2 u = 2 pi^2 sin(pi x)
%  u(0) = 0, u(1) = 0
% 
% which has exact solution u(x) = sin(pi x).  We use a refinement test to
% illustrate that the error is O(h^2)

% identify boundary conditions
u0 = 0;
uN = 0;

% initialize the refinement
ntests = 8;
Merr = zeros(ntests, 1);  % max error
Rerr = zeros(ntests, 1);  % RMS error

for k=1:ntests
    % set computational grid
    N = 2^(k+1);
    x0 = 0; xN = 1; h = (xN - x0)/N;
    x = x0:h:xN; x = x(:);

    % Identify coefficient functions.  Note, these need only be expressed at
    % interior points, i.e. x(2:N).
    r = -2*pi^2*sin(pi*x(2:N));
    p = zeros(size(x(2:N)));
    q = pi^2*ones(size(x(2:N)));

    % get diagonal, upper, lower, elements of A
    d = (2 + h^2*q);
    l = (-1 - h/2*p);
    u = (-1 + h/2*p);

    % Set the coefficient matrix A and right hand side b
    A = diag([1; d; 1]);                         % enter diagonal elements
    A = A + diag([l; 0], -1) + diag([0; u], 1);  % add super/sub diag elements

    b = [u0; -h^2*r; uN];

    % solve
    w = A\b;

    % exact solution
    u = sin(pi*x);
    
    % do Figure 8.4
    if N==16
        plot(x, u, 'k', x, w, 'kd')
        xlabel('x')
        ylabel('u(x)')
        legend('Exact', 'Approximate')
        axis([0 1 0 1])
    end

    % Max error and RMS error
    Merr(k) = norm(u - w, inf);
    Rerr(k) = 1/sqrt(N)*norm(u - w, 2);
end    
    
pfmt0 = '%3i\t %.8f\t\t\t %.8f\n';
pfmt = '%3i\t %.8f\t %.6f\t %.8f\t %.6f\n';
for k=1:ntests
    N = 2^(k+1);
    if k==1
        fprintf(pfmt0, N, Merr(k), Rerr(k))
    else
        fprintf(pfmt, N, Merr(k), Merr(k-1)/Merr(k), Rerr(k), Rerr(k-1)/Rerr(k))
    end
end

