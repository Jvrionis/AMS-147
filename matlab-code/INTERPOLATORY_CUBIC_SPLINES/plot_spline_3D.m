function plot_spline_3D(N)
% This function interpolates random points in 2D using splines

% Random points
% xi = randn(N,1);
% yi = randn(N,1);
% zi = randn(N,1);

% Structured points
theta=linspace(0,20*2*pi,N);
zi = linspace(0,1,N);

xi=cos(theta);
yi=sin(theta);


n=length(xi);
t = linspace(0,1,n);


[M1] = computeM(t,xi);
[M2] = computeM(t,yi);
[M3] = computeM(t,zi);

[tx,xt] = compute_spline(M1,t,xi);
[ty,yt] = compute_spline(M2,t,yi);
[tz,zt] = compute_spline(M3,t,zi);

figure(1)
clf
plot3(xt,yt,zt,'b-')
hold
plot3(xi,yi,zi,'ro')
grid

end

