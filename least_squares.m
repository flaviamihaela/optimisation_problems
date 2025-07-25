% Least Squares quadratic problem.
% This script constructs a random least squares minimization
% problem and solves it using CVX. In this case p =+2 implicitly, because 
% the Least Squares problem makes use of the Euclidian l2-norm to minimize
% the distance between Ax and b, when Ax=b which has no solution.

rng(0);

% Generate data
n = 10; 
m = 2*n;

A = randn(m,n);
b = randn(m,1);

% Create and solve problem
cvx_begin
   variable x(n)
   
   minimize( norm( A * x - b) )
   
cvx_end

solution_ana = A \ b;

% Display results
disp( sprintf( 'min norm(A*x-b):') );
disp( [ '   ans   =   ', sprintf( '%7.4f', x) ] );
disp( 'Analytical solution:' );
disp( [ '   solution_ana     = [ ', sprintf( '%7.4f ', solution_ana ), ']' ] );

