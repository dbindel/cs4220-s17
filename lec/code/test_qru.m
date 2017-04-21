A = randn(5);
u = randn(5,1);
v = randn(5,1);

[Q0,R0] = qr(A);
[Q,R] = my_qrupdate(Q0,R0,u,v);
err1 = norm(Q*R - (A+u*v'), 'fro')/norm(A+u*v', 'fro');

R0
R

fprintf('Check factorization: %e\n', err1);
fprintf('Check Q: %e\n', norm(Q'*Q-eye(5)));
fprintf('Check R: %e\n', norm(tril(R,-1), 'fro'));
