function [rnorm, xnorm, kappa, deta] = p2lcurve(obj, lambda)

  b     = double(obj.imblur);
  imtik = p2tikhonovd(obj, lambda);
  resid = p2applyH(obj, imtik)-b;
  z     = p2tikhonovd(obj, lambda, resid);

  eta = imtik(:)' * imtik(:);
  rho = resid(:)' * resid(:);
  deta = 4/lambda * (imtik(:)' * z(:));

  kappa = -2*eta*rho/deta * ...
          (lambda^2*deta*rho + 2*lambda*eta*rho + lambda^4*eta*deta) / ...
          (lambda^4*eta^2 + rho^2)^(1.5);

  xnorm = sqrt(eta);
  rnorm = sqrt(rho);
