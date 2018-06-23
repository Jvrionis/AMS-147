function [x] = backward_substitution(U,d)
% This function computes the solution to the upper triangular
% system U*x=d
%
% Input: 
%        U -> upper triangular matrix (n x n)
%        d -> column vector of size n
%
% Output: x -> solution to U*x=d

n=length(d);
x=zeros(n,1);

for k=fliplr(1:n)
    
    S=0; 
    for j=(k+1):n
        S=S+U(k,j)*x(j);
    end
    x(k)= (d(k)-S)/U(k,k);
    
end

end

