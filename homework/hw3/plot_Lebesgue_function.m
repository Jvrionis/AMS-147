function [L] = plot_Lebesgue_function(xi)
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   plot_Lebesgue_function.m                                  %
%                                                             %
%    Applying previous four cases of evenly- and unevenly-    %
%    spaced grids you studied in Exercise 2.                  %
%          --------------------------------------             %
% Inputs:                                                     %
%      xi - Vector of interpolant nodes                       %
%                                                             %
%  Outputs:                                                   %
%      L - Plot of Lebesgue Function                          %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% set up for below plot, and for-loop
x = linspace (-1,1,100);
n = length(xi);
Poly = ones(n,length(x));
%-------------------------------------------------------------%

%-------------------------------------------------------------%
for k=1:n
    for j=1:n
        if j~=k
            Poly(k,:)=Poly(k,:).*(x-xi(j))/(xi(k)-xi(j));
        end
    end
end
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% Plot of Lebesgue Function:
Poly = abs(Poly);
l = sum(Poly,1)
plot(x,l)
L= max(l)
end
%-------------------------------------------------------------%
