function [z,w] = get_GLL_points_and_weigths(a,b,N)
%
% This function returs the Gauss-Legendre-Lobatto (GLL) points and 
% integration weights in [a,b]
% 
% Input a,b -> endpoints of the interval [a,b]
%         N -> number of GLL points in [a,b]
%
% Output z -> GLL points in [a,b]
%        w -> integration weights in [a,b]

syms x
n=N-1;
dL=diff(legendreP(n,x),x,1); % symbolic derivative of legendre
eta = vpasolve(((1-x.^2).*dL) == 0);

z   = (b-a)/2*eta + (b+a)/2;

w   = (b-a)./(n*(n+1).*subs(legendreP(n,x),eta).^2);

w=double(w);
z=double(z);
end

