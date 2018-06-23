function [] = test_least_squares_finance()
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   test_least_squares_finance.m                              %
%                                                             %
%   Take exercise 1 to determine an approximation             %
%   using least squares polynomial of the attached file:      %
%                        Dow_Jones_2012_2017.dat              %
%   Containing normalized (financial) data set from           %
%                       2-14-2012 to 2-13-2017                %
%   of "Dow Jones" closing prices of the                      %
%                                                             %
%       For M = 1, 2, 4, 8                                    %
%       w/ domain [0,1]                                       %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
data = load('Dow_Jones_2012_2017.dat')
x = data(:,1);
y = data(:,2);

L = linspace(0,1,500);
%-------------------------------------------------------------%

%-------------------------------------------------------------%
[w1,err1] = poly_least_squares(x,y',1);
[w2,err2] = poly_least_squares(x,y',2);
[w3,err3] = poly_least_squares(x,y',4);
[w4,err4] = poly_least_squares(x,y',8);
%-------------------------------------------------------------%

%-------------------------------------------------------------%
plot(x,y,'c')
hold on
plot(L,polyval(w1,L),'k')
hold on
plot(L,polyval(w2,L),'m')
%-------------------------------------------------------------%

