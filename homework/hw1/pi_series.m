% ------------------------------------------------------------------ %
% James Vrionis                                                      %
% 1-25-15                                                            %
% Homework 1 #4                                                      %
% compute a Matrix x a vector                                        %
% AMS-147                                                            %
% ------------------------------------------------------------------ %

% ------------------------------------------------------------------ %
function pi_series()

m=10;

P=zeros(m,1);

P(1) = (1/1)*(4-(2/4)-(1/5)-(1/6))
for i=2:m
    j= i+1
    P(i) = P(i-1)+(1/(16^j))*((4/(8*j+1))-(2/(8*j+4))-(1/(8*j+5))-(1/(8*j+6)));
end

E=zeros(m,1);

%E(1) = sqrt(6)*sqrt(1);
for i = 1:m
    j=i+1;
    E(i)=sqrt(6)*sqrt(1/(j^2));

end

figure(1);
clf;
plot(P(1:10),'r.');
hold;
plot(E(1:10),'b.');


% As it looks the Simon Plouffe series converges much faster to pi than 
% the Euler summation.


% ------------------------------------------------------------------ %
