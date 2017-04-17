% Bradie: section 5.8, example 5.25

clear; close all

% data
C = [0 0.8 5.8 23 53 102 150 207 287 333 408];
L = [244 210 205 167 125 107 72 35 12 4.8 2.3];

% scatter plots: seek L as a function of C

subplot(2,2,1)
plot(C, L, '*k')
title('Scatter plot')
xlabel('CD sales, millions of units')
ylabel('LP sales, millions of units')

subplot(2,2,2)
plot(C, log(L), '*k')
title('Exponential law')
xlabel('CD sales, millions of units')
ylabel('log(LP sales)')

subplot(2,2,3)
plot(log(C), log(L), '*k')
title('Power law')
xlabel('log(CD sales)')
ylabel('log(LP sales)')

%% Fit the data
% Note that these values will be different than the text due to the use of
% the natural log rather than the base 10 log, but the end result gives the
% same fit.
u = polyfit(C, log(L), 1);
b = u(1)
a = exp(u(2))

Chat = linspace(min(C), max(C), 2^9+1);
Lhat = a*exp(b*Chat);

subplot(2,2,4)
plot(C, L, '*k', Chat, Lhat, 'k')
title('Regression curve')
xlabel('CD sales, millions of units')
ylabel('LP sales, millions of units')
