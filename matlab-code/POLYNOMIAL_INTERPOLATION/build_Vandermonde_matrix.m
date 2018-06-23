function [V] = build_Vandermonde_matrix(xi)
% This function returns the Vandermonde matrix corresponding to 
% the set of interpolation nodes xi
%
% Input 
%       xi -> column vector 
%
% Output 
%       V -> Vandermonde matrix 

N=length(xi)-1;
V=ones(length(xi),1); % this is a column vector of ones

for k=1:N
    V=[V xi.^k];

end

end
