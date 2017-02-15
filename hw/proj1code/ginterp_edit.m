% [obj] = ginterp_addval(obj, edges)
%
% Edit edge weights in a graph interpolation problem.
%
% Input:
%   edges: Rows [i,j,w] corresponding to updates to edge (i,j) weight
%
% Output:
%   obj: Structure containing the obj data in the fields (see README)
%
function [obj] = ginterp_edit(obj, edges)
  obj.edits = [obj.edits; edges];
end
