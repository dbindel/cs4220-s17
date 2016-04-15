function [V,x,gammas] = blowupmid

  % -- Number of (interior) mesh points and mesh spacing
  N = 50;                  % Number of (interior) mesh points
  h = 1/(N+1);             % Mesh spacing
  x = linspace(0,1,N+2)';  % Mesh points

  % -- Set up some things for solver
  e = ones(N,1);

  % -- Initial value for gamma and solution at gamma = 0
  gamma = 0;
  v = x .* (1-x)/2;
  vmid = 0.125;
  V = v;
  gammas = [gamma];

  % -- Continuation loop
  dvmid = 0.01;
  vprev = v;
  gamma_prev = gamma;

  while (dvmid > 1e-4) & (vmid < 1)
    vmid_prev  = vmid;
    vmid = vmid + dvmid;

    % -- Newton loop (fixed number of steps)
    for k = 1:5

      % Compute residual vector
      r = [( v(1:N)-2*v(2:N+1)+v(3:N+2) )/h^2 + exp(gamma * v(2:N+1));
           v(N/2+1)-vmid];

      % Form (sparse) Jacobian
      J = spdiags([e/h^2, gamma*exp(gamma * v(2:N+1))-2/h^2, e/h^2], -1:1, N,N);
      b = v(2:N+1) .* exp(gamma * v(2:N+1));
      c = zeros(1,N); c(N/2) = 1;

      % Compute Newton update
      p = [J, b; c, 0]\r;
      v(2:N+1) = v(2:N+1)-p(1:end-1);
      gamma = gamma-p(end);

      % Quit if we are making small changes
      if norm(p) < 1e-10 * norm(v)
        dvmid = min(2*dvmid, 0.05);
        break;
      end
    end

    % -- Accept step or reject and try a shorter step
    if norm(p) < 1e-10 * norm(v)
      V = [V, v];
      gammas = [gammas, gamma];
      vprev = v;
      gamma_prev = gamma;
    else
      v = vprev;
      gamma = gamma_prev;
      vmid  = vmid_prev;
      dvmid = dvmid / 2;
    end
 
  end