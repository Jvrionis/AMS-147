function test_Van(n)
% This function tests interp_Vandermonde
% by computing the inpolating polynomial 
% of a function f(x)
% 
% Input 
%       n-> number of interpolation nodes


%f  = @(x) sin(5*x);
f  = @(x) 1./(1+20*x.^2);

x  = linspace (-1,1,1000)'; % vector of evaluation nodes 
xi = linspace(-1,1,n)'; % column vector of intepolation nodes in [-1,1]

yi =f(xi); % we are  interpolating f(x) at xi 

[y] = interp_Vandermonde(xi,yi,x);


figure(1)
clf 
plot(x,f(x),'r--') % This is the plot of the function f(x)
hold 
plot(x,y,'b-');     % This is the polynomial interpolant
plot(xi,f(xi),'ko') % This are data points

xlabel('$x$','Interpreter','Latex')
set(gca,'Fontsize',18);
L=legend('$f(x)$','$\Pi_n f(x)$','data');
set(L,'Interpreter','Latex')

end

