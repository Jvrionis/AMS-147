function [y,t ] = AB3(fun,y0,T,DT,IOSTEP)
%-------------------------------------------------------------%
%   Program written using GNU Octave, compatable with MATLAB  %
%   James Vrionis                                             %
%   AB3.m 												      %
%                                                             %
% Inputs:													  %
%        fun - Function handle representing f(y,t) 			  %
%        y0 - Column vector with the initial condition 	      %
%        T - Period of integration 						      %
%        DT - Time step  						      		  %
%        IOSTEP - Input/output step.  						  %
% 		 The solution is saved in the output matrix  	      %
%		 y every IOSTEP steps.								  %
%                                                             %
% Output: 												      %
%        y - NxS matrix collecting time snapshots of the 	  %
%        solution to (2). 								      %
%		 NOTE: that the total number of snapshots S 	      %
%			   (including the initial condition) is 		  %
%					floor(T/(IOSTEP*DT))+1. 				  %
%        t - Vector collecting the time instance at which 	  %
%        the solution is saved in the output matrix y. 	      %
%-------------------------------------------------------------%

%-------------------------------------------------------------%
% This is for a easier output to see, that doesn't 
% take 20 minutes
NSTEPS = T/DT;
T = DT*NSTEPS;
y = y0;
t0 = 0;
t = 0;
%-------------------------------------------------------------%

%-------------------------------------------------------------%
y1 = y0 + DT/2*(fun(y0+DT*fun(y0,t0), t0+DT)+fun(y0,t0));
t1 = t0 + DT;

y2 = y1 + DT/2*(fun(y1+DT*fun(y1,t1), t1+DT)+fun(y1,t1));
t2 = t1 + DT;
%-------------------------------------------------------------%

%-------------------------------------------------------------%
for i=2:NSTEPS
	y3 = y2 + DT/12*(23*fun(y2,t2) - 16*fun(y1,t1) + 5*fun(y0,t0));
	t3 = t2 + DT;

	y0 = y1;
	t0 = t1;
	
	y1 = y2;
	t1 = t2;
	
	y2 = y3;
	t2 = t3;

	if mod(i,IOSTEP) == 0
		y = [y y3];
		t = [t t3];
        %y = [y y0];
		%t = [t t0];
	end
end
%-------------------------------------------------------------%

end
