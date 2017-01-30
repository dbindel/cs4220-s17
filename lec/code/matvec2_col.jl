function matvec2_col(A,x)
  # Form y = A*x (column-oriented)
  m = size(A, 1)
  n = size(A, 2)
  y = zeros(m,1)
  for j = 1:n
    y = y + A[:,j]*x[j]
  end
  return y
end
