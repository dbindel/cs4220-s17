% Run this script from the same directory as roadNet-CA.mat
% to form the matrices used in the project.

load('roadNet-CA.mat');

% Form the adjacency matrix and trim dummy nodes
%
A = Problem.A;
n = length(A);
d = full(sum(A))';
I = find(d);
n = length(I);
d = d(I);
A = A(I,I);

% Pull out the strongly connected component
%
[S,C] = graphconncomp(A);
I = find(C == 1);
A = A(I,I);

% Write out as a tab delimited file
%
[i,j,w] = find(A);
rows = find(i > j);
fp = fopen('roadNet-CA.txt', 'w');
fprintf(fp, '%d\t%d\n', [i, j]');
fclose(fp);
