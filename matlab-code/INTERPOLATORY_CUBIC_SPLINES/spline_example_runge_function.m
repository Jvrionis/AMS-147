%cubic splines example
f = @(x) 1./(1+25*x.^2);

xi = linspace(-1,1,9);
yi = f(xi);
[x,y] = compute_spline(computeM(xi,yi),xi,yi);
figure;
xx = linspace(-1,1,100);

y_knot = spline(xi,yi,xx);

figure;
p = plot(xx,f(xx),xi,yi,'*',x,y,xx,y_knot,'--');
legend('f(x)', 'interpolation nodes', 'natural cubic spline','not-a-knot cubic spline')
set(gca,'FontSize',24)
set(p(1),'LineWidth',2)
set(p(2),'MarkerSize',14)
set(p(3),'LineWidth', 2)
set(p(4),'LineWidth', 2)
title('Cubic Splines Example for the Runge Function f(x)=1/(1+20x^2)')