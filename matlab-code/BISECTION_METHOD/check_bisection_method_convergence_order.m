function check_bisection_method_convergence_order()

% This function check the convergence order of
% the bisection method for the function
%
% f(x)=@(x) x^2-1 
%
% near the zero z0=1

fun = @(x) x.^2 -1;

z0  = 1 ; % zero we are after
a   = 0.1;
b   = 1.31;
TOL = 1e-14;

MAXITER=10000;

[x0,X,iter,res]=bisection_method(fun,a,b,TOL,MAXITER);

en=abs(X-z0); % en(i)=|x^(i)-z0| is the absolute error at bisection step i


%This is the log-log plot of e_{n+1} versus e_{n}

%This is the log plot of e_{n} versus iteration number
figure(5)
clf
semilogy(en,'Linewidth',1.5)
set(gca,'Fontsize',16)
xlabel('n','Fontsize',16)
ylabel('|x^{(n)}-z_0|','Fontsize',16)
grid


figure(6)
clf
loglog(en(1:end-1),en(2:end),'r-','Linewidth',1.5)
set(gca,'Fontsize',16)
xlabel('e_{n}','Fontsize',16)
ylabel('e_{n+1}','Fontsize',16)
grid

