function plot_spline_2D(N)
% This function interpolates random points in 2D using splines


xi = randn(N,1);
yi = randn(N,1);

n=length(xi);
t = linspace(0,1,n);


[M1] = computeM(t,xi);
[M2] = computeM(t,yi);

[tx,xt] = compute_spline(M1,t,xi);
[ty,yt] = compute_spline(M2,t,yi);

figure(1)
clf
plot(xt,yt,'b-')
hold
plot(xi,yi,'ro')


end

