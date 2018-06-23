function [x,D] = pseudo_spectral_derivative(a,b,N)

% This function returns the Gauss-Chebyshev-Lobatto (GCL) 
% quadrature points and differentiation matrix in 
% [a,b] 
%
% Input: 
%        a,b -> endopoints of the interval [a,b]
%          N -> number of Gauss-Chebyshev-Lobatto 
%               points in [a,b] including endpoints
%
%          x -> column vector of GCL nodesin [a,b])
%          D -> first-order pseudo-spectral differentiation 
%               matrix in [a,b]

eta = fliplr(cos(linspace(0,pi,N)))';

x = (b-a)/2*eta+(b+a)/2;

d=ones(1,N);
d(1)=2; d(N)=2;

D = zeros(N,N);
D(1,1)=- (2*(N-1)^2+1)/6;
D(end,end) = (2*(N-1)^2+1)/6;

for j=2:N-1
D(j,j) = -eta(j)/(2*(1-eta(j)^2));
end

for i=1:N
    for j=1:N
        if i~=j
            D(i,j)= d(i)/d(j)* (-1)^(i+j)/(eta(i)-eta(j));
        end
    end
end
D=2/(b-a)*D;
    

end

