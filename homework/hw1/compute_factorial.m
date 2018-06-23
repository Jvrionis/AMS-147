% ------------------------------------------------------------------ %
% James Vrionis                                                      %														 
% 1-25-15                                                            %															 
% Homework 1 #1                                                      % 														 
% compute_factorial.m computes n!= 1*2*3 *** (n-1)*(n)               %				       
% AMS-147                                                            %															                                
% ------------------------------------------------------------------ %

% ------------------------------------------------------------------ %
% The factorial of a Real number n is defined as                     %
% n! = n(n-1)(n-2) ... 1  if 0!=1                                    %
% ------------------------------------------------------------------ %

% ------------------------------------------------------------------ %
% function call: take n as input and output b                        %
function [ b ] = compute_factorial(n)
 % base case:
 % the terminating scenario in recursion that does not use recursion %
 % to produce an answer. Returns 1 if n <= 1                         %
 if n <= 1
    b = 1;
 % set b equal to n * function call n-1                              %

 else   
    b = compute_factorial(n - 1) * n;
 end % end of if-else  %
end % end of function  %
% ------------------------------------------------------------------ %
