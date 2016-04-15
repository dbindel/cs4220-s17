[V,x,gammas] = blowupc();

% Write step size vs gamma
fp = fopen('dgammas.txt', 'w');
fprintf(fp, '%e %e\n', [gammas(1:end-1); gammas(2:end)-gammas(1:end-1)]);

% Write center point vs gamma
fp = fopen('vcenter.txt', 'w');
fprintf(fp, '%e %e\n', [gammas; V(26,:)]);

[V,x,gammas] = blowupmid();

fp = fopen('vcenterm.txt', 'w');
fprintf(fp, '%e %e\n', [gammas; V(26,:)]);
