% Bradie: section 8.1, example 2
%
% We solve the BVP
%
%  u'' = -(x + 1)u' + 2u + (1 - x^2)exp(-x)
%  u(0) = -1, u(1) = 0
% 
% which has exact solution u(x) = (x - 1)exp(-x)

% identify boundary conditions
u0 = -1;
uN = 0;

% set computational grid (to get Fig 8.5, set N = 32)
N = 4;
x0 = 0; xN = 1; h = (xN - x0)/N;
x = x0:h:xN; x = x(:);

% Identify coefficient functions.  Note, these need only be expressed at
% interior points, i.e. x(2:N).
r = (1 - x(2:N).^2).*exp(-x(2:N));
p = -(x(2:N) + 1);
q = 2*ones(size(x(2:N)));

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
u = (x - 1).*exp(-x);

plot(x, u, x, w, 'ob')

pfmt = '%.2f\t %.6f\t %.6f\t %.6f\n';
for i=1:N+1
    fprintf(pfmt, x(i), w(i), u(i), abs(u(i) - w(i)))
end

% get Fig 8.5, uncomment this

 plot(x, u, x, w, 'bd')
 xlabel('x')
 ylabel('u(x)')
 axis([0 1 -1 0])
 legend('Exact', 'Approximate')
