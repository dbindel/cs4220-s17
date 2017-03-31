[v,x,rhist] = blowupfp(0);

% Write convergence history to text file
fp = fopen('rhistfp.txt', 'w');
fprintf(fp, '%d %g\n', [0:length(rhist)-1; rhist]);
fclose(fp);

% Write solution plot to text file
fp = fopen('vplotfp.txt', 'w');
fprintf(fp, '%d %g\n', [x, v]');
fclose(fp);

alphas = [0, 10, 20, 40, 60];
for alpha = alphas
  [v,x,rhist] = blowup(alpha);

  % Save the convergence 
  figure;
  semilogy(rhist, '*');
  title('Residual history');
  xlabel('Iteration')
  ylabel('Residual norm');

  % Plot the solution
  figure;
  plot(x,v);
  title(sprintf('Solution for alpha=%g', alpha));

  % Write convergence history to text file
  fp = fopen(sprintf('rhist%g.txt', alpha), 'w');
  fprintf(fp, '%d %g\n', [0:length(rhist)-1; rhist]);
  fclose(fp);

  % Write solution plot to text file
  fp = fopen(sprintf('vplot%g.txt', alpha), 'w');
  fprintf(fp, '%d %g\n', [x, v]');
  fclose(fp);

end