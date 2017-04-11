function [x] = bezier_intersect(pf, pg)
  % Attempt to compute the intersection of the cubic Bezier curves
  % defined by the columns of pf and pg (each of dimension 2-by-4).

  % Trace curves to get an initial guess (f(t1)-g(t2) near zero)
  t  = linspace(0,1);
  ft = bezier_plot(pf, t);
  gt = bezier_plot(pg, t);
  e = ones(length(t),1);
  dist = (e*ft(1,:)-gt(1,:)'*e').^2 + (e*ft(2,:)-gt(2,:)'*e').^2;
  [i,j] = find(dist == min(min(dist)));
  t = [t(j), t(i)];

  % Run a Newton iteration
  % TODO

end
