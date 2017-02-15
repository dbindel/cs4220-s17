% [obj] = ginterp_load(fname)
%
% Load a tab-separated file of edges into a problem data structure.
%
% Input:
%   fname: Name of the input text file
%
% Output:
%   obj: Structure containing the obj data in the fields (see README)
%
function [obj] = ginterp_load(fname)

  if nargin < 1, fname = 'roadNet-CA.txt'; end

  % -- Load edge data
  ij = load(fname);
  nnz = size(ij,1);
  n = max(ij(:,1));

  % -- Form the adjacency and combinatorial Laplacian
  A = sparse(ij(:,1), ij(:,2), ones(nnz,1));
  d = full(sum(A,2));
  D = spdiags(d, 0, n, n);
  L = D-A;

  % -- Set up data structure
  obj = [];

  obj.n = n;  % Number of nodes
  obj.L = L;  % Graph Laplacian

  obj.u = zeros(n,1);  % Unknowns
  obj.u2v = (1:n)';    % Map from factorization dof indexing to vertices
  obj.v2u = (1:n)';    % Map from vertex indexing to factorization index
  obj.na = n; % Number of active dofs (at time of factorization)
  obj.nb = 0; % Number of constrained dofs (at time of factorization)

  obj.edits = [];  % Edge updates to apply to L ([i, j, w] per row)
  obj.newbc = [];  % Indices of nodes where new BCs should apply

end
