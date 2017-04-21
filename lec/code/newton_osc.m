% Demo to show oscillation of Newton iteration

phi = @(x) 19*x.^2 -  4*x.^4 +  7/9*x.^6;
g   = @(x) 38*x    - 16*x.^3 + 14/3*x.^5;
gp  = @(x) 38      - 48*x.^2 + 70/3*x.^4;

% Check convexity bound
r = roots([280/3, 0, -96, 0]);
fprintf('Lower bound on second deriv: %g\n', min(gp(r)));

u(1) = 1.01;
for k = 1:20
  u(k+1) = u(k) - g(u(k))/gp(u(k));
end
diff = phi(u)-phi(1);

fprintf('Objective values converging to %g\n', phi(1));
fprintf('Writing iterates and objective diffs to file\n');
fp = fopen('../data/newton_osc.dat', 'w');
fprintf(fp, 'k u d\n');
fprintf(fp, '%d %e %e\n', [1:21; u; diff]);
fclose(fp);
