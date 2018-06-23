function plot_airfoil()
% This function reads in NACA0012 data and returns a spline 
% approximatin of the airfoil

load naca0012.dat


xi = naca0012(:,1);
yi = naca0012(:,2);

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
plot(xi,yi,'r.')


end

