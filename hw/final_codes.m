% CS 4220 S16 Final exam
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
% Run correctness checks on problems 3-8.  Please *do* fill in
% this function, and make sure your codes are correct!  You are
% more likely to get partial credit for a code that you know and
% acknowledge is not quite right than for a code that you do not
% realize is wrong.

end


% ==================================================================
function [X, update_norms] = problem1(A,X)
%
% Run the iteration X_new = X(2I-AX) for 100 steps or until
% the relative Frobenius norm change is less than 1e-8.
% Return X and the update norms.

end


% ==================================================================
function [A] = problem2()
%
% Return A for which power iteration from a random guess fails to
% converge.

end

% ==================================================================
function [x] = problem3(A)
%
% Minimize norm(A-x*x', 'fro')

end


% ==================================================================
function [Q, A, alpha] = problem4(A, c)
%
% On output, should satisfy
%   Q'*A*Q = H, tril(H,-3) = 0, Q'*Q = I, Q'*c = alpha e_1

end


% ==================================================================
function [J] = problem5(f, x, h)
%
% Compute a tridiagonal Jacobian of f at x by one-sided finite
% differences with step length h.

end


% ==================================================================
function [x, fnorms] = problem6(N)
%
% Use Newton iteration to solve the equations
%
%    x_{k-1}-(3-x_k/2) x_k + 2 x_{k+1} = 1
%
% for 1 <= k <= N, with x_0 = x_{N+1} = 0.  Return all the components
% (i.e. the output should be a vector of length N+2).

end


% ==================================================================
function [x, phi] = problem7(A, b)
%
% Find the global minimum of
%   phi(x) = x'Ax / 2 - x'b + z^4 where z = sum(x)
% Should use only two solves with A.

end


% ==================================================================
function [x, s] = problem8(A, b, C, d)
%
% Robust regression using the Huber loss subject to the constraint C'x = d.
% Run 100 iterations of IRLS -- no need to be too smart about the
% convergence criteria for this problem.  The scale factor s should
% be twice the median residual for the (constrained) ordinary least squares
% problem that gives the initial guess.

end