x = simple_newton(@(x) 3*x^3 - x^2 + 10, ...
                  @(x) 9*x^2 - 2*x, 1);
