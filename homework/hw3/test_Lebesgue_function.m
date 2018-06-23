function [L1, L2, L3, L4] = test_Lebesgue_function()
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   Newton_method.m                                           %
%                                                             %
%   This program will implement the Newton method to find     %
%   the zeros of nonlinear (scalar) equations.                %
%          --------------------------------------             %
% Inputs:                                                     %
%        From plot_lebesgue_function()                        %
%                                                             %
% Outputs:                                                    %
%        L1 - Lebesgue constant case 1                        %
%        L2 - Lebesgue constant case 2                        %
%        L3 - Lebesgue constant case 3                        %
%        L4 - Lebesgue constant case 4                        %
%                                                             %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% x_i even & x_i uneven
N = 8;
for j=0:8 
    xieven(j+1) = -1 + (2*(j/N));
    xiuneven(j+1) = cos((pi/N)*j) ;
end
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% x_k even & x_k uneven
n=20;
for k=0:20 
    xkeven(k+1) = -1 + (2*(k/n));
    xkuneven(k+1) = cos((pi/n)*k);
end
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% case 1                                                      %
figure(1)
L1 = plot_Lebesgue_function(xieven)
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% case 2                                                      %
figure(2)
L2 = plot_Lebesgue_function(xiuneven)
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% case 3                                                      %
figure(3)
L3 = plot_Lebesgue_function(xkeven)
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% case 4                                                      %
figure(4)
L4 = plot_Lebesgue_function(xkuneven)

end
%-------------------------------------------------------------%
