function  test_double_pendulum()
% This function computes the numerical solution 
% of a system made of two connected pendula
% by using the Runge-Kutta integration method

global m1 m2 l1 l2 g

NSTEPS = 400000; 
IOSTEP = 100;
DT     = 2e-4;

% Masses
m1 = 4;   % kilograms
m2 = 2; 

% Lengths of the pendula
l1 = 0.5; % meters
l2 = 1; 

g=9.8; % acceleration of gravity m/s^2

% Initial position and momentum of the pendula
y0 = [pi/2 3/4*pi 0 0]';

% Solver
[y,ts] = RK4_method(@ Rhs_double_pendulum,y0,DT,NSTEPS,IOSTEP);

figure(2)
for i=1:length(ts)
clf
hold
x1=l1*sin(y(1,i));
y1=-l1*cos(y(1,i));
x2=l1*sin(y(1,i))+l2*sin(y(2,i));
y2=-l1*cos(y(1,i))-l2*cos(y(2,i));

plot(x1,y1,'ko','Markersize',10,'MarkerFaceColor',[0 0 0])
line([0 x1],[0 y1],'Linewidth', 2,'Color',[0 0 0])

plot(x2,y2, ... 
     'ko','Markersize',5,'MarkerFaceColor',[1 0 0])

line([x1 x2 ],[y1 y2],'Linewidth', 2,'Color',[1 0 0])

% Trajectory
plot(l1*sin(y(1,1:i))+l2*sin(y(2,1:i)),-l1*cos(y(1,1:i))-l2*cos(y(2,1:i)),'b');

axis equal 
box on
axis([-2 2 -2 2])
M(i)=getframe;

end


end

