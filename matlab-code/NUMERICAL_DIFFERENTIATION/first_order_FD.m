function [x,D] = first_order_FD(a,b,N)
%
% This function returns the differentiation matrix
% of first-order finite difference approximation 
%
% Input: 
%        a,b -> endopoints of the interval [a,b]
%          N -> number of points in [a,b] including endpoints
%
%          x -> column vector of coordinates (all nodes in [a,b])
%          D -> first-order differentiation matrix

x= linspace(a,b,N)';
h=x(2)-x(1);

D=-diag(ones(N,1))+diag(ones(N-1,1),1);
D(end,:)=D(end-1,:);
D =D/h;

end

