%% FTCS experiments
% for this problem, the stability condition is dt <= 1/53

% run with nt = 303 (corresponding to dt = 2/101)
[x, t, wu] = FTCS(303);
% run with nt =  318 (corresponding to dt = 1/53)
[x, t, ws] = FTCS(318);

plot(x, ws(:, end), x, wu(:, end))

%% BTCS experiments

% run with nt = 30 (corresponding to dt = 1/5)
[x, t, wb] = BTCS(30);
plot(x, wb(:, end))

%% CN experiments

% run with nt = 30 (corresponding to dt = 1/5)
[x, t, wc] = CN(30);
plot(x, wc(:, end), x, wb(:, end))