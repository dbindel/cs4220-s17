% [Q,R] = qrupdate(Q0,R0,u,v)
%
% Efficiently compute the QR factorization after a rank-one update:
%   Q*R = Q0*R0 + u*v'
%
function [Q,R] = my_qrupdate(Q,R,u,v)

  % Transform u into Q0 coordinates
  QTu = Q'*u;

  % Givens rotations working up (reduce to upper Hessenberg)
  n = length(u);
  for j = n:-1:2
    G = givens(QTu(j-1), QTu(j));
    QTu(j-1:j) = G*QTu(j-1:j);
    QTu(j)     = 0;
    R(j-1:j,:) = G*R(j-1:j,:);
    Q(:,j-1:j) = Q(:,j-1:j)*G';
  end

  % Add in the transformed update
  R(1,:) = R(1,:)+QTu(1)*v';

  % Givens rotations working down (return to triangular)
  for j = 1:n-1
    G = givens(R(j,j), R(j+1,j));
    R(j:j+1,j:end) = G*R(j:j+1,j:end);
    R(j+1,j) = 0;
    Q(:,j:j+1) = Q(:,j:j+1)*G';
  end

end