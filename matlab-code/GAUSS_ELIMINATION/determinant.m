function [d] = determinant(A)

% This function computes the determinant of a matrix 
% A by using the LU factorization 

[L,U,P,s]=lu_factorization(A);

d=prod(diag(U))*(-1)^s;

end

