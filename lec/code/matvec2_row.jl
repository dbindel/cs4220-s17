function matvec2_row(A,x)
  # Form y = A*x (row-oriented)
  m = size(A, 1)
  y = zeros(m, 1)
  for i = 1:m
    y[i] = dot(A[i,:], x)
  end
  return y
end
