% Compute the normal u for a Householder reflection
% to map v to s*e1
%
function u = reflector(v)

  u = v;
  u(1) = v(1) + sign(v(1)) * norm(v);
  u = u/norm(u);