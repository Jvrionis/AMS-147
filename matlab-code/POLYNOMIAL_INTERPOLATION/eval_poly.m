function y = eval_poly(a,x)
% This function evaluates the polynomial with coefficients 
% a =[a(1) .... a(n)] i.e., 
%
% p(x) = a(1) + a(2)*x + .....+ a(n)*x^{n-1}
%
% at any vector of points x 
%
n=length(a);
y=ones(size(x))*a(1); % This is the constant term

for k=2:n
    y=y+a(k)*x.^(k-1); % This builds the whole polynomial
end



end

