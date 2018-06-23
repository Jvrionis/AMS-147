% ------------------------------------------------------------------ %
% James Vrionis                                                      %
% 1-25-15                                                            %
% Homework 1 #2                                                      %
% Compute the Euclidean Norm of an n-dimensional vector              %
% AMS-147                                                            %
% ------------------------------------------------------------------ %

% ------------------------------------------------------------------ %
% Take a vector x as input and output the Euclidean norm z           %
function [z] = compute_Euclidean_norm(x)

% n = length of input vector x                                       %
n = length(x);

% initialize z to equal 0                                            %
z = 0;

% Alternative way to run for-loop                                    %
% comment out line 14 & 22, and uncomment line 21                    %
% for i = 1:lenght(x);                                               %
for i = 1:n
  z = z + x(i)^2;
end

% Take the square root of the resul from the for-loop                %
z = sqrt(z);

end
% ------------------------------------------------------------------ %  
  