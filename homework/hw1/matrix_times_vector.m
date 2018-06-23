% ------------------------------------------------------------------ %
% James Vrionis                                                      %
% 1-25-15                                                            %
% Homework 1 #3                                                      %
% Compute a Matrix times a vector                                    %
% AMS-147                                                            %
% ------------------------------------------------------------------ %

% ------------------------------------------------------------------ %
% rake as input a matrix A and a vector x and output Ax=y            %
function [y] = matrix_times_vector(A,x) 

% set n = to rows of A, m = columns of A                             %
[n,m] = size(A);
% from i to as many rows contained within A
for i=1:n
  % temp keeps allows you to add one the product of one column to    %
  % another                                                          %
  temp =0;
  % from j to as many columns contained within A                     %
  for j = 1:m
      % result(of_row) = Matrix row element*vector column element +  %
      % preceeding row element*vector element
      y(i) = A(i,j)*x(j)+temp;
      % set temp to the next row element                             %
      temp = y(i);
  end    
end      
% ------------------------------------------------------------------ %
