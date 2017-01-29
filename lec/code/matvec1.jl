function matvec1(A,x)
  # Form y = A*x (version 1)
  m = size(A, 1)
  n = size(A, 2)
  y = zeros(m,1)
  for i = 1:m
    for j = 1:n
      y[i] = y[i] + A[i,j]*x[j]
    end
  end
  return y
end
