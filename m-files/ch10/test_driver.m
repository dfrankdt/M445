t = 0;
close all
[xex, u0] = test_ex(t);

[x, t, wf] = test_FTCS(0.0013);
[x, t, wb] = test_BTCS(0.0013);
[x, t, wcn] = test_CN(0.0013);
for k=1:length(t)
    [xex, u] = test_ex(t(k));
    ef = u(:) - wf(:, k);
    eb = u(:) - wb(:, k);
    ecn = u(:) - wcn(:, k);
    subplot(1, 3, 1)
    plot(x, ef)
    subplot(1, 3, 2)
    plot(x, eb)
    subplot(1, 3, 3)
    plot(x, ecn)
    %plot(xex, u0, xex, u, x, wf(:, k), x, wb(:, k))
    %axis([0 1 0 1])
    pause(0.5)
end


    
    
