function [ x] = solver_Gauss_elimination(A,b)
%
% This function computes the solution to the linear system 
% A*x=b by using Gauss elimination with pivoting by row. 
% 
% Input: 
%        A -> n x n matrix 
%        b -> n x 1 vector 
%
% Output: 
%        x -> n x 1 vector, solution to A*x=b

B = [A b]; % augmented matrix of the system 

n = length(b);

for i=1:n-1

% pivoting step
[m,idx]=max(abs(B(i:end,i)));

    if idx~=i 
        V=B(i,:);
        B(i,:)= B(idx+i-1,:);
        B(idx+i-1,:)=V;
    end
    
% Elimination step
    for j=i+1:n
        B(j,i:end)= B(j,i:end) - (B(j,i)/B(i,i))*B(i,i:end); 
    end
U=B(:,1:end-1);
d=B(:,end);
    x=backward_substitution(U,d);

end



end

