% [x] = bezier_plot(p, t)
%
% Plot a cubic Bezier curve defined by the four columns of p.
%
function [x] = bezier_plot(p, t)

  if nargin < 2
    t  = linspace(0,1);
  end
  Bt = [(1-t).^3; 3*(1-t).^2.*t; 3*(1-t).*t.^2; t.^3];
  x  = p*Bt;
  if nargout < 1,
    plot(x(1,:), x(2,:));
  end

end