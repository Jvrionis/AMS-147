function  [L,U,P,s]=lu_factorization(B)
%
% This function computes the LU factorization of a matrix A
% by using Gauss elimination with pivoting by row. 
% 
% Input: 
%        B -> n x n matrix 
%      
% Output: 
%        L -> lower triangular matrix 
%        U -> upper triangular matrix 
%        P -> permutation matrix
%        s -> number of row permutations we perform in Gauss 
%             elimination 

n  = size(B,1);
IDX = [1:n];
 s = 0;
for i=1:n-1

% pivoting step
[m,idx]=max(abs(B(i:end,i)));

    if idx~=i && idx>i
        s=s+1;
        V=B(i,:);
        B(i,:)= B(idx+i-1,:);
        B(idx+i-1,:)=V;
        
        kk=IDX(i);
        IDX(i)=IDX(idx+i-1);
        IDX(idx+i-1)=kk;
        
    end
    
% Elimination step
    for j=(i+1):n
        dd=B(j,i)/B(i,i);
        B(j,i:end )= B(j,i:end) - (B(j,i)/B(i,i))*B(i,i:end);
        B(j,i) = dd;
    end
    
end

P=eye(n); P=P(IDX,:);
U=triu(B);
L=eye(n)+tril(B,-1);






end

