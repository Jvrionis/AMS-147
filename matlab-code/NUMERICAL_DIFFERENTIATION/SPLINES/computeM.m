function [M] = computeM(xi,f)
% This function computes the solution to the M-continuity system
% arising in cubic natural spline interpolation
%
% Input 
%         xi -> vector of interpolation nodes
%         f  -> vector of data points at xi

n = length(xi);
h = diff(xi); % If xi is of length n then h is of length (n-1)


% Coefficients
for i=1: n-2
   mu(i)     = h(i)/(h(i)+h(i+1));
   lambda(i) = h(i+1)/(h(i)+h(i+1));
   d(i)      = 6/(h(i)+h(i+1))*( (f(i+2)-f(i+1))/h(i+1) - ... 
                                 (f(i+1)-f(i))/h(i));
end

d=[0 d 0]'; % This is a column vector

% Build Matrix

A = 2*diag(ones(1,n)) + diag([0 lambda],1)+diag([mu 0],-1);

% Solve the system 

M = A\d;



end

