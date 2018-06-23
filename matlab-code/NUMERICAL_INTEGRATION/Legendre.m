%George Labaria, AMS 147
function [x,c] = Legendre(n)
%computes Gauss-Legendre points (x) and weights (c) by the Golub-Welsch
%algorithm
b=(1:n-1)';
b=b./sqrt(4*b.^2-1);
J=diag(b,-1)+diag(b,1); %build J_n
[V,D]=eig(J); %eigenvalue decomposition of J_n
x=diag(D);
c=2*(V(1,:).^2)';