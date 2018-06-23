function [] = diff_spline( )
%
% This function computes the derivative of a given 
% f(x) by differentiating the interpolating cubic spline 
% corresponding to a given set of interpolation nodes 

a = 0; 
b = 10;
N = 200; %number of points in [a,b] 

% f= @(x) exp(sin(x))+log( exp((cos(x).^2))./(x.^2+1));
f= @(x) cos(x);

xi = linspace(a,b,N);

[M] = computeM(xi,f(xi));
[xs,ys] = compute_spline(M,xi,f(xi));
[dxs,dys] = compute_spline_derivative(M,xi,f(xi));
size(dxs)
size(dys)

% This is the plot of the spline s3(x) that approximates
% f(x)

xx=linspace(a,b,1000);
figure(1)
clf
plot(xx,f(xx),'b-');
hold
plot(xi,f(xi),'ro');
plot(xs,ys,'r--');
h=legend('$f(x)$','data','$s_3(x)$')
xlabel('$x$','Interpreter','Latex')
set(h,'Interpreter','Latex')
set(gca,'Fontsize',16);


figure(2)
clf
plot(xx,-sin(xx),'b-');
hold
plot(dxs,dys,'r--');
h=legend('$f''(x)$','$s''_3(x)$')
xlabel('$x$','Interpreter','Latex')
set(h,'Interpreter','Latex')
set(gca,'Fontsize',16);



end

