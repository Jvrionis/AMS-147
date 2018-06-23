function [z0,iter,res,his] = chord_method(fun,a,b,tol,Nmax)
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   chord_method.m                                            %
%                                                             %
%   This program will implement the chord method to           %
%       find the zeros of nonlinear (scalar) equations.       %
%          --------------------------------------             %
%  Inputs:                                                    %
%        fun  - Function handle representing f(x)             %
%        a,b  - interval [a,b] with initial guess to be 0     %
%               Max tolerance allowed for |x^(k+1)-x^(k)|     %
%        tol  - Tolerange on the 2-norm of the increment      %
%        Nmax - Maximum number of iteration                   %
%                                                             %
%  Outputs:                                                   %
%        z0   - Approx. of the zero z_0                       %
%        iter - Number of iterations to get z_0               %
%        res  - quantity remaining at z_0                     %
%        his  - vector collecting all elements of sequence    %
%-------------------------------------------------------------%

% Recall: q^(k) = f(b) - f(a) / b - a for ever k>0            %
%-------------------------------------------------------------%
x = (fun(b)-fun(a))/(b-a);
his(1) = b - (1/x)*fun(b);
his(2) = his(1)- (1/x)*fun(his(1)); 
%-------------------------------------------------------------%

%-------------------------------------------------------------%
iter = 2;
while (abs(his(iter) - his(iter-1)) >= tol  && iter < Nmax)
  his(iter+1) = his(iter) - (1/x)*fun(his(iter));
  iter += 1;
end

%his=his(1:iter);
z0 = his(iter);
res = abs(fun(his(iter)));
%-------------------------------------------------------------%

%-------------------------------------------------------------%
if (iter== Nmax && x>tol)
     error('TOLERANCE ERROR: Not enough iterations')
end
%-------------------------------------------------------------%
