% CS 4220 S17 Final exam
%
% Complete the implementation of each of the following MATLAB
% functions.  Please do *not* change the function interfaces.  In
% addition to the codes, you should include a write-up that describes
% your derivation.  You are allowed to use texts, papers, or other
% references (with citation).  You should not ask help from any other
% person, whether inside or outside the class.  Do not worry if you do
% not get all the answers; if everyone got everything, it would not be
% much of a test!  We reserve the right to ask follow-up questions in
% person (ie.g. to determine whether it makes sense to assign partial
% credit).  You may ask us to clarify ambiguities or perceived errors
% in the prompt, but please do not ask for hints.


function final_codes()
%
% Run correctness checks on problems 2-6.  Please *do* fill in
% this function, and make sure your codes are correct!  You are
% more likely to get partial credit for a code that you know and
% acknowledge is not quite right than for a code that you do not
% realize is wrong.

end


% ==================================================================
function [x, phix] = problem2(l, invAl, invAb)
%
% Compute the minimizer x and the minimum value phi(x) for
% the constrained optimization
%   min phi(x) s.t. l'*x = 1
% where
%   phi(x) = x'*A*x/2 - b'*x

end


% ==================================================================
function [Qt,Rt] = problem3(Q,R)
%
% On input, A = Q*R is a QR decomposition of the square matrix A.
% On output, A*P = Qt*Rt is a QR decomposition for the matrix A*P
% where P is a cyclic permutation (A*P = A(:,[n, 1:n-1])).  This
% must run in O(n^2) time.

end

% ==================================================================
function [mu, gamma] = problem4(alpha, beta)
%
% Given x = G(x) and G'(x) symmetric with eigenvalues in [alpha, beta]
% and beta < 1, find an optimal mu so that the iteration
%
%    x_new = mu*x + (1-mu)*G(x)
%
% converges as rapidly as possible, with convergence rate constant gamma.

end


% ==================================================================
function [Q, H, alpha] = problem4(A, c)
%
% On output, should satisfy
%   Q'*A*Q = H, tril(H,-3) = 0, Q'*Q = I, Q'*c = alpha e_1

end


% ==================================================================
function [x, fnorms] = problem5(N)
%
% Use Newton iteration to solve the equations
%
%    x_{k-1}-(3-x_k/2) x_k + 2 x_{k+1} = 1
%
% for 1 <= k <= N, with x_0 = x_{N+1} = 0.  Return all the components
% (i.e. the output should be a vector of length N+2).

end


% ==================================================================
function [alpha] = problem6(x, d, gamma)
%
% Formulate a linear least squares problem to minimize
%
%   phi(alpha) = sum_{j=d}^m |x(:,j+1)-x(:,j:-1:j-d+1)*alpha|^2
%
% subject to the constraint that the two norm of x is at most gamma.
% The input x is a row vector; the output alpha is a column.  We
% assume that m > 2*d.

end
