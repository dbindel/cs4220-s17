% [resid] = p2resid(obj, im)
% [resid] = p2resid(obj, lambda)
%
% Produce a residual norm for the deblurring problem.
%
function [resid] = p2resid(obj, im)

  if length(im) == 1
    im = p2tikhonovd(obj, im);
  end

  [h, w, ~] = size(obj.imblur);
  s = obj.s;
  b = obj.imblur;
  resid2 = 0;
  for k = 1:3
    bhat = fft2(double(b(:,:,k)));
    xhat = fft2(double(im(:,:,k)));
    r    = real(ifft2(obj.s .* xhat(:) - bhat(:)));
    resid2 = resid2 + r'*r;
  end
  resid = sqrt(resid2);
end
