
# Code for Project 1, cs4220-s17

The MATLAB code in this repository is structured to work with both
MATLAB and Octave (otherwise I might have used the MATLAB OO features).
The code is nonetheless written in an object-oriented style, with
a MATLAB/Octave struct used to pass information about the problem
between the different routines.  We provide the following routines:

 - `ginterp_load`: Load a network file and form the associated object.
    By default, this loads the California road network from
    `roadNet-CA.txt` (which you should keep in the same directory
    as the codes).
 - `ginterp_addval`: Add boundary data to the network.
 - `ginterp_edit`: Update edge weights in the network.
 - `ginterp_eval0`: "first draft" code to compute `u` given boundary values
 - `ginterp_factor`: Factor part of the Laplacian
 - `ginterp_eval`: Use the factorization from `ginterp_factor` to compute `u`
 - `ginterp_deriv`: Compute a matrix of sensitivities of an entry of `u`
   to all edge weights.
 - `ginterp_check`: Check consistency of the `u` with the equations
 - `ginterp_bsys`: Helper to form border matrices

In addition, the `tester` script checks the correctness of the routines.
For this assignment, you will have to update `eval0`, `eval`, `factor`,
`bsys`, and `deriv`.

The object that is passed around between the routines includes the
following fields:

 - `L`: the graph Laplacian matrix
 - `n`: number of vertices
 - `na`: number of free vertices
 - `nb`: number of boundary conditions
 - `u`: field values
 - `edits`: weight updates; each row is [i,j,change]
 - `newbc`: new nodes where boundary conditions are applied
 - `R`: a sparse Cholesky factor computed by `ginterp_factor`

As given, each node in the graph has an index from 1 to n, and these
are the indices used in specifying edits and boundary conditions
and in accessing the u vector.  Internally, though, we may use a
different indexing that sorts boundary values to the end and
re-orders the free nodes to help make the Cholesky factor sparse.
For this reason, we also have two index vectors in the object structure:

 - `u2v`: u2v(j) is the vertex number associated with dof j
 - `v2u`: v2u(j) is the dof number associated with vertex j
