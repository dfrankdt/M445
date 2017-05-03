% Bradie: section 5.3, example 9
% Update: 1 May 2017

clear

% input the data
w = [10 20 40 60 80 100];
V = [1.498 2.138 2.840 2.542 1.877];

% get the coefficients
a = doDividedDiff(w, V);

% produce the data at the desired values
t = 5:5:100;
P = doSyntheticNewton(a, w, t);

% write it out to column form
Tbl = [t' P']
