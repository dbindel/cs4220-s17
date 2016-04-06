function [v,x,rhist] = blowup(alpha)

  % -- Number of (interior) mesh points and mesh spacing
  N = 50;                  % Number of (interior) mesh points
  h = 1/(N+1);             % Mesh spacing
  x = linspace(0,1,N+2)';  % Mesh points

  % -- Initial guess
  v = alpha .* x .* (1-x);

  % -- Set up some things for solver
  e = ones(N,1);           % Vector of ones
  rhist = [];              % Residual history

  % Newton loop (fixed number of steps)
  for k = 1:20

    % Compute residual vector and record norm
    r = ( v(1:N)-2*v(2:N+1)+v(3:N+2) )/h^2 + exp(v(2:N+1));
    rhist(k) = norm(r);

    % Form (sparse) Jacobian
    J = spdiags([e/h^2, exp(v(2:N+1))-2/h^2, e/h^2], -1:1, N,N);

    % Compute Newton update
    p = J\r;
    v(2:N+1) = v(2:N+1)-p;

    % Quit if we are making small changes
    if norm(p) / norm(v) < 1e-10, break; end
  end

