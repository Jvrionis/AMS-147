%Solve a system of ODEs dy/dt=f(y,t) with initial condition y(0)=y0 using
%Adams Bashforth 2nd order. 
%George Labaria, AMS 147
function [y,t] = AB2(fun,y0,T,DT,IOSTEP)

iter = 1;
nout = floor(T/(IOSTEP*DT))+1;
n = length(y0); %order of system
y = zeros(n,nout);
t = zeros(nout,1);
yold = y0;
told = 0;
y(:,1) = y0;
t(1) = 0;
iterout = 2;
%for the 1st iteration (approximation of y1, use Euler's Method (1 iteration of Euler's)),
ynew = yold+DT*fun(yold,told);
tnew = told+DT;
if IOSTEP==1
    y(:,iterout) = ynew;
    t(iterout) = tnew;
    iterout = iterout+1;
end
iter = iter+1;
yold2 = yold; %need to save the 0th iteration since AB needs 2 prev points
told2 = told; % "
yold = ynew;
told = tnew;
% end Euler's
while iter*DT <= T
    ynew = yold+DT/2*(3*fun(yold,told)-fun(yold2,told2));
    tnew = told+DT;
    %save only every IOSTEP iterations
    if mod(iter,IOSTEP) == 0
        y(:,iterout) = ynew;
        t(iterout) = tnew;
        iterout = iterout+1;
    end
    iter = iter+1;
    yold2 = yold;
    told2 = told;
    yold = ynew;
    told = tnew;
end