function [obj0] = tester(obj0)

  if nargin < 1
    fprintf('-- Initial load --\n');
    tic; obj0 = ginterp_load(); toc
  end
  obj = obj0;

  fprintf('\n-- Add initial BCs --\n');
  obj = ginterp_addval(obj, [1; 10; 20], [1; 2; 3]);
  objt = ginterp_teval0(obj);
  ginterp_check(objt);
  fprintf('Sanity check prescribed u: %e\n', ...
          norm(objt.u([1; 10; 20])-[1; 2; 3], inf));

  fprintf('\n-- Redo solve with separate factorization code --\n');
  obj = ginterp_tfactor(obj);
  obj = ginterp_teval(obj);
  ginterp_check(obj);
  fprintf('Sanity check prescribed u: %e\n', ...
          norm(obj.u([1; 10; 20])-[1; 2; 3], inf));

  fprintf('\n-- Add new BCs --\n');
  obj = ginterp_addval(obj, [30; 40], [4; 5]);
  obj = ginterp_teval(obj);
  ginterp_check(obj);
  fprintf('Sanity check prescribed u: %e\n', ...
          norm(obj.u([1; 10; 20; 30; 40])-[1; 2; 3; 4; 5], inf));

  fprintf('\n-- Reweight edge --\n');
  obj = ginterp_edit(obj, [1, 2, -0.5]);
  obj = ginterp_teval(obj);
  ginterp_check(obj);
  fprintf('Sanity check prescribed u: %e\n', ...
          norm(obj.u([1; 10; 20; 30; 40])-[1; 2; 3; 4; 5], inf));

  fprintf('\n-- Compute sensitivity of u(4) to (1,3) edge --\n');
  h = 1e-6;
  tic; S = ginterp_deriv(obj, 4);
  fprintf('Time for deriv: %e\n', toc);
  objp = ginterp_eval(ginterp_edit(obj, [1, 3, h]));
  s_ex = full(S(1,3));
  s_fd = (objp.u(4)-obj.u(4))/h;
  fprintf('S (analytical):  %e\n', s_ex);
  fprintf('S (finite diff): %e\n', s_fd);
  fprintf('Relerr:          %e\n', abs((s_ex-s_fd)/s_fd));

  fprintf('\n-- Compare with updated factorization --\n');
  uu = obj.u;
  obj = ginterp_eval(ginterp_factor(obj));
  ginterp_check(obj);
  fprintf('Check recomputed u: %e\n', norm(obj.u-uu,inf));

end

function [obj] = ginterp_tfactor(obj)
  tic;
  obj = ginterp_factor(obj);
  fprintf('Factor time: %e\n', toc);
end

function [obj] = ginterp_teval(obj)
  tic;
  obj = ginterp_eval(obj);
  fprintf('Solve time: %e\n', toc);
end

function [obj] = ginterp_teval0(obj)
  tic;
  obj = ginterp_eval0(obj);
  fprintf('Basic solve time: %e\n', toc);
end
