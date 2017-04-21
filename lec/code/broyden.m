% [x] = broyden(x0, f, J, m, rtol)
%
% Attempt to solve f(x) = 0 via Broyden's method (no line search).
%
% Inputs:
%   x0:   Initial guess
%   f:    Function handle
%   J:    Initial Jacobian approximation or approx Jacobian solver (default: I)
%   m:    Number of nonlinear steps (default: 40)
%   rtol: Residual tolerance (default: 1e-8)
%
% Outputs:
%   x:     Current best guess
%   rhist: Residual history
%
function [x, rhist] = broyden(x, f, J, m, rtol, maxit)

  % -- Set default arguments
  n = length(x);
  if nargin < 3,  J = [];       end
  if nargin < 4,  m = 40;       end
  if nargin < 5,  rtol = 1e-8;  end
  if nargin < 6,  maxit = 100;  end

  % -- Regularization parameter for bordered system
  tau = 1e-8;

  % -- Set up invJ0 function
  if isa(J, 'function_handle')
    invJ0 = J;
  elseif isempty(J)
    invJ0 = @(x) x;
  elseif issparse(J)
    [L,U,P,Q] = lu(J);
    invJ0 = @(x) Q*(U\(L\(P*x)));
  else
    [L,U,P] = lu(J);
    invJ0 = @(x) U\(L\(P*x));
  end

  % -- Set up storage for intermediates
  G = zeros(n,m);       % Rescaled residual vectors J0\f
  S = zeros(n,m);       % Step vectors
  C = zeros(m);         % Schur complement system in bordered system
  rhist = zeros(m+1,1); % Residual history

  % -- Main iteration

  fx = f(x);
  g  = -invJ0(fx);
  rhist(1) = norm(fx);

  for k = 1:m

    % Compute step
    if k > 1
      w  = S(:,1:k-1)' * g;
      mu = C(1:k-1,1:k-1) \ w;
      s  = g + G(:,1:k-1) * mu;
    else
      w  = [];
      s  = g;
    end

    % Take step and get new residual
    x  = x + s;
    fx = f(x);
    g  = -invJ0(fx);

    % Record residual and convergence check
    rhist(k+1) = norm(fx);
    if norm(fx) < rtol
      rhist = rhist(1:k+1);
      break;
    end

    % Update matrices for bordered system
    S(:,k)     = s;
    G(:,k)     = g;
    C(1:k-1,k) = -w;
    C(k,1:k)   = -s'*G(:,1:k);
    C(k,k)     = tau + s'*s + C(k,k);

  end

end
