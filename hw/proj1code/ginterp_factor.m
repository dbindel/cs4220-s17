% [obj] = ginterp_factor(obj)
%
% Merge in edits and recompute factorization.
%
function [obj] = ginterp_factor(obj)

  % -- Merge any graph updates into the Laplacian
  nedits = size(obj.edits,1);
  if nedits > 0
    coord  = zeros(4*nedits,3);
    for k = 1:nedits
      i = obj.edits(k,1);
      j = obj.edits(k,2);
      w = obj.edits(k,3);
      coord(4*k-3:4*k,:) = [i,i,w; i,j,-w; j,i,-w; j,j,w];
    end
    Ldiff = sparse(coord(:,1), coord(:,2), coord(:,3), obj.n, obj.n);
    obj.L = obj.L + Ldiff;
  end
  obj.edits = [];

  % -- Merge any BC updates into the Laplacian
  mark_bcs = zeros(obj.n,1);
  mark_bcs(obj.u2v(obj.na+1:end)) = 1;
  mark_bcs(obj.newbc) = 1;
  obj.u2v = [find(mark_bcs == 0); find(mark_bcs == 1)];
  obj.nb = sum(mark_bcs);
  obj.na = obj.n-obj.nb;
  obj.newbc = [];

  % -- Compute factorization and apply permutation to mappings
  % TASK
  % ... Compute R, and maybe update the u2v mapping
  % END TASK

  % -- Update v2u mapping
  obj.v2u(obj.u2v) = 1:obj.n;

end
