% [obj] = ginterp_eval(obj)
%
% Re-compute u field.  This should *not* involve any additional
% factorization of the large matrix.
%
% Output:
%   obj: Structure containing the obj data in the fields (see README)
%
function [obj] = ginterp_eval(obj)

  if ~isfield(obj, 'R'), obj = ginterp_factor(obj); end

  % TASK
  obj.u(1:end) = 0;
  % END TASK
end
