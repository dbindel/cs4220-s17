% [S] = ginterp_deriv(obj, id)
%
% Compute the sensitivity of the value at a node to weight adjustments
% for any edge in the network.  This should not require any new large
% matrix factorizations.  We assume that u is up-to-date.
%
% Input:
%   id: Identifier of the node where sensitivity is computed
%
% Output:
%   S: Sparse matrix of sensitivities w.r.t. edge weights; should
%      have the same sparsity pattern as L.
%
function [S] = ginterp_deriv(obj, id)

  % TASK
  % ... dummy code, pretends S is the adjacency -- fix!
  [i,j,lij] = find(obj.L);
  sij = (i ~= j);
  S = sparse(i, j, sij, obj.n, obj.n);
  % END TASK
end
