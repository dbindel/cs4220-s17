% [obj] = ginterp_addval(obj, Ib, ub)
%
% Add boundary value to a graph interpolation problem.
%
% Input:
%   Ib: indices where values are applied
%   ub: values at the indicated nodes
%
function [obj] = ginterp_addval(obj, Ib, ub)
  obj.u(Ib) = ub;
  Ib = setdiff(Ib, obj.u2v(obj.na+1:end));
  obj.newbc = union(obj.newbc, Ib);
end
