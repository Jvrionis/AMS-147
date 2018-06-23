function test_Lagrange_interpolation()
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   test_Lagrange_interpolation.m                             %
%                                                             %
%  1. Even spaced grid: N+1 point                             %
%  2. Uneven spaced grid: N+1 points (chebyshev quad pts)     %
% Graph:                                                      %
%  Blue = plot function(1)    Red = Lagrangian interpolants   %
%  Each Figure(1..4) should include the graph f(x),           %
%  data points (x_i, f(x_i))                                  %
%                                                             %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% Nonliear Function from ex2                                  %
f = @(x) 1./(1+20*x.^2);

% Even and Odd x values for for-loop
N=8;
n=20;
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% x_j even                                                    %
% x_j un-even                                                 %
for j=0:8 
  xjeven(j+1) = -1 + (2*(j/N));
  xjuneven(j+1) = cos((pi/N)*j) ;

end
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% x_k even                                                    %
% x_k uneven                                                  %
for k=0:20 
  xkeven(k+1) = -1 + (2*(k/n));
  xkuneven(k+1) = cos((pi/n)*k);

end
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% case 1                                                      %
x = linspace(-1,1,1000);

figure(1)
clf
plot(x,f(x), ':b')
hold
plot(xjeven, f(xjeven), 'b--');
[y] = Lagrange_interp(xjeven, f(xjeven), x);
plot(x,y, 'r.')
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% case 2                                                      %
figure(2)
clf
plot(x,f(x), ':b')
hold
plot(xkeven, f(xkeven), 'b--');
[y] = Lagrange_interp(xkeven,f(xkeven),x);
plot(x,y, 'r.')
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% case 3                                                      %
figure(3)
clf
plot(x,f(x), ':b')
hold
plot(xjuneven, f(xjuneven), 'b--');
[y] = Lagrange_interp(xjuneven,f(xjuneven),x);
plot(x,y, 'r.')
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% case 4                                                      %
figure(4)
clf
plot(x,f(x), ':b')
hold
plot(xkuneven, f(xkuneven), 'b--');
[y] = Lagrange_interp(xkuneven,f(xkuneven),x);
plot(x,y, 'r.')
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% Simple Analysis:                                            %
% figure 1 give the largest error.                            %
% figure 4 and figure 2 gives us the smallest error           %
% figure 3 is hard to tell....                                %
%-------------------------------------------------------------%
