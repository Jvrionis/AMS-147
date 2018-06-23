function test_Lagrange_Ch_poly(n)

%xi = linspace(-1,1,n)'; % column vector of intepolation nodes in [-1,1]

xi = cos(linspace(0,pi,n));

[Poly,x] = Lagrange_ChPoly(xi);

figure(1)
clf
hold
box on
grid
for ii=1:size(Poly,1)
    plot(x,Poly(ii,:))
end
plot(xi,zeros(size(xi)),'bo')

xlabel('$x$','Interpreter','Latex')
set(gca,'Fontsize',18);




end

