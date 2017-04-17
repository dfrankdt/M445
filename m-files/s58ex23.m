% Bradie: section 5.8, example 23

clear; close all

% find the fit for the thermocouple reading which gives temperature (C)
% as a function of the voltage (mV)

T = [0 20 40 60 80 100 120 140 160 180];
V = [0.01 0.12 0.24 0.38 0.51 0.67 0.84 1.01 1.15 1.31];

u = polyfit(V, T, 1);

b = u(1)
a = u(2)