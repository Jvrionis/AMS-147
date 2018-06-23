%spline example using the same data provided in
%"spline_example_oscillations.m" with the data rotated 36 degrees in the
%clockwise direction.  The cubic spline in the rotated data does not
%exhibit the undesirable oscillations.  This shows that the cubic spline
%interpolation is geometrically non-invariant and depends on the chosen
%Cartesian reference system.  Parametric splines (probably not covered in
%this class) have
%geometric invariance, which is useful for some applications; for example,
%image processing.

xi = [8.125, 8.4, 9, 9.545, 9.6, 9.959, 10.166, 10.2];
yi = [0.0774, 0.099, 0.28, 0.6, 0.708, 1.3, 1.8, 2.177];

%rotate the coordinate system by 36 degrees in the clockwise direction
theta = -36*2*pi/360;
R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
n = length(xi);
for i = 1:n
    z = R*[xi(i);yi(i)];
    xi(i) = z(1);
    yi(i) = z(2);
end
%

[x,y] = compute_spline(computeM(xi,yi),xi,yi);

figure;
p = plot(xi,yi,'*',x,y);
set(gca,'FontSize',24)
set(p(1),'MarkerSize',14)
set(p(2),'LineWidth',2)
legend('data','natural cubic spline')
title('Example showing spline interpolation using rotated data')

figure
xi_cart = [8.125, 8.4, 9, 9.545, 9.6, 9.959, 10.166, 10.2];
yi_cart = [0.0774, 0.099, 0.28, 0.6, 0.708, 1.3, 1.8, 2.177];
p = plot(xi_cart,yi_cart,'*',xi,yi,'*');
set(p(1),'MarkerSize',14)
set(p(2),'MarkerSize',14)
set(gca,'FontSize',24)
legend('original data','rotated data')
