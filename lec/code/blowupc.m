function [V,x,gammas] = blowupc

  % -- Number of (interior) mesh points and mesh spacing
  N = 50;                  % Number of (interior) mesh points
  h = 1/(N+1);             % Mesh spacing
  x = linspace(0,1,N+2)';  % Mesh points

  % -- Set up some things for solver
  e = ones(N,1);

  % -- Initial value for gamma and solution at gamma = 0
  gamma = 0;
  v = x .* (1-x)/2;
  V = v;
  gammas = [gamma];

  % -- Continuation loop
  dgamma = 0.1;
  vprev = v;
  
  while (dgamma > 1e-4) & (gamma < 100)
    gamma_prev = gamma;
    gamma = gamma + dgamma;

    % -- Newton loop (fixed number of steps)
    for k = 1:5

      % Compute residual vector and record norm
      r = ( v(1:N)-2*v(2:N+1)+v(3:N+2) )/h^2 + exp(gamma * v(2:N+1));

      % Form (sparse) Jacobian
      J = spdiags([e/h^2, gamma*exp(gamma * v(2:N+1))-2/h^2, e/h^2], -1:1, N,N);

      % Compute Newton update
      p = J\r;
      v(2:N+1) = v(2:N+1)-p;

      % Quit if we are making small changes
      if norm(p) < 1e-10 * norm(v), break; end
    end

    % -- Accept step or reject and try a shorter step
    if norm(p) < 1e-10 * norm(v)
      V = [V, v];
      gammas = [gammas, gamma];
      vprev = v;
    else
      v = vprev;
      gamma = gamma_prev;
      dgamma = dgamma / 2;
    end
 
  end