function [z0,iter,res,his] = Newton_method(fun,dfun,x0,tol,Nmax)
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   Newton_method.m                                           %
%                                                             %
%   This program will implement the Newton method to find     %
%   the zeros of nonlinear (scalar) equations.                %
%          --------------------------------------             %
%  Inputs:                                                    %
%        fun  - Function handle representing the Jacobian     %
%        x0   - Initial guess                                 %
%        tol  - Tolerange on the 2-norm of the increment      %
%        dfun - Function representing df(x)/dx (NM)           %
%        Nmax - Maximum number of iteration                   %
%                                                             %
%  Outputs:                                                   %
%        z0   - Approx. of the zero z_0                       %
%        iter - Number of iterations to get z_0               %
%        res  - Quantity remaining at z_0                     %
%        his  - vector collecting all elements of sequence    %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
x1 = x0-fun(x0)/dfun(x0);
his(1) = x1;
iter=1;
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% if this doesnt run z0 will return line 58                   %
if abs(x1-x0)<=tol
    z0=x1;
    res=abs(fun(z0));
    return;
end
%-------------------------------------------------------------%

%-------------------------------------------------------------%
while (abs(x1-x0)>tol && iter<=Nmax)
    x0 = x1;
    x1 = x0-fun(x0)/dfun(x0);
    iter = iter+1;
    his(iter)= x1;    
end
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% set z0 to iter                                              %
z0=his(iter);
res = fun(z0);
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% Error Checking:                                             %
if (iter == Nmax && x>tol)
   error('TOLERANCE ERROR: Not enough iterations to achieve')
end
%-------------------------------------------------------------%
