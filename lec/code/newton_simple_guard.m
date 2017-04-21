% Set up function, gradient, and Hessian
phi = @(x) x.*atan(x) - log(1+x.^2)/2;
g   = @(x) atan(x);
H   = @(x) 1./(1+x.^2);

% Compute initial guess and function value
x = 2
phik = phi(x);

% Newton iteration with naive line search
for k = 1:10

  % Try out a Newton step
  p = -g(x)/H(x);
  a = 1;
  phip = phi(x+p);

  % While the objective is too big, cut the step size
  while phip > phik
    a = a/2;
    phip = phi(x+a*p);
  end

  % Update x and reference objective
  x = x + a*p
  phik = phip;

end
