function [x0,X,niter,res] = bisection_method(fun,a,b,tol,maxiter)

% This function computes an approximation of the zero of the
% the function 'fun' by using the bisection method with error control 
% on the interval.
% 
% Input: 
%        fun       -> function handle representing f(x)
%        [a,b]     -> initial guess for the interval including the (simple) zero
%        tol       -> tolerance in interval
%        maxiter   -> maximum number of iterations

% Output:
%        x0                  -> zero
%        X                   -> Sequence x^(k)
%        niter               -> number of iterations to reach accuracy toll
%        res                 -> residual of the function (res=f(x0))
%        bisection_file.dat  -> File including the convergence history
%                               (bisection_file.dat can be loaded in matlab by using
%                               z=load('bisection_file.dat') or simply 'load bisection_file.dat'


x = [a (a+b)/2 b]; % endpoints and midpoint of [a,b]

y = fun(x);  % Value of the function fun at those three points

if y(1)==0     % We got the zero at the x=a (very unlikely)
 x0=x(1);
 return;
elseif y(2)==0  % We got the zero at the midpoint (very unlikely)
 x0=x(2);
 return;
elseif y(3)==0  % We got the zero at x=b (very unlikely)
 x0=x(3);
 return;
elseif  y(1)*y(3)>0
 error('f(a)*f(b)>0 - please modify the interval [a,b]');
elseif a>=b
 error('Please set a<b')
 return;
end


I = (x(3)-x(1))/2;

fprintf('\n\n%Iter          x0                      I\n');
fprintf('%-----------------------------------------------\n\n');

niter = 0;
X(1)=x(2); % midpoint
while I >= tol && niter <= maxiter
niter=niter+1;

fprintf('%d      %15.14f      %15.14f   \n',niter,x(2),I);  % Here we output on the screen iteration number
                                                            % estimate of the zero and length of the interval

if y(1)*y(2)< 0
 x(3) = x(2);
 x(2) = (x(1)+x(3))/2; % Midpoint - here you can use a better formula which is less
                       % sensitive to roundoff errors: x(2) = x(1)+(x(3)-x(1))/2
 X(niter+1)=x(2);
 y = fun(x);
 I = (x(3)-x(1))/2;

elseif y(2)*y(3)< 0
 x(1) = x(2);
 x(2) = (x(1)+x(3))/2;
 X(niter+1) = x(2);
 y = feval(fun,x);
 I = (x(3)-x(1))/2;

elseif find(y==0) 
 x0  = x(find(y==0)); % This means that the zero (to the machine precison) 
                      % is x(2)
 res = 0;
 return
end
end

if (niter==maxiter && I>tol)
 error('Not enough iterations to achieve tolerance %12.12g',tol)
end

x0=x(2);
res=abs(fun(x0));


