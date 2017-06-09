% Bradie: section 8.2, example 2, refinement test
%
% We solve the BVP
%
%  u'' + u = sin(3x), 0 <= x <= pi/2
%  u(0) + u'(0) = -1
%  u'(pi/2) = 1
%
% Note the Robin condition at x = 0 and Neumann condition at x = pi/2.  The
% exact solution is u(x) = -cos x + 3/8 sin x - 1/8 sin 3x.
%  We use a refinement test to illustrate that the error is O(h^2)

% identify boundary conditions
a1 = 1; a2 = 1; a3 = -1;
b1 = 0; b2 = 1; b3 = 1;

% initialize the refinement
ntests = 8;
Merr = zeros(ntests, 1);  % max error
Rerr = zeros(ntests, 1);  % RMS error

for k=1:ntests
    % set computational grid
    N = 2^(k+1);
    x0 = 0; xN = pi/2; h = (xN - x0)/N;
    x = x0:h:xN; x = x(:);

    % Identify coefficient functions.
    p = zeros(size(x));
    q = -1*ones(size(x));
    r = sin(3*x);

    % get diagonal, upper, lower elements of A
    d = (2 + h^2*q);
    u = (-1 - h/2*p);
    l = (-1 + h/2*p);

    % Identify the coefficient matrix and right hand side b
    A = zeros(N+1, N+1);
    A = A + diag([0; d(2:N); 0]);
    A = A + diag([0; u(2:N)], 1) + diag([l(2:N); 0], -1);

    A(1,1) = d(1) + 2*h*l(1)*a1/a2;     % Robin condition at x=0
    A(1,2) = -2;                        %
    A(N+1, N) = -2;                     % Neumann condition at x=pi/2
    A(N+1, N+1) = d(N+1);               %

    b = -h^2*r;
    b(1) = b(1) + 2*h*l(1)*a3/a2;       % Robin Condition at x=0
    b(N+1) = b(N+1) - 2*h*u(N+1)*b3/b2; % Neumann Condition at x=pi/2

    % Do the solving
    w = A\b;

    % exact solution
    u = -cos(x) + 3/8*sin(x) - 1/8*sin(3*x);

    % Max error and RMS error
    Merr(k) = norm(u - w, inf);
    Rerr(k) = 1/sqrt(N+1)*norm(u - w, 2);
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

