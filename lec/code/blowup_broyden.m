function [v,x,rhist] = blowup_broyden(alpha)

  % -- Number of (interior) mesh points and mesh spacing
  N = 50;                  % Number of (interior) mesh points
  h = 1/(N+1);             % Mesh spacing
  x = linspace(0,1,N+2)';  % Mesh points

  % -- Tridiagonal matrix
  e = ones(N,1);
  T = spdiags(e*([1, -2, 1]/h^2), -1:1, N,N);

  % -- Initial guess
  v = alpha .* x .* (1-x);
  J = spdiags([e/h^2, exp(v(2:N+1))-2/h^2, e/h^2], -1:1, N,N);

  % -- Run solver
  f = @(u) T*u + exp(u);
  [vv, rhist] = broyden(v(2:N+1), f, T + speye(N), 40);
  v(2:N+1) = vv;