function solve_ODE_system()
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   solve_ODE_system.m                                        %
%                                                             %
%   1. The plots of the trajectories:                         %
%                    y1(t), y2(t) and y3(t)                   %
%                              vs.                            %
%                    time in figure(1).                       %
%   2. A three-dimensional plot of the curve                  %
%                   (y1(t),y2(t),y3(t))                       %
%   in figure(2) (use the command plot3()).                   %
%   Such curve provides a visualization of                    %
%   the strange attractor.                                    %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
DT = 1e-2;
T = 5;
NSTEPS = T/DT;
IOSTEPS =1;
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% Comment out above and uncomment below to get results
% that are more precise
% % DT = 1e-3;
% % T = 1e3;
% % NSTEPS = T/DT;
% % IOSTEPS =50;
%-------------------------------------------------------------%

%-------------------------------------------------------------%
%AB3 - 3D solver   
y0 = [1 2 3]';   % pi/4 (starting position) 0 (velocity)
[y,t] = AB3(@(y,t) hw(y,t), y0,T, DT, IOSTEPS);
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% Three Trajectories plots vs time
figure(1)
clf
plot(t,y(1,:), 'r') %position
hold
plot(t,y(2,:), 'b') %derrivative
plot(t,y(3,:),'k') 
xlabel('time') 
%-------------------------------------------------------------%

%-------------------------------------------------------------%
figure(2) 
clf
plot3(y(1,:),y(2,:),y(3,:), 'k') 
xlabel('y_1')
ylabel('y_2')
zlabel('y_3')
grid
%-------------------------------------------------------------%

%-------------------------------------------------------------%
end
%-------------------------------------------------------------%
