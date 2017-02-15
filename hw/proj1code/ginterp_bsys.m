% [B, C] = ginterp_bsys(obj)
%
% Assemble and n-by-k bordering matrix and a k-by-k matrix used
% for block linear systems of the form
%
%   [L, B] [x] = [f]
%   [B' C] [y]   [g]
%
% where eliminating the trailing dofs is used to add new boundary
% constraints and edge weight adjustments that occurred since the
% last factorization.
%
function [B, C] = ginterp_bsys(obj)

  % TASK
  % ... this is dummy code -- replace with something more reasonable!
  k = 0;
  B = zeros(obj.n,k);
  C = zeros(k);
  % END TASK

end
