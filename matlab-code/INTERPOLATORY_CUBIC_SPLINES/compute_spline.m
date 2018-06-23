function [x,y] = compute_spline(M,xi,f)
% This function computes the spline interpolating 
% f (vector) at xi (vector). We consider 100 points within each 
% interval [xi(j), xi(j+1)]
%
% Input
%       M -> solution to the M-continuity system
%      xi -> vector of interpolation nodes
%      f  -> vector of data points at xi
%

N =100; 

h=diff(xi);

n=length(xi);

     C(1) = (f(2)-f(1))/h(1)- h(1)/6*(M(2)-M(1));
     B(1) = f(1)-M(1)*h(1)^2/6;
     x    = linspace(xi(1),xi(2),N);
     y    = M(1)/(6*h(1))*(xi(2)-x).^3 + M(2)/(6*h(1))*(x-xi(1)).^3 + ... 
           C(1)*(x-xi(1))+B(1);


for i=2:n-1

     C(i) = (f(i+1)-f(i))/h(i)- h(i)/6*(M(i+1)-M(i));
     B(i) = f(i)-M(i)*h(i)^2/6;
     x1   = linspace(xi(i),xi(i+1),N);      
     x    = [x   x1 ];
     y    = [y   M(i)/(6*h(i))*(xi(i+1)-x1).^3 + M(i+1)/(6*h(i))*(x1-xi(i)).^3 + ... 
             C(i)*(x1-xi(i))+B(i)];

end
     


end

