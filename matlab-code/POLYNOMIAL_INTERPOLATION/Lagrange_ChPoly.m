function [Poly,x] = Lagrange_ChPoly(xi)
% This function computes all Lagrange characteristic 
% polynomials associated with the interpolation nodes xi, 
% and evaluates such polynomials at x.
% 
% Input
%          x  -> row vector of evaluation nodes
%
% Output 
%        Poly -> matrix that has l_j(x) in the jth row.


x = linspace(min(xi),max(xi),3000);

n = length(xi);

Poly = ones(n,length(x));

for k=1:n
    
    for j=1:n
        if j~=k
            Poly(k,:)=Poly(k,:).*(x-xi(j))/(xi(k)-xi(j));
        end
    end
end

    
    


end

