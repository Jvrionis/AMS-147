%spline example where the spline interpolant exhibits undesirable
%oscillating behavior (this may occur if |f'(x)| >= 1; i.e., if the
%derivative of the underlying function is "large")

xi = [8.125, 8.4, 9, 9.545, 9.6, 9.959, 10.166, 10.2];
yi = [0.0774, 0.099, 0.28, 0.6, 0.708, 1.3, 1.8, 2.177];

[x,y] = compute_spline(computeM(xi,yi),xi,yi);

figure;
p = plot(xi,yi,'*',x,y);
set(gca,'FontSize',24)
set(p(1),'MarkerSize',14)
set(p(2),'LineWidth',2)
legend('data','natural cubic spline')
title('Example showing that large oscillations are possible')