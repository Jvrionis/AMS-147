function [zc,zn] = test_zero()
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   test_zero.m                                               %
%                                                             %
%   1) This function will graph:                              %
%               f(x) = 16x^5-20x^3+5x, x [-1,1]               %
%   2) Plots of convergence history for the chord method      %
%   and the Newton method using semilogy (semi-long scale)    %
%   i.e. using:                                               %
%               e_k = |x^(k) - z0 | versus k.                 %
%   Which method converges to z0 faster?                      %
%   3) The plots of:                                          %
%               e_k+1 = |x^(k+1) - z0 | (y-axis)              %
%                        vs.                                  %
%               e_k = | x^(k) - z0 | (x-axis)                 %
%   in a log-log scale using the mathlab command              %
%   (loglog) for chord and Newton methods. Plots are of       % 
%   the same form as figure (3).                              % 
%   For sufficiently large k, slop of the curves in such      %
%   log-log plots represents the convergence order of the     %  
%   sequences.                                                %
%                                                             %
%    tol = 10e-15;    Nmax = 2000;                            %
%    a = -0.99;    b =-0.9;    x0 = -0.99;                    %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
a = -0.99;
b = -0.9;
x0 = -.99;
Nmax = 2000;
tol = 10^(-15);
z0 = cos(9/10*pi);
x = linspace(-1,1,2000);
%-------------------------------------------------------------%

%-------------------------------------------------------------%
fun = @(x) 16*(x).^5-20*(x).^3+5*(x);
dfun = @(x) 80*(x).^4-60*(x).^2+5;

[zc,iter1,res1,his1]=chord_method(fun,a,b,tol,Nmax);
[zn,iter2,res2,his2]=Newton_method(fun,dfun,x0,tol,Nmax);

Ezc = abs(his1-z0);
Ezn = abs(his2-z0);
%-------------------------------------------------------------%

%-------------------------------------------------------------%
%  Figure 1                                                   %
% Plot of the the function below                              %
y = 16*x.^5-20*x.^3+5*x;
figure(1)
clf
plot(x,y)
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% figure 2                                                    % 
% this is |x(k)-z0|   
figure(2)
clf
semilogy(Ezc,'ro-')
hold
semilogy(Ezn,'bo-')
%-------------------------------------------------------------%

%-------------------------------------------------------------%
Ezc1 = abs((his1+1)-z0);
Ezn1 = abs((his2+1)-z0);
% slope of |(x(k+1)- z0|                                      %

%-------------------------------------------------------------%
% Figure(3)                                                   %
figure(3)
clf
loglog (Ezc1,'ro-')
hold
loglog (Ezn1,'bo-')
%-------------------------------------------------------------%
