function [y] = interp_Vandermonde(xi,yi,x)
% 
% This function computes the polynomial intepolant of the data set
% (xi,yi) and evaluates such polynomial at x
%
% Input: 
%        xi,yi -> data set column vectors
%           

[V] = build_Vandermonde_matrix(xi);
  a = V\yi; % MATLAB LINEAR SOLVER: solves the system 
            % V*a=yi and gives us the coefficients 
            % of the polynomial
  y = eval_poly(a,x);
  
  

end

