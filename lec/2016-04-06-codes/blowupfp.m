function [v,x,rhist] = blowupfp(alpha)

  % -- Number of (interior) mesh points and mesh spacing
  N = 50;                  % Number of (interior) mesh points
  h = 1/(N+1);             % Mesh spacing
  x = linspace(0,1,N+2)';  % Mesh points

  % -- Initial guess
  v = alpha .* x .* (1-x);

  % -- Set up some things for solver
  e = ones(N,1);           % Vector of ones
  rhist = [];              % Residual history

  L = spdiags([-e/h^2, 2*e/h^2, -e/h^2], -1:1, N,N);

  % Newton loop (fixed number of steps)
  for k = 1:12

    % Compute residual vector and record norm
    r = ( v(1:N)-2*v(2:N+1)+v(3:N+2) )/h^2 + exp(v(2:N+1));
    rhist(k) = norm(r);

    % Compute fixed point update
    v(2:N+1) = L\exp(v(2:N+1));
  end

