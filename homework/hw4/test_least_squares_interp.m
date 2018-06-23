function test_least_squares_interp()
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   test_least_squares_interp.m                               %
%                                                             %
%  See:        poly_least_squares.m                           %
%                       and                                   %
%           test_least_squares_finance.m                      %
%          xj = -1 + 2*j/15                                   %
%          yj = 1 / (2 + sin(20x^{2}_j) )                     %
%          for j = 0,...,15                                   %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
for i=0:15
	x(i+1)= -1+(2/15)*i;
	y(i+1)= 1/(2+sin(20*(x(i+1))^2));
end
x;
y;

[a,err] = poly_least_squares(x,y,15);
%-------------------------------------------------------------%

%-------------------------------------------------------------%
plot(x,y,'bo')
hold on;
A=linespace(-1,1,1000);
plot(A,polyval(a,A),'k')
end
%-------------------------------------------------------------%
