function [z,w] = get_GL_points_and_weigths(a,b,N)
%
% This function returs the Gauss-Legendre (GL) points and 
% integration weights in [a,b]
% 
% Input a,b -> endpoints of the interval [a,b]
%         N -> number of GL points in [a,b]
%
% Output z -> GL points in [a,b]
%        w -> integration weights in [a,b]

syms x

eta = vpasolve(legendreP(N,x) == 0);
z   = (b-a)/2*eta + (b+a)/2;

dL=diff(legendreP(N,x),x,1); % symbolic derivative of Legendre

w = (b-a)./((1-eta.^2).*subs(dL,eta).^2);

w=double(w);
z=double(z);
end

