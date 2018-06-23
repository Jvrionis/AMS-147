function [y] = Lagrange_interp(xi,yi,x)
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   Lagrange_interp.m                                         %
%                                                             %
%   This program computes the Lagrangian interpolant of       %
%   the given set of data points for                          %
%                    (x_i,y_i) = 1,2,...                      %
%          --------------------------------------             %
% Inputs:                                                     %
%      xi - Vector of interpolation nodes                     %
%      yi - Vector of data points at interpolation nodes      %
%      x - Vector of points to evaluate the poly interpolant  %
% Outputs:                                                    %
%      y - Polynomial interpolant evaluated at x              %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
y=0;
n = length(xi);
Poly = ones(n,length(x));
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% Vector of interpolation nodes
for k=1:n    
    for j=1:n
        if j~=k
            Poly(k,:)=Poly(k,:).*(x-xi(j))/(xi(k)-xi(j));
        end
    end
end
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% Polynomial interpolant
for i=1: n
    y += Poly(i,:)*yi(i);
end    
%-------------------------------------------------------------%

