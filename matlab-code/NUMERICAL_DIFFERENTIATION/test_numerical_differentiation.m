function  test_numerical_differentiation()

% This function plots the errors (in the uniform norm) 
% of several numerical approximations of the first-order 
% derivative of a function

f  =@(x) sin(x); 
df =@(x) cos(x);

a=1; 
b=10;

N=10:2:300;

M=length(N);

err = zeros(3,M);

for i=1:M
    [x,D] = first_order_FD(a,b,N(i));
    err(1,i) = max(abs(df(x)-D*f(x)));
    
    [x,D] = second_order_FD(a,b,N(i));
    err(2,i) = max(abs(df(x)-D*f(x)));

    [x,D] = pseudo_spectral_derivative(a,b,N(i)); 
    err(3,i) = max(abs(df(x)-D*f(x)));
end

figure(1)
clf
loglog(N,err(1,:),'r-');
hold
loglog(N,err(2,:),'b-');
loglog(N,err(3,:),'k-');
loglog(N,1./N.^2,'b--')
loglog(N,1./N,'r--')
grid
legend('1st order FD','2nd order FD','Pseudo-spectral');
xlabel('$N$','Interpreter','Latex')
ylabel('$\left\|f''(x)-f''_N(x)\right\|_{\infty}$','Interpreter','Latex')
set(gca,'Fontsize',13)


end

