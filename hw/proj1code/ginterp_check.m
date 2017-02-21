% ginterp_check(obj)
%
% Check consistency of the u field with the equations.
%
function ginterp_check(obj)

  % Find which dofs should be determined by equations vs constrained
  mark_bc = zeros(obj.n,1);
  mark_bc(obj.u2v(obj.na+1:end)) = 1;
  mark_bc(obj.newbc) = 1;
  Ia = find(mark_bc == 0);
  Ib = find(mark_bc == 1);
  ub = obj.u(Ib);

  % Compute residual (incorporating any edits)
  r = obj.L * obj.u;
  for k = 1:size(obj.edits,1)
    e = obj.edits(k,1:2);
    w = obj.edits(k,3);
    r(e) = r(e) + [w, -w; -w, w] * obj.u(e);
  end

  % Check residual
  fprintf('Residual norm: %e\n', norm(r(Ia),inf));
  fprintf('BC mismatch:   %e\n', norm(obj.u(Ib)-ub));

end
